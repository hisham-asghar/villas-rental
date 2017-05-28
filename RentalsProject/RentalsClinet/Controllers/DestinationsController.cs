using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LayerDAO;

namespace RentalsClinet.Controllers
{
    public class DestinationsController : Controller
    {
        //
        // GET: /Destinations/

        public ActionResult Index()
        {
            var token = Request.QueryString["token"];
            if (token == null)
            {
                var cities = PropertyDAO.getCities();
                return View("CityIndex", cities);
            }
            int cnt = 0;
            var list = PropertyDAO.getPropertyList(cnt,token);
            if(list == null)
            {
                return RedirectToAction("Index");
            }
            foreach (var p in list)
            {
                var sum = p.rates.Sum(pt => pt.price);
            }
            return View(list);
        }
        public ActionResult Detail()
        {
            var id = Request.QueryString["id"];
            if (id != null)
            {
                try
                {
                    var _id = Convert.ToInt32(id);
                    CustomModels.PropertiesModelGetter model = PropertyDAO.getPropertyById(_id);
                    if(model != null)
                        return View(model);
                    else
                        return RedirectToAction("Index");
                }
                catch (Exception e)
                {
                    // ignored
                }
            }
            int cnt = 0;
            List<CustomModels.PropertiesModelGetter> list = PropertyDAO.getPropertyList(cnt);
            return View("Index",list);
        }

    }
}
