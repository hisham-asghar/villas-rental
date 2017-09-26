using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CustomModels.Yachts;
using LayerDAO;
using LayerDB;

namespace RentalsProject.Controllers
{
    [AuthorizeSession]
    public class YachtsController : Controller
    {
        //
        // GET: /Yachts/

        public ActionResult Index()
        {
            var list = YachtDAO.getYachts(0, 0);
            return View("YachtsList", list);
        }

        [HttpGet]
        public ActionResult AddNew()
        {
            var specsList = LayerDAO.YachtDAO.getSpecsList();
            ViewBag.Specs = specsList;
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddNew(HttpPostedFileBase banner,NewYachtModel model,List<string> YachtsImage)
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
            var specsList = YachtDAO.getSpecsList();

            var specs = specsList.Select(sp => new YachtSpecification()
            {
                Value = Request.Form[sp.SpecName],
                Specification = sp
            }).ToList();

            YachtDAO.SaveYacht(0, model, specs);


            ViewBag.Specs = specsList;
            return View();
        }
    }
}
