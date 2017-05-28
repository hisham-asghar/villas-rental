using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CustomModels.Yachts
{
    public class NewYachtModel
    {
        public string name { get; set; }
        public string description { get; set; }
        public string banner { get; set; }
        public List<string> YachtsImage { get; set; }
        public double length { get; set; }
    }
    public class UserReuqestYacht
    {
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string tel { get; set; }
        public string message { get; set; }
        public string email { get; set; }
        public string type { get; set; }
        public double budget { get; set; }
        public int guests { get; set; }
        public int days { get; set; }
        public DateTime date { get; set; }
        public string link { get; set; }
    }
}
