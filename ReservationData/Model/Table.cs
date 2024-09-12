using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReservationData.Model
{
    public class Table
    {
        [Key]
        [Column("TableId")]
        public int TableId { get; set; }

        [Column(TypeName ="varchar(50)")]
        public string TableName { get; set; }

        [Column(TypeName = "varchar(20)")]

        public string TableRow { get; set; }

        public string TableColor { get; set; }

        public int GroupId { get; set; }
        public virtual Group Group { get; set; }
        public virtual List<Seat> Seats { get; set; }

    }
}
