using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReservationData.DTO
{
    public class TableDTO
    {
        public string TableName { get; set; }

        public string TableRow { get; set; }

        public string TableColor { get; set; }
        public virtual List<SeatDTO> Seats { get; set; }
        
    }
}
