
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using ReservationData.DatabaseContext;
using ReservationData.DTO;
using ReservationData.IService;
using ReservationData.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReservationData.Repository
{
    public class ReservationRespository : IReservation
    {
        private readonly ReservationContext _db;
        private readonly IMapper _mapper;
        public ReservationRespository(ReservationContext reservationContext, IMapper mapper)
        {
            _db = reservationContext;
            _mapper = mapper;

        }
        public async Task<InitialReservationViewModel> GetInitialReservationData(Guid CustomerId, Guid EventId)
        {
            var result = new InitialReservationViewModel();
            var eventDetail = await GetAllEvents(EventId);
            if (eventDetail != null)
            {
                var customerDetail = await GetCustomer(CustomerId);
                if (customerDetail != null)
                {
                    result.Event = _mapper.Map<EventDTO>(eventDetail);
                    result.Customer = _mapper.Map<CustomerDTO>(customerDetail);
                    result.ReservationSeatNo = _db.Reservations.Where(x => x.CustomerId == customerDetail.Id && x.EventId == eventDetail.Id).Select(x => x.Table.TableName + "-" + x.Seat.SeatName).FirstOrDefault();
                    if(string.IsNullOrEmpty(result.ReservationSeatNo))
                    {
                        result.Tables = await GetTables(eventDetail.Id, customerDetail.GroupId);
                    }
                }
            }

            return result;
        }


        public async Task<Event> GetAllEvents(Guid EventId)
        {
            var result = await _db.Events.Where(x => x.Guid == EventId).FirstOrDefaultAsync();
            if (result == null)
            {
                return null;

            }
            //if(DateTime.Now >= result.BookingStartDate && DateTime.Now <= result.BookingEndDate)
            //{
            //    return result;
            //}
            return result;
        }

        public async Task<List<TableDTO>> GetTables(int eventId, int groupId)
        {

            var result = await _db.Tables.Include(x => x.Seats).ToListAsync();
            foreach (var obj in result)
            {
                obj.TableColor = groupId != obj.GroupId ? "#BEBEBE" : obj.TableColor;
                obj.Seats = (from s in obj.Seats
                             join r in _db.Reservations on new { x1 = s.Id, x2 = eventId } equals new { x1 = r.SeatId, x2 = r.EventId }
                             into Details
                             from m in Details.DefaultIfEmpty()
                             join c in _db.Customers on  m?.CustomerId equals c.Id
                             into CustomerDetail
                             from cd in CustomerDetail.DefaultIfEmpty()
                             select new Seat
                             {
                                 Id = s.Id,
                                 IsBooked = m != null && m.SeatId > 0 ? true : false,
                                 IsAvailable = groupId == obj.GroupId ? true : false,
                                 SeatColor = groupId != obj.GroupId ? "NotEligible" : (m != null && m.SeatId > 0) ? "SeatBooked" : "UnReserved",
                                 SeatName = s.SeatName,
                                 ReservedCustomerName = cd != null ? cd.FullName : null
                             }).ToList();
            }
            return _mapper.Map<List<TableDTO>>(result);
        }

        public async Task<Customer> GetCustomer(Guid CustomerId)
        {
            var result = await _db.Customers.Where(x => x.Guid == CustomerId).FirstOrDefaultAsync();
            if (result == null)
            {
                return null;
            }
            return result;

        }


        public async Task<(ReservationDTO, string Message)> ReserveSeat(SeatReservedDTO seat)
        {

            ReservationDTO reservation = new ReservationDTO();

            var customerObj = _db.Customers.Where(x => x.Guid == seat.CustomerId).FirstOrDefault();
            var eventId = _db.Events.Where(x => x.Guid == seat.EventId).Select(x => x.Id).FirstOrDefault();
            var seatObj = _db.Seats.Where(x => x.Id == seat.SeatId).FirstOrDefault();

            if (customerObj != null && eventId > 0 && seatObj != null)
            {
                var IsReserved = _db.Reservations.Where(x => x.SeatId == seat.SeatId && x.EventId == eventId).Any();
                if (!IsReserved)
                {
                    Reservation res = new Reservation();
                    res.IsBooked = true;
                    res.BookedDate = DateTime.Now;
                    res.CustomerId = customerObj.Id;
                    res.GroupId = customerObj.GroupId;
                    res.TableId = seatObj.TableId;
                    res.SeatId = seat.SeatId;
                    res.EventId = eventId;
                    res.CreatedDate = DateTime.Now;
                    await _db.Reservations.AddAsync(res);
                    _db.SaveChanges();
                    return (_mapper.Map<ReservationDTO>(res), "Success");
                }
                else
                {
                    return (reservation, "Already Reserved");
                }

            }
            else
            {
                return (reservation, "Not Found");
            }



        }



    }
}
