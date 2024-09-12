using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReservationData.DTO
{
    public class ReservationDTO
    {
        public int Id { get; set; }
        public bool IsBooked { get; set; }
        public DateTime BookedDate { get; set; }
        public int CustomerId { get; set; }
        public int GroupId { get; set; }
        public int TableId { get; set; }
        public int SeatId { get; set; }
        public int EventId { get; set; }
        public DateTime CreatedDate { get; set; }

    }

}
