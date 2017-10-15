using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RentalsClinet.Helpers
{
    public static class StaticData
    {

        public static List<string> YACHTS_URL { get; set; }
        public static List<string> MAGZINES_URL { get; set; }
        public static List<string> CARS_URL { get; set; }
        public static List<string> SERVICES_URL { get; set; }
        public static List<string> CITIES_URL { get; set; }
        public static List<string> VILLAS_URL { get; set; }
        public static Dictionary<string, string> BOUGUS_URL { get; set; }
        public static Dictionary<string, string> DESTINATION_VILLAS_URL { get; set; }

        public static bool updateData()
        {
            YACHTS_URL = LayerDAO.YachtDAO.GetYachtsUrl();
            MAGZINES_URL = LayerDAO.MagzineDAO.GetUrls();
            CARS_URL = LayerDAO.CarDAO.GetUrls();
            SERVICES_URL = LayerDAO.ServicesDao.GetServicesUrl();
            CITIES_URL = LayerDAO.PropertyDAO.GetCitiesUrl();
            VILLAS_URL = LayerDAO.PropertyDAO.GetVillasUrl();
            BOUGUS_URL = LayerDAO.UrlMetaDAO.GetDic();
            DESTINATION_VILLAS_URL = LayerDAO.PropertyDAO.GetDestinationVillasUrl();
            return true;
        }
    }
}