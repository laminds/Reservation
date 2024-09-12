using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReservationData.Model
{
    public class Event
    {

        [Key]
        [Column("EventId")]
        public int Id { get; set; }

        public Guid Guid { get; set; }

        [Column(TypeName = "Varchar(100)")]
        public string EventName { get; set; }

        public DateTime EventDate { get; set; }

        public bool IsActive { get; set; }

        //public DateTime StartDate { get; set; }

        //public DateTime EndDate { get; set; }

        public DateTime BookingStartDate { get; set; }

        public DateTime BookingEndDate { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }


    }
}
