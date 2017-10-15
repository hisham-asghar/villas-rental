using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Cache;
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
            ViewBag.active = true;
            var model = new MainModel();
            ViewBag.Model = model;
            if (!string.IsNullOrWhiteSpace(Request.QueryString["city"]) && !string.IsNullOrWhiteSpace(Request.QueryString["token"]))
            {
                var list2 = PropertyDAO.GetPropertyList(0, Request.QueryString["city"]);
                if (list2 != null)
                    return View("PropertyList", list2);
            }
            var list = PropertyDAO.GetPropertyList(0);

            return View("PropertyList", list);
        }


        // GET: MyProperties
        public ActionResult JSONTest()
        {
            var list = LayerDAO.PropertyDAO.GetLast(5);
            return Json(list,JsonRequestBehavior.AllowGet);
        }

        // GET: MyProperties
        public ActionResult DeactivedVillas()
        {
            var model = new MainModel();
            ViewBag.Model = model;
            ViewBag.active = false;
            var list = PropertyDAO.GetDeactivatedPropertyList(0);
            return View("PropertyList", list);
        }
        
        public ActionResult Sample()
        {
            var model = new MainModel();
            ViewBag.Model = model;
            return null;
        }
        
        public ActionResult RenewRates(List<RateModel> rates, int id = 0)
        {
            if (id == 0 && !PropertyDAO.Verify(id))
            {
                return RedirectToAction("Index");
            }
            if (Request.HttpMethod == "POST")
            {
                int x = 0;
                var list = new List<PropertyRentalBudgetDetail>();
                foreach (var r in rates)
                {
                    var sd = new DateTime(DateTime.Now.Year, r.sd.Month, r.sd.Day);
                    var ed = new DateTime(DateTime.Now.Year, r.ed.Month, r.ed.Day);
                    var t = new PropertyRentalBudgetDetail()
                    {
                        onCreated = DateTime.Now,
                        onModified = DateTime.Now,
                        PropertyId = id,
                        Price = r.price,
                        EndDate = ed,
                        StartDate = sd,
                        SeasonName = r.SeasonName
                    };
                    list.Add(t);
                }
                if (list.Count > 0)
                {
                    PropertyDAO.UpdateRates(list, id);
                }
                ViewBag.list = list;
                ViewBag.rates = rates;
            }
            var rentalsList = PropertyDAO.GetPropertyRentalDetails(id);
            ViewBag.property = PropertyDAO.GetProperty(id);
            return View("RenewRates",rentalsList);
        }

        public ActionResult Deactivate(int id = 0)
        {
            if (id != 0)
            {
                PropertyDAO.Deactive(id,false);
            }
            return RedirectToAction("Index");
        }

        public ActionResult Activate(int id = 0)
        {
            if (id != 0)
            {
                PropertyDAO.Deactive(id,true);
            }
            return RedirectToAction("DeactivedVillas");
        }

        public ActionResult City(City model,HttpPostedFileBase pic,int id = 0)
        {
            if (Request.Url != null && Request.Url.Segments.Length > 3 && !string.IsNullOrWhiteSpace(Request.Url.Segments[3]))
            {
                if (Request.HttpMethod == "POST")
                {
                    if (model != null)
                    {
                        if (pic != null && pic.ContentLength > 0)
                        {
                            try
                            {
                                var fileName = Guid.NewGuid() + ".jpg";
                                var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                                pic.SaveAs(path);
                                model.banner = fileName;
                            }
                            catch (Exception)
                            {
                               // model.banner = "";
                            }
                        }
                        PropertyDAO.SaveCity(model);
                        return RedirectToAction("City");
                    }
                }
                else
                {
                    if (Request.Url.Segments[3] == "Add")
                    {
                        return View("CityEdit", new City());
                    }
                    var city = PropertyDAO.GetCity(Request.Url.Segments[3]);
                    if (city != null)
                    {
                        return View("CityEdit", city);
                    }
                }
            }
            else if (id > 0)
            {
                if (Request.HttpMethod == "POST")
                {
                    if (model != null)
                    {
                        if (pic != null && pic.ContentLength > 0)
                        {
                            try
                            {
                                var fileName = Guid.NewGuid() + ".jpg";
                                var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                                pic.SaveAs(path);
                                model.banner = fileName;
                            }
                            catch (Exception)
                            {
                                // model.banner = "";
                            }
                        }
                        PropertyDAO.SaveCity(model);
                        return RedirectToAction("City");
                    }
                }
                else
                {
                    var city = PropertyDAO.GetCity(id);
                    if (city != null)
                    {
                        return View("CityEdit", city);
                    }
                }
            }
            var cities = PropertyDAO.GetCities();
            return View("City",cities);
        }

        [HttpGet]
        public ActionResult AddNew()
        {
            ViewBag.propertyTypes = PropertyDAO.GetPropertyType();
            ViewBag.amenitiesTypes = PropertyDAO.GetAmenitiesType();
            ViewBag.TagTypes = PropertyDAO.GetPropertyTags();
            ViewBag.cities = PropertyDAO.GetCities();
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
            PropertyDAO.SaveProperty(model);

            ViewBag.propertyTypes = PropertyDAO.GetPropertyType();
            ViewBag.amenitiesTypes = PropertyDAO.GetAmenitiesType();
            ViewBag.TagTypes = PropertyDAO.GetPropertyTags();
            ViewBag.cities = PropertyDAO.GetCities();

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
        
        public ActionResult UpdateExtras(UpdateExtraModel emodel,int id = 0)
        {
            var getModel = PropertyDAO.GetExtraModel(id);
            if (Request.HttpMethod == "POST")
            {
                var pic = emodel.banner;
                if (pic != null && (pic.ContentLength > 0))
                {
                    try
                    {
                        var fileName = Guid.NewGuid() + ".jpg";

                        var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                        pic.SaveAs(path);
                        emodel.bannerUrl = fileName;
                    }
                    catch (Exception ex)
                    {
                        ViewBag.Message = "ERROR:" + ex.Message;
                    }
                }
                pic = emodel.pdf;
                if (pic != null && (pic.ContentLength > 0))
                {
                    try
                    {
                        var fileName = Guid.NewGuid() + ".pdf";
                        var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                        pic.SaveAs(path);
                        emodel.pdfUrl = fileName;
                    }
                    catch (Exception ex)
                    {
                        ViewBag.Message = "ERROR:" + ex.Message;
                    }
                }
                if (PropertyDAO.SaveExtraModel(id, emodel))
                {
                    return RedirectToAction("Index");
                }
            }
            var model = new MainModel();
            ViewBag.Model = model;
            return View("UpdateExtras",getModel);
        }


        public ActionResult UpdateBasicInfo(PropertyBasicInfo model, int id = 0)
        {
            var getModel = PropertyDAO.GetBasicInfoModel(id);
            if (Request.HttpMethod == "POST")
            {
                
                if (PropertyDAO.SaveBasicInfoModel(id, model))
                {
                    return RedirectToAction("Index");
                }
            }
            ViewBag.propertyTypes = PropertyDAO.GetPropertyType();
            ViewBag.cities = PropertyDAO.GetCities();
            return View("UpdateBasicInfo", getModel);
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