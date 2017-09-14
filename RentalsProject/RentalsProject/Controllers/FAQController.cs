using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RentalsProject.Controllers
{
    public class FAQController : Controller
    {
        //
        // GET: /FAQ/

        public ActionResult Index()
        {
            var list = LayerDAO.FAQDAO.getAllFAQ();
            return View(list);
        }
        public ActionResult Update(LayerDB.FAQ model,int id = 0)
        {
            if (Request.HttpMethod == "POST" && model != null)
            {
                LayerDAO.FAQDAO.SaveFAQ(model);
                return RedirectToAction("Index");
            }

            if(id == 0)
            {
                return View("Update", new LayerDB.FAQ()
                {
                    faqId = 0,
                    Question = "",
                    Answer = "",
                    likes = 0,
                    dislikes = 0
                });
            }


            LayerDB.FAQ faq = LayerDAO.FAQDAO.getFAQ(id);
            if(faq == null)
            {
                return RedirectToAction("Index");
            }
            return View("Update",faq);
        }

    }
}
