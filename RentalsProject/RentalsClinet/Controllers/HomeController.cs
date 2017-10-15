using System.IO;
using System.Net;
using System.Web.Mvc;
using AuthorizeMerchantLibrary.Models;
using LayerDAO;
using RentalsClinet.Helpers;
using CustomModels;
using RentalHelper.Helper;

namespace RentalsClinet.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Test()
        {
            /*
            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            return Json(MerchantHelper.ChargeCreditCardHelperRunDump(), JsonRequestBehavior.AllowGet);
            */
            var line = Helpers.MerchantHelper.GetTransactionRes(null);
            if (line.result == ResultType.OK)
            {
                
            }
            else if (line.result == ResultType.ERROR)
            {
                
            }
            return Json(line, JsonRequestBehavior.AllowGet);
        }


        public ActionResult updateData(string code)
        {
            if (code == "hisham@octacer.com")
            {
                var res = LayerDAO.CustomFunctions.updateUrls();
                LayerDAO.StaticData.updateData();
                return Json(res, JsonRequestBehavior.AllowGet);
            }
            return new EmptyResult();
        }

        public ActionResult TestMail()
        {

            var res = EmailHelper.SendMail(new SendEmailModel()
            {
                Subject = "Testing Local",
                Body = "Testing <b>local</b>",
                To = "hisham@octacer.com"
            });

            return Json(res, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Index()
        {
            
            var mainMetas = SiteMetaDAO.getMetaChilds("Index_Page");

            ViewBag.Index = CustomModels.Helper.getDicData(mainMetas, "Index_Page_Banner");

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

            ViewBag.cities = LayerDAO.PropertyDAO.GetCities();

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
            ViewBag.AboutUs = Helper.getDicData(mainMetas, "AboutUs_Page_Banner");
            ViewBag.aboutText = CustomModels.Helper.getDicData(mainMetas, "main_about_text");
            ViewBag.aboutTag = CustomModels.Helper.getDicData(mainMetas, "about_tag_line");
            return View("About");
        }

        public ActionResult CONCIERGE()
        {
            return View("CONCIERGE");
        }


        public ActionResult Testimonals()
        {
            var list = LayerDAO.TestimonalDAO.getAll();
            return View("Testimonals",list);
        }

        public ActionResult FAQ()
        {
            var mainMetas = SiteMetaDAO.getMetaChilds("FAQ_Page");
            ViewBag.Index = CustomModels.Helper.getDicData(mainMetas, "Index_Page_Banner");
            ViewBag.HeadTitle = "FAQ";
            var list = LayerDAO.FAQDAO.getAll(0);
            return View("FAQs", list);
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
        /*
        [ActionName("TERMS-OF-SERVICE")]
        public ActionResult Terms()
        {
            ViewBag.HeadTitle = "TERMS-OF-SERVICE";
            return View("UsefuLink");
        }*/

    }
}
