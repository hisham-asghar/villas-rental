using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CustomModels
{
    public static class StaticData
    {
        public static List<string> YACHTS_URL { get; set; }
        public static List<string> MAGZINES_URL { get; set; }
        public static List<string> CARS_URL { get; set; }
        public static List<string> SERVICES_URL { get; set; }
        public static List<string> CITIES_URL { get; set; }
        public static List<string> VILLAS_URL { get; set; }
        public static List<string> OTHER_URLS { get; set; }
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
            OTHER_URLS = CustomModels.StaticDataGetter.GetOthersUrls();
            return true;

        }

        public static bool isExistAlready(string url)
        {
            url = LayerDAO.UrlMetaDAO.CorrectUrl(url);
            url = LinkTrimmer(url).ToLower();
            updateData();
            foreach (var p in YACHTS_URL)
            {
                var link = LinkTrimmer("Yachts/" + p);
                if (url == link.ToLower())
                    return true;
            }

            foreach (var p in MAGZINES_URL)
            {
                var link = LinkTrimmer("Magzines/" + p);
                if (url == link.ToLower())
                    return true;
            }

            foreach (var p in CARS_URL)
            {
                var link = LinkTrimmer("Cars/" + p);
                if (url == link.ToLower())
                    return true;
            }

            foreach (var p in SERVICES_URL)
            {
                var link = LinkTrimmer("Services/" + p);
                if (url == link.ToLower())
                    return true;
            }

            foreach (var p in CITIES_URL)
            {
                var link = LinkTrimmer(p);
                if (url == link.ToLower())
                    return true;
            }
            foreach (var p in VILLAS_URL)
            {
                var link = LinkTrimmer(p);
                if (url == link.ToLower())
                    return true;
            }
            foreach (var p in DESTINATION_VILLAS_URL)
            {
                var link = LinkTrimmer(p.Value + "/" + p.Key);
                if (url == link.ToLower())
                    return true;
            }

            foreach (var p in BOUGUS_URL)
            {
                var link = LinkTrimmer(p);
                if (url == link.ToLower())
                    return true;
            }

            return false;
        }

        private static string LinkTrimmer(string link)
        {
            if (link[0] == '/' && link.Length > 1)
                link = link.Substring(1);
            if (link[link.Length - 1] == '/')
                link = link.Substring(0, link.Length);
            return link;
        }
        public static List<string> GetOthersUrls()
        {
            return new List<string>()
            {
                "/Home/About/",
                "/Home/Contact/",
                "/homeowner/",
                "/Home/CONCIERGE/",
                "/Home/Testimonals",
                "/Home/FAQ",
                "/Home/EVENTS",
                "/Home/POLICY",
                "/Destinations/"
            };
        }
    }
}
