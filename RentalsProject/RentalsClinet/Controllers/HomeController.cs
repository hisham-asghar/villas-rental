using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LayerDAO;
using RentalsClinet.Helpers;

namespace RentalsClinet.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            /*
            EmailHelper.SendMail(new SendEmailModel()
            {
                Subject = "Testing Local",
                Body = "Testing <b>local</b>",
                To = "hisham@octacer.com"
            });*/

            var mainMetas = SiteMetaDAO.getMetaChilds("Index_Page");
            ViewBag.servicePanel1H = CustomModels.Helper.getDicData(mainMetas,"main_panel_services_1_head");
            ViewBag.servicePanel1H = CustomModels.Helper.getDicData(mainMetas, "main_panel_services_1_head");
            ViewBag.servicePanel1B = CustomModels.Helper.getDicData(mainMetas, "main_panel_services_1_body");
            ViewBag.servicePanel2H = CustomModels.Helper.getDicData(mainMetas, "main_panel_services_2_head");
            ViewBag.servicePanel2B = CustomModels.Helper.getDicData(mainMetas, "main_panel_services_2_body");
            ViewBag.servicePanel3H = CustomModels.Helper.getDicData(mainMetas, "main_panel_services_3_head");
            ViewBag.servicePanel3B = CustomModels.Helper.getDicData(mainMetas, "main_panel_services_3_body");


            ViewBag.service1H = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_1_head");
            ViewBag.service1SH = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_1_sub_head");
            ViewBag.service1B = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_1_body");
            ViewBag.service1IMG = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_1_img");
            ViewBag.service1LN = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_1_linkName");
            ViewBag.service1L = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_1_linkRef");

            ViewBag.service2H = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_2_head");
            ViewBag.service2SH = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_2_sub_head");
            ViewBag.service2B = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_2_body");
            ViewBag.service2IMG = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_2_img");
            ViewBag.service2LN = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_2_linkName");
            ViewBag.service2L = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_2_linkRef");

            ViewBag.service3H = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_3_head");
            ViewBag.service3SH = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_3_sub_head");
            ViewBag.service3B = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_3_body");
            ViewBag.service3IMG = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_3_img");
            ViewBag.service3LN = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_3_linkName");
            ViewBag.service3L = CustomModels.Helper.getDicData(mainMetas,"main_panel_bst_3_linkRef");



            return View();
        }
        public ActionResult Contact(CustomModels.ContactModel model)
        {
            if(Request.HttpMethod == "POST" && model != null)
            {
                EmailHelper.InquiryContact(model, Request.MapPath("~/App_Data/"));
            }
            var mainMetas = SiteMetaDAO.getMetaChilds("Contact_Page");
            ViewBag.location = CustomModels.Helper.getDicData(mainMetas,"contact_location");
            ViewBag.phone = CustomModels.Helper.getDicData(mainMetas,"contact_phone");
            ViewBag.legal = CustomModels.Helper.getDicData(mainMetas,"contact_legal");
            return View();
        }

        public ActionResult About(CustomModels.WorkModel model)
        {
            if (Request.HttpMethod == "POST" && model != null)
            {
                EmailHelper.InquiryWork(model, Request.MapPath("~/App_Data/"));
            }
            var mainMetas = SiteMetaDAO.getMetaChilds("AboutUs_Page");
            ViewBag.aboutText = CustomModels.Helper.getDicData(mainMetas, "main_about_text");
            ViewBag.aboutTag = CustomModels.Helper.getDicData(mainMetas, "about_tag_line");
            return View("About");
        }

        public ActionResult CONCIERGE()
        {
            return View("CONCIERGE");
        }
        public ActionResult FAQ()
        {
            ViewBag.HeadTitle = "FAQ";
            return View("UsefuLink");
        }
        public ActionResult EVENTS()
        {
            ViewBag.HeadTitle = "EVENTS";
            return View("UsefuLink");
        }
        public ActionResult POLICY()
        {
            ViewBag.HeadTitle = "POLICY";
            return View("UsefuLink");
        }
        [ActionName("TERMS-OF-SERVICE")]
        public ActionResult Terms()
        {
            ViewBag.HeadTitle = "TERMS-OF-SERVICE";
            return View("UsefuLink");
        }

    }
}
