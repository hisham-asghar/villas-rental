using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AuthorizeMerchantLibrary.Models
{
    public class BillingAddress
    {
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string address { get; set; }
        public string city { get; set; }
        public string zip { get; set; }
        public string country { get; set; }
        public string email { get; set; }
        public string phoneNumber { get; set; }
        public string state { get; set; }
    }
}
