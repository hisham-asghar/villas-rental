using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CustomModels.Cars;
using CustomModels.Yachts;
using LayerDAO;
using RentalsClinet.Helpers;

namespace RentalsClinet.Controllers
{
    public class CarsController : Controller
    {
        //
        // GET: /Cars/

        public ActionResult Index(UserReuqestCar model)
        {
            if (Request.HttpMethod == "POST" && model != null)
            {
                var requestUrl = Request.Url;
                if (requestUrl != null)
                {
                    model.link = requestUrl.AbsoluteUri;
                    var domain = string.Format("{0}://{1}", requestUrl.Scheme, requestUrl.Authority);
                    EmailHelper.InquiryCars(model, Request.MapPath("~/App_Data/"));
                }
            }
            var token = Request.QueryString["token"];
            if (token == null) return View();
            var yacht = CarDAO.getCarDetail(token);
            return yacht != null ? View("Detail", yacht) : View();
        }
        public ActionResult Detail()
        {
            return View();
        }
        public ActionResult Luxury()
        {
            ViewBag.Token = "Luxury";
            var list = CarDAO.getCars(1);
            if (list == null) return View("Index");
            var dlist = new List<List<CarModel>>();

            var countAdded = 0;
            var pgno = 0;
            const int count = 3;
            while (countAdded < list.Count)
            {
                dlist.Add(list.Skip(pgno * count).Take(count).ToList());
                pgno++;
                countAdded += count;
            }
            return View("SubIndex", dlist);
        }
        public ActionResult Exotic()
        {
            ViewBag.Token = "Exotic";
            var list = CarDAO.getCars(0);
            if (list == null) return View("Index");
            var dlist = new List<List<CarModel>>();

            var countAdded = 0;
            var pgno = 0;
            const int count = 3;
            while (countAdded < list.Count)
            {
                dlist.Add(list.Skip(pgno * count).Take(count).ToList());
                pgno++;
                countAdded += count;
            }
            return View("SubIndex", dlist);
        }

    }
}
