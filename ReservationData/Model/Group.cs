using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReservationData.Model
{
    public class Group
    {
        [Key]
        [Column("GroupId")]
        public int Id { get; set; }

        [Required]
        [Column(TypeName = "Varchar(50)")]
        public string GroupName { get; set; }

        public bool IsActive { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }

    }
}
