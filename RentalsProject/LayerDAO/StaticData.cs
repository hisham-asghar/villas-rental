using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LayerDAO
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
        public static List<string> TAG_URLS { get; set; }
        public static List<string> CONTROLLERS_URLS { get; set; }
        public static Dictionary<string, string> BOUGUS_URL { get; set; }
        public static Dictionary<string, string> DESTINATION_VILLAS_URL { get; set; }

        public static bool updateData()
        {
            YACHTS_URL = YachtDAO.GetYachtsUrl();
            MAGZINES_URL = MagzineDAO.GetUrls();
            CARS_URL = CarDAO.GetUrls();
            SERVICES_URL = ServicesDao.GetServicesUrl();
            CITIES_URL = PropertyDAO.GetCitiesUrl();
            VILLAS_URL = PropertyDAO.GetVillasUrl();
            BOUGUS_URL = UrlMetaDAO.GetDic();
            DESTINATION_VILLAS_URL = PropertyDAO.GetDestinationVillasUrl();
            OTHER_URLS = GetOthersUrls();
            TAG_URLS = TagsDAO.GetUrls();
            CONTROLLERS_URLS = GetControllersUrls();
            return true;

        }

        private static List<string> GetControllersUrls()
        {
            return new List<string>()
            {
                "/Yachts",
                "/Magzines",
                "/Cars",
                "/Services",
                "/Destinations",
                "/Forwarder",
                "/Yachts/Index",
                "/Magzines/Index",
                "/Cars/Index",
                "/Services/Index",
                "/Destinations/Index",
                "/Forwarder/Index"
            };
        }

        public static bool IsExistAlready(string url)
        {
            url = UrlMetaDAO.CorrectUrl(url);
            url = LinkTrimmer(url).ToLower();
            updateData();

            return TAG_URLS.Select(p => LinkTrimmer(p).ToLower()).Any(link => link == url) ||
                   (CONTROLLERS_URLS.Select(p => LinkTrimmer(p).ToLower()).Any(link => url == link) ||
                    (YACHTS_URL.Select(p => LinkTrimmer("Yachts/" + p)).Any(link => url == link.ToLower()) ||
                     (MAGZINES_URL.Select(p => LinkTrimmer("Magzines/" + p)).Any(link => url == link.ToLower()) ||
                      (CARS_URL.Select(p => LinkTrimmer("Cars/" + p)).Any(link => url == link.ToLower()) ||
                       (SERVICES_URL.Select(p => LinkTrimmer("Services/" + p)).Any(link => url == link.ToLower()) ||
                        (CITIES_URL.Select(p => LinkTrimmer(p).ToLower()).Any(link => url == link.ToLower()) ||
                         (VILLAS_URL.Select(p => LinkTrimmer(p).ToLower()).Any(link => url == link.ToLower()) ||
                          (DESTINATION_VILLAS_URL.Select(p => LinkTrimmer(p.Value + "/" + p.Key))
                               .Any(link => url == link.ToLower()) || BOUGUS_URL.Select(p => LinkTrimmer(p.Key))
                               .Any(link => url == link.ToLower())))))))));
        }

        public static string LinkTrimmer(string link)
        {
            char[] charsToTrim = { '/' };
            return link.Trim(charsToTrim);
        }

        public static List<string> GetOthersUrls()
        {
            return new List<string>()
            {                
                "Index",
                "About",
                "Contact",
                "CONCIERGE",
                "Testimonals",
                "FAQ",
                "EVENTS",
                "POLICY",
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
        public static List<string> GetHomeUrls()
        {
            return new List<string>()
            {
                "Index",
                "About",
                "Contact",
                "CONCIERGE",
                "Testimonals",
                "FAQ",
                "EVENTS",
                "POLICY"
            };
        }
    }
}
