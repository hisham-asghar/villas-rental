using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CustomModels.Cars;
using LayerDAO;
using LayerDB;

namespace RentalsProject.Controllers
{
    public class CarsController : Controller
    {
        //
        // GET: /Cars/

        public ActionResult Index()
        {
            var list = CarDAO.getCars(-1);
            return list != null ? View("CarsList",list) : View();
        }


        [HttpGet]
        public ActionResult AddNew()
        {
            var specsList = CarDAO.getSpecsList();
            ViewBag.Specs = specsList;
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddNew(HttpPostedFileBase banner, NewCarModel model, List<string> YachtsImage)
        {
            var pic = banner;
            if (pic != null && pic.ContentLength > 0)
            {
                try
                {
                    var fileName = Guid.NewGuid() + ".jpg";
                    var path = Path.Combine(Server.MapPath("~/uploads"), fileName);

                    //dao.SavePost(model);
                    pic.SaveAs(path);
                    ViewBag.Message = "File uploaded successfully";
                    model.banner = fileName;
                }
                catch (Exception ex)
                {
                    ViewBag.Message = "ERROR:" + ex.Message;
                }
            }
            model.YachtsImage = YachtsImage;
            var specsList = CarDAO.getSpecsList();

            var specs = specsList.Select(sp => new CarSpecification()
            {
                Value = Request.Form[sp.SpecName],
                Specification = sp
            }).ToList();

            CarDAO.SaveYacht(0, model, specs);


            ViewBag.Specs = specsList;
            return View();
        }

    }
}
