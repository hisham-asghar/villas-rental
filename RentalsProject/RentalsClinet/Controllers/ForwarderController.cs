using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RentalsClinet.Controllers
{
    public class ForwarderController : Controller
    {
        //
        // GET: /Forwarder/

        public ActionResult Index()
        {
            foreach(var url in LayerDAO.StaticData.BOUGUS_URL)
            {
                if (Helpers.CustomFunctions.LinkComaprer(Request.RawUrl, url.Key))
                    return RedirectPermanent(url.Value);
            }
            return RedirectToAction("Index","Home");
        }

    }
}
