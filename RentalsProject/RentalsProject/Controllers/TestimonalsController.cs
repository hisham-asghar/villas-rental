using LayerDAO;
using LayerDB;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RentalsProject.Controllers
{
    public class TestimonalsController : Controller
    {
        //
        // GET: /Testimonals/

        public ActionResult Index()
        {
            var list = TestimonalDAO.getAll();
            return View(list);
        }

        public ActionResult Update(HttpPostedFileBase pic, Testimonal model, int id = 0)
        {
            if (Request.HttpMethod == "POST" && model != null)
            {
                if (pic != null && pic.ContentLength > 0)
                {
                    try
                    {
                        var fileName = Guid.NewGuid() + ".jpg";
                        var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                        pic.SaveAs(path);
                        model.UserImage = fileName;
                    }
                    catch (Exception)
                    {
                        model.UserImage = "";
                    }
                }
                else
                    model.UserImage = "";
                TestimonalDAO.Save(model);
                return RedirectToAction("Index");
            }

            if (id == 0)
            {
                return View("Update", new Testimonal()
                {
                    TestimonalId = 0,
                    Name = "",
                    onCreated = DateTime.Now,
                    socialMediaLinks = "",
                    Text = "",
                    UserImage = "image_placeholder.jpg",
                    VideoURL = ""
                });
            }


            var faq = TestimonalDAO.get(id);
            if (faq == null)
            {
                return RedirectToAction("Index");
            }
            if (string.IsNullOrWhiteSpace(faq.UserImage))
                faq.UserImage = "image_placeholder.jpg";
            return View("Update", faq);
        }

    }
}
