﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReservationData.DTO
{
    public class IntialRequestDTO
    {
        public Guid CustomerId { get; set; }

        public Guid EventId { get; set; }
    }
}
