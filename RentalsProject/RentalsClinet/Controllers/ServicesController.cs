using System.Linq;
using System.Web.Mvc;
using LayerDAO;

namespace RentalsClinet.Controllers
{
    public class ServicesController : Controller
    {
        //
        // GET: /Services/

        public ActionResult Index()
        {
            var list = ServicesDao.GetAll();
            return View("Index",list);
        }
        public ActionResult Detail()
        {
            if (Request.Url == null || Request.Url.Segments.Length < 3) return RedirectToAction("Index");
            var serviceToken = Request.Url.Segments[2];
            if (serviceToken.Contains(' '))
                serviceToken = serviceToken.Replace(" ", "-");
            serviceToken = serviceToken.ToLower();
            serviceToken = Helpers.CustomFunctions.LinkModifier(serviceToken);
            var serivce = ServicesDao.Get(serviceToken);
            if (serivce == null) return RedirectToAction("Index");
            return View("Detail",serivce);
        }

    }
}
