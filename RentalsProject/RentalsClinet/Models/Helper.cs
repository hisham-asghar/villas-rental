using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RentalsClinet.Models
{
    public static class Helper
    {
        public static string getResourceLocation()
        {
            var conf2 = System.Configuration.ConfigurationSettings.AppSettings["resourcesLocation"];
            var conf = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(null);
            if (conf.AppSettings.Settings.Count <= 0) return "";
            var customSetting = conf.AppSettings.Settings["resourcesLocation"];
            return customSetting != null ? customSetting.Value : "";
        }
    }
}