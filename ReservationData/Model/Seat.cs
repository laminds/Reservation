using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReservationData.Model
{
    public class Seat
    {
        [Key]
        [Column("SeatId")]
        public int Id { get; set; }

        [Column(TypeName = "Varchar(20)")]
        public string SeatName { get; set; }
        public string SeatColor { get; set; }
        public bool IsActive { get; set; }

        [NotMapped]
        public bool IsAvailable { get; set; }

        [NotMapped]
        public bool IsBooked { get; set; }
        [NotMapped]
        public string ReservedCustomerName { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int TableId { get; set; }
        public virtual Table Table { get; set; }
        public Seat()
        {
            IsActive = false;
            CreatedDate = DateTime.Now;
        }
    }

   
}
