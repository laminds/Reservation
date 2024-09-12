using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReservationData.DTO
{
    public class SeatDTO
    {
        public int Id { get; set; }
        public string SeatName { get; set; }
        public string SeatColor { get; set; }
        public bool IsBooked { get; set; }
        public bool IsAvailable { get; set; }
        public string ReservedCustomerName { get; set; }
    }
}
