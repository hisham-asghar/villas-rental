using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RentalsProject.Controllers
{
    public class ServicesController : Controller
    {
        //
        // GET: /Services/

        public ActionResult Index()
        {
            var list = LayerDAO.ServicesDao.GetAll();
            return View(list);
        }

        public ActionResult Update(HttpPostedFileBase header,HttpPostedFileBase small,LayerDB.Service model,int id = 0)
        {
            if (Request.HttpMethod == "POST" && model != null)
            {
                model.ImageHeader = SaveImage(header);
                model.ImageSmall = SaveImage(small);
                LayerDAO.ServicesDao.Save(model);
                return RedirectToAction("Index");
            }

            if (id == 0)
            {
                return View("Update", new LayerDB.Service()
                {
                    ServiceId = 0,
                    Name = "",
                    SubName = "",
                    Text = "",
                    ImageSmall = "image_placeholder.jpg",
                    ImageHeader = "image_placeholder.jpg"
                });
            }


            var faq = LayerDAO.ServicesDao.Get(id);
            if (faq == null)
            {
                return RedirectToAction("Index");
            }
            
            if (string.IsNullOrWhiteSpace(faq.ImageHeader))
                faq.ImageHeader = "image_placeholder.jpg";
            if (string.IsNullOrWhiteSpace(faq.ImageSmall))
                faq.ImageSmall = "image_placeholder.jpg";

            return View("Update", faq);
        }

        private string SaveImage(HttpPostedFileBase pic)
        {
            if (pic == null || pic.ContentLength <= 0) return "";
            try
            {
                var fileName = Guid.NewGuid() + ".jpg";
                var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                pic.SaveAs(path);
                return fileName;
            }
            catch (Exception)
            {
                return "";
            }
        }

    }
}
