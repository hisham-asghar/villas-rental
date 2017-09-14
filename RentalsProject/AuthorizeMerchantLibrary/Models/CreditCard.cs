using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AuthorizeMerchantLibrary.Models
{
    public class CreditCard
    {
        public string name { get; set; }
        public string cardNumber { get; set; }
        public string expirationDate { get; set; }
        public string cardCode { get; set; }
    }
}
