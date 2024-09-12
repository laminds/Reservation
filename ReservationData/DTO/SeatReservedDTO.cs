using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReservationData.DTO
{
    public class SeatReservedDTO
    {
        public Guid CustomerId { get; set; }
        public Guid EventId { get; set; }
        public int SeatId { get; set; }

    }
}
