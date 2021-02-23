using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VWNewsclipApp.Models
{
    public class Car
    {
        public int SubModel_ID { get; set; }

        public string Model_Description { get; set; }
        public string SubModel_Description { get; set; }
        public int Stock { get; set; }
        public int Price { get; set; }
    }
}