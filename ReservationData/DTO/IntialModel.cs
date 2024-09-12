using ReservationData.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReservationData.DTO
{
    public class InitialReservationViewModel
    {
        public EventDTO Event { get; set; }
        public CustomerDTO Customer { get; set; }
        public string ReservationSeatNo { get; set; }
        public List<TableDTO> Tables { get; set; }
    }
}
