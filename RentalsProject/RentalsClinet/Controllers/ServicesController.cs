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
            if (Request.Url == null || Request.Url.Segments.Length < 4) return RedirectToAction("Index");
            var serviceToken = Request.Url.Segments[3];
            if (serviceToken.Contains(' '))
                serviceToken = serviceToken.Replace(" ", "-");
            serviceToken = serviceToken.ToLower();
            var serivce = ServicesDao.Get(serviceToken);
            if (serivce == null) return RedirectToAction("Index");
            return View("Detail",serivce);
        }

    }
}
