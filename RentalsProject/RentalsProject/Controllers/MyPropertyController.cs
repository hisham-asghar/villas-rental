using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Mvc;
using CustomModels;
using LayerDAO;
using LayerDB;
using RentalsProject.Models;

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

        [HttpGet]
        public ActionResult AddNew()
        {
            ViewBag.propertyTypes = PropertyDAO.getPropertyType();
            ViewBag.amenitiesTypes = PropertyDAO.getAmenitiesType();
            ViewBag.TagTypes = PropertyDAO.getPropertyTags();
            ViewBag.cities = PropertyDAO.getCities();
            var model = new MainModel();
            ViewBag.Model = model;
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddNewProperty(PropertiesModel model, List<HttpPostedFileBase> files, List<string> PropertyImages,HttpPostedFileBase banner)
        {
            if (model.ImagesList == null)
                model.ImagesList = new List<string>();
            if(PropertyImages != null)
                foreach (var pic in PropertyImages)
                {
                   // model.ImagesList.Add(pic);
                }
            if(files != null)
            {
                foreach (var pic in files)
                {
                    if ((pic != null) && (pic.ContentLength > 0))
                    {
                        try
                        {
                            var fileName = Guid.NewGuid() + ".pdf";
                            
                            var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                            pic.SaveAs(path);
                            model.pdfFile = fileName;
                        }
                        catch (Exception ex)
                        {
                            ViewBag.Message = "ERROR:" + ex.Message;
                        }
                    }
                }
            }
            if(banner != null)
            {
                var pic = banner;
                if ((pic != null) && (pic.ContentLength > 0))
                {
                    try
                    {
                        var fileName = Guid.NewGuid() + ".jpg";

                        var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                        pic.SaveAs(path);
                        model.banner = fileName;
                    }
                    catch (Exception ex)
                    {
                        ViewBag.Message = "ERROR:" + ex.Message;
                    }
                }
            }
            PropertyDAO.saveProperty(model);

            ViewBag.propertyTypes = PropertyDAO.getPropertyType();
            ViewBag.amenitiesTypes = PropertyDAO.getAmenitiesType();
            ViewBag.TagTypes = PropertyDAO.getPropertyTags();
            ViewBag.cities = PropertyDAO.getCities();

            var model_ = new MainModel();
            ViewBag.Model = model_;
            return View("AddNew");
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