using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReservationData.Model
{
    public class Customer
    {
        [Key]
        [Column("CustomerId")]
        public int Id { get; set; }

        public Guid Guid { get; set; }

        [Column(TypeName ="Varchar(200)")]
        public string FullName { get; set; }

        [Column(TypeName = "Varchar(50)")]
        public string EmployeeCode { get; set; }

        [Required]
        [Column(TypeName = "Varchar(100)")]
        public string Email { get; set; }

        public string PhoneNo { get; set; }

        public bool Active { get; set; }

        public int GroupId { get; set; }
        public virtual Group Group { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }

       


    }
}
