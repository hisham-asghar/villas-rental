using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using LayerDAO;
using LayerDB;
using Newtonsoft.Json;

namespace RentalsClinet.Controllers
{
    public class homeownerController : Controller
    {
        //
        // GET: /homeowner/

        public ActionResult Index(HomeOwner model)
        {
            if (Request.HttpMethod == "POST")
            {
                HomeOwnerDAO.Save(model);
                Helpers.EmailHelper.SendHomeOwnerMail(model);
            }
            var mainMetas = SiteMetaDAO.getMetaChilds("Contact_Page");
            ViewBag.location = CustomModels.Helper.getDicData(mainMetas, "contact_location");
            ViewBag.phone = CustomModels.Helper.getDicData(mainMetas, "contact_phone");
            ViewBag.FAQs = FAQDAO.getAll(1) ?? new List<FAQ>();
            var url = "http://api.geonames.org/countryInfoJSON?formatted=true&username=themarucagroup";
            var request = WebRequest.Create(url);
            var countriesList = new List<KeyValuePair<string, string>>();
            string text = null;
            var response = (HttpWebResponse)request.GetResponse();
            if (response != null)
            {
                using (var sr = new StreamReader(response.GetResponseStream()))
                {
                    text = sr.ReadToEnd();
                    dynamic json = JsonConvert.DeserializeObject(text);
                    var ListCountries = json.geonames;
                    foreach (var cnt in ListCountries)
                    {
                        string code = cnt.geonameId;
                        string name = cnt.countryName;
                        countriesList.Add(new KeyValuePair<string, string>(code,name));
                    }
                }
            }
            var countries = countriesList;
            countries = countries.OrderBy(c => c.Value).ToList();
            ViewBag.Countries = countries;
            var countryFirst = countries.FirstOrDefault();
            if (countryFirst.Key != null)
            {
                var cityList = new List<KeyValuePair<string, string>>();
                string textCity = null;

                var url2 = "http://api.geonames.org/childrenJSON?geonameId={0}&username=themarucagroup&formatted=true";
                url2 = String.Format(url2,countryFirst.Key);    
                var request2 = WebRequest.Create(url2);

                var responseCity = (HttpWebResponse)request2.GetResponse();
                if (responseCity != null)
                {
                    using (var sr = new StreamReader(responseCity.GetResponseStream()))
                    {
                        textCity = sr.ReadToEnd();
                        dynamic json = JsonConvert.DeserializeObject(textCity);
                        var ListCity = json.geonames;
                        foreach (var cnt in ListCity)
                        {
                            string name = cnt.name;
                            cityList.Add(new KeyValuePair<string, string>(name, name));
                        }
                    }
                }

                ViewBag.cities = cityList;
            }
            return View("HomeOwnerIndex");
        }


    }
}
