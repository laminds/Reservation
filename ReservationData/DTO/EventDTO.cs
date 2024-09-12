using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReservationData.DTO
{
    public class EventDTO
    {
        public Guid Guid { get; set; }

        public string EventName { get; set; }

        public DateTime EventDate { get; set; }

    }
}
