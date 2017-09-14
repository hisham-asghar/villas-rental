using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AuthorizeMerchantLibrary.Models
{
    public class VillaTransactionSlip
    {
        public int days { get; set; }
        public string villa { get; set; }
        public double villaPerDayPrice { get; set; }
        public double houseKeeping { get; set; }
        public double privateCheff { get; set; }
        public double bedsPrice { get; set; }
        public double TotalPrice { get; set; }
        public double TotalPriceWithTax { get; set; }
        public double TotalPriceWithTaxTransaction { get; set; }
    }
}
