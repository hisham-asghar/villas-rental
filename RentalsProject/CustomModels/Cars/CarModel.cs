using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CustomModels.Yachts;

namespace CustomModels.Cars
{
    public class CarModel
    {
        public int id { get; set; }
        public string guid { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public string banner { get; set; }
        public double priceOneDay { get; set; }
        public double priceThreeDays { get; set; }
        public double priceWeek { get; set; }
        public int Type { get; set; }
    }
    public class CarModelDetail : CarModel
    {
        public List<Spec> specs { get; set; }
        public List<string> images { get; set; }
    }
}
