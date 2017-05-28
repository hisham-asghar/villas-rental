using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CustomModels.Yachts
{
    public class YachtModel
    {
        public int id { get; set; }
        public string guid { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public string banner { get; set; }
        public double length { get; set; }
    }
    public class YachtModelDetail : YachtModel
    {
        public List<Spec> specs { get; set; }
        public List<string> images { get; set; }
    }
}
