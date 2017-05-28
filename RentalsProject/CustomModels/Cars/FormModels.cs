using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CustomModels.Cars
{

    public class NewCarModel
    {
        public string name { get; set; }
        public string description { get; set; }
        public string banner { get; set; }
        public int Type { get; set; }
        public List<string> YachtsImage { get; set; }
        public double priceOneDay { get; set; }
        public double priceThreeDays { get; set; }
        public double priceWeek { get; set; }
    }
    public class UserReuqestCar
    {
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string tel { get; set; }
        public string message { get; set; }
        public string email { get; set; }
        public double budget { get; set; }
        public DateTime date { get; set; }
        public string link { get; set; }
    }
}
