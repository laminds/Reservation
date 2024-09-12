using AutoMapper;
using ReservationData.DTO;
using ReservationData.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReservationData.AutoMapperProfile
{
    public class MapperProfile : Profile
    {
        public MapperProfile()
        {
            CreateMap<Table, TableDTO>();
            CreateMap<Seat, SeatDTO>();
            CreateMap<Event, EventDTO>();
            CreateMap<Customer, CustomerDTO>();
            CreateMap<Reservation, ReservationDTO>();
        }
    }
}
