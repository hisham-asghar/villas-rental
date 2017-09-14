using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using Newtonsoft.Json;

namespace RentalsClinet.Helpers
{
    public class CustomActions
    {
        public List<LayerDB.City> getCities()
        {
            return LayerDAO.PropertyDAO.GetCities();
        }
        public static string getMerchantLocation()
        {
            return System.Configuration.ConfigurationManager.AppSettings["MerchantLoc"];
        }
        public static string getUploadLocation()
        {
            return System.Configuration.ConfigurationManager.AppSettings["uploadLoc"];
        }
        public static string getGodaddyLocation()
        {
            return System.Configuration.ConfigurationManager.AppSettings["SecLoc"];
        }
        public static string getGodaddyEmailLocation()
        {
            return System.Configuration.ConfigurationManager.AppSettings["MailLoc"];
        }

        public static string getEmailLocation()
        {
            return System.Configuration.ConfigurationManager.AppSettings["emailOfc"];
        }
    }
}