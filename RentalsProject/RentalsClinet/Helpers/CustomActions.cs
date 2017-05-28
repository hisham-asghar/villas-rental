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
            return LayerDAO.PropertyDAO.getCities();
        }
        public static string getUploadLocation()
        {
            return System.Configuration.ConfigurationManager.AppSettings["uploadLoc"];
        }
    }
}