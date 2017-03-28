using System.Web.Mvc;
using Rentals.Models;

namespace RentalsProject.Controllers
{
    public class MyPropertyController : Controller
    {
        // GET: MyProperties
        public ActionResult Index()
        {
            var model = new MainModel();
            ViewBag.Model = model;
            return View();
        }

        public ActionResult Sample()
        {
            var model = new MainModel();
            ViewBag.Model = model;
            return null;
        }

        public ActionResult AddNew()
        {
            var model = new MainModel();
            ViewBag.Model = model;
            return View();
        }
        public ActionResult Edit()
        {
            var model = new MainModel();
            ViewBag.Model = model;
            return View();
        }
        public ActionResult AvailabilityAndPrices()
        {
            var model = new MainModel();
            ViewBag.Model = model;
            return View();
        }
        public ActionResult MultiCalendar()
        {
            var model = new MainModel();
            ViewBag.Model = model;
            return View();
        }
        public ActionResult AdvancedSettings()
        {
            var model = new MainModel();
            ViewBag.Model = model;
            return View();
        }
    }
}