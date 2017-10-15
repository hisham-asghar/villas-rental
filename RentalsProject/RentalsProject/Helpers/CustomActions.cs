using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using Newtonsoft.Json;

namespace RentalsProject.Helpers
{
    public class CustomActions
    {
        public static string getUpdateDataLocation()
        {
            return System.Configuration.ConfigurationManager.AppSettings["UpdateDataLink"];
        }
    }
}