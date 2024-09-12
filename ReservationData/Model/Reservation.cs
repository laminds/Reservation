using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReservationData.Model
{
    public class Reservation
    {
        [Key]
        [Column("ReservationId")]
        public int Id { get; set; }
        public bool IsBooked { get; set; }
        public DateTime BookedDate { get; set; }
        public int CustomerId { get; set; }
        public int GroupId { get; set; }
        public int TableId { get; set; }
        public int SeatId { get; set; }
        public int EventId { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual Group Group { get; set; }
        public virtual Table Table { get; set; }
        public virtual Seat Seat { get; set; }
        public virtual Event Event { get; set; }
        public DateTime CreatedDate { get; set; }

        public Reservation()
        {
            IsBooked = false;
            CreatedDate = DateTime.Now;
        }
    }
}
