using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Rentals.Models
{
    public class MainModel
    {
        public string WebsiteTitle { get; set; }

        public MainModel()
        {
            WebsiteTitle = "RentalsUnited";
        }
    }
}