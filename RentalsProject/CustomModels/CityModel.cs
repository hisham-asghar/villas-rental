using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CustomModels
{
    public class CityModel
    {
        public int CityId { get; set; }
        public string CityName { get; set; }
        public string guid { get; set; }
        public string banner { get; set; }
        public double longitude { get; set; }
        public double latitude { get; set; }
        public string Address { get; set; }
    }
}
