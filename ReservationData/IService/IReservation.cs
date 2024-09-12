using ReservationData.DTO;
using ReservationData.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReservationData.IService
{
    public interface IReservation
    {

        Task<InitialReservationViewModel> GetInitialReservationData(Guid CustomerId, Guid EventId);

        Task<(ReservationDTO, string Message)> ReserveSeat(SeatReservedDTO seat);

    }
}
