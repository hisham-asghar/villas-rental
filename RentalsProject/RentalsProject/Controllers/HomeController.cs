﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Mvc;
using CustomModels;
using LayerDAO;

namespace RentalsProject.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult BestOptions(HttpPostedFileBase pic1,HttpPostedFileBase pic2, HttpPostedFileBase pic3 )
        {
            var parents = new List<string>()
            {
                "BestOptions",
                "Index_Page"
            };
            if (Request.HttpMethod == "POST")
            {
                var s = "main_panel_bst_1_head";
                ViewBag.service1H = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]),parents);
                s = "main_panel_bst_1_sub_head";
                ViewBag.service1SH = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                s = "main_panel_bst_1_body";
                ViewBag.service1B = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                s = "main_panel_bst_1_linkName";
                ViewBag.service1LN = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                s = "main_panel_bst_1_linkRef";
                ViewBag.service1L = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                s = "main_panel_bst_1_img";
                ViewBag.service1IMG = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                var pic = pic1;
                if (pic != null && pic.ContentLength > 0)
                {
                    try
                    {
                        var fileName = Guid.NewGuid() + ".jpg";
                        var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                        pic.SaveAs(path);
                        ViewBag.service1IMG = SiteMetaDAO.SaveMeta(new Meta(s, fileName), parents);
                    }
                    catch (Exception)
                    {
                        ViewBag.service1IMG = SiteMetaDAO.SaveMeta(new Meta(s, ""), parents);
                    }
                }
                else
                {
                    ViewBag.service1IMG = SiteMetaDAO.SaveMeta(new Meta(s, ""), parents);
                }

                s = "main_panel_bst_2_head";
                ViewBag.service2H = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                s = "main_panel_bst_2_sub_head";
                ViewBag.service2SH = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                s = "main_panel_bst_2_body";
                ViewBag.service2B = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                s = "main_panel_bst_2_linkName";
                ViewBag.service2LN = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                s = "main_panel_bst_2_linkRef";
                ViewBag.service2L = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                s = "main_panel_bst_2_img";
                ViewBag.service2IMG = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                pic = pic2;
                if (pic != null && pic.ContentLength > 0)
                {
                    try
                    {
                        var fileName = Guid.NewGuid() + ".jpg";
                        var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                        pic.SaveAs(path);
                        ViewBag.service2IMG = SiteMetaDAO.SaveMeta(new Meta(s, fileName), parents);
                    }
                    catch (Exception)
                    {
                        ViewBag.service2IMG = SiteMetaDAO.SaveMeta(new Meta(s, ""), parents);
                    }
                }
                else
                {
                    ViewBag.service2IMG = SiteMetaDAO.SaveMeta(new Meta(s, ""), parents);
                }

                s = "main_panel_bst_3_head";
                ViewBag.service3H = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                s = "main_panel_bst_3_sub_head";
                ViewBag.service3SH = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                s = "main_panel_bst_3_body";
                ViewBag.service3B = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                s = "main_panel_bst_3_img";
                ViewBag.service3IMG = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                s = "main_panel_bst_3_linkName";
                ViewBag.service3LN = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                s = "main_panel_bst_3_linkRef";
                ViewBag.service3L = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                s = "main_panel_bst_3_img";
                ViewBag.service3IMG = SiteMetaDAO.SaveMeta(new Meta(s, Request.Form[s]), parents);
                pic = pic3;
                if (pic != null && pic.ContentLength > 0)
                {
                    try
                    {
                        var fileName = Guid.NewGuid() + ".jpg";
                        var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                        pic.SaveAs(path);
                        ViewBag.service3IMG = SiteMetaDAO.SaveMeta(new Meta(s, fileName), parents);
                    }
                    catch (Exception)
                    {
                        ViewBag.service3IMG = SiteMetaDAO.SaveMeta(new Meta(s, ""), parents);
                    }
                }
                else
                {
                    ViewBag.service3IMG = SiteMetaDAO.SaveMeta(new Meta(s, ""), parents);
                }

            }

            var mainMetas = SiteMetaDAO.getMetaChilds("BestOptions");

            ViewBag.service1H = Helper.getDicData(mainMetas,"main_panel_bst_1_head");
            ViewBag.service1SH = Helper.getDicData(mainMetas,"main_panel_bst_1_sub_head");
            ViewBag.service1B = Helper.getDicData(mainMetas,"main_panel_bst_1_body");
            ViewBag.service1IMG = Helper.getDicData(mainMetas,"main_panel_bst_1_img");
            ViewBag.service1LN = Helper.getDicData(mainMetas,"main_panel_bst_1_linkName");
            ViewBag.service1L = Helper.getDicData(mainMetas,"main_panel_bst_1_linkRef");

            ViewBag.service2H = Helper.getDicData(mainMetas,"main_panel_bst_2_head");
            ViewBag.service2SH = Helper.getDicData(mainMetas,"main_panel_bst_2_sub_head");
            ViewBag.service2B = Helper.getDicData(mainMetas,"main_panel_bst_2_body");
            ViewBag.service2IMG = Helper.getDicData(mainMetas,"main_panel_bst_2_img");
            ViewBag.service2LN = Helper.getDicData(mainMetas,"main_panel_bst_2_linkName");
            ViewBag.service2L = Helper.getDicData(mainMetas,"main_panel_bst_2_linkRef");

            ViewBag.service3H = Helper.getDicData(mainMetas,"main_panel_bst_3_head");
            ViewBag.service3SH = Helper.getDicData(mainMetas,"main_panel_bst_3_sub_head");
            ViewBag.service3B = Helper.getDicData(mainMetas,"main_panel_bst_3_body");
            ViewBag.service3IMG = Helper.getDicData(mainMetas,"main_panel_bst_3_img");
            ViewBag.service3LN = Helper.getDicData(mainMetas,"main_panel_bst_3_linkName");
            ViewBag.service3L = Helper.getDicData(mainMetas,"main_panel_bst_3_linkRef");

            return View();
        }
        public ActionResult Contact()
        {
            if (Request.HttpMethod == "POST")
            {
                var parents = new List<string>()
                {
                    "Contact_Panel",
                    "Contact_Page",
                    "Index_Page"
                };
                ViewBag.location = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = "contact_location",
                    MetaText = Request.Form["contact_location"]
                },parents);

                ViewBag.phone = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = "contact_legal",
                    MetaText = Request.Form["contact_legal"]
                }, parents);

                ViewBag.legal = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = "contact_phone",
                    MetaText = Request.Form["contact_phone"]
                }, parents);
            }
            else
            {
                var mainMetas = SiteMetaDAO.getMetaChilds("Contact_Page");
                ViewBag.location = Helper.getDicData(mainMetas,"contact_location");
                ViewBag.phone = Helper.getDicData(mainMetas,"contact_phone");
                ViewBag.legal = Helper.getDicData(mainMetas,"contact_legal");
            }
            
            return View();
        }
        public ActionResult Services()
        {

            if (Request.HttpMethod == "POST")
            {
                var parents = new List<string>()
                {
                    "Services",
                    "Services_SectionBOX",
                    "Index_Page"
                };
                var s = "main_panel_services_1_head";
                ViewBag.service1H = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = s,
                    MetaText = Request.Form[s]
                }, parents);

                s = "main_panel_services_1_body";
                ViewBag.service1B = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = s,
                    MetaText = Request.Form[s]
                }, parents);

                s = "main_panel_services_2_head";
                ViewBag.service2H = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = s,
                    MetaText = Request.Form[s]
                }, parents);

                s = "main_panel_services_2_body";
                ViewBag.service2B = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = s,
                    MetaText = Request.Form[s]
                }, parents);

                s = "main_panel_services_3_head";
                ViewBag.service3H = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = s,
                    MetaText = Request.Form[s]
                }, parents);

                s = "main_panel_services_3_body";
                ViewBag.service3B = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = s,
                    MetaText = Request.Form[s]
                }, parents);
            }
            else
            {
                var mainMetas = SiteMetaDAO.getMetaChilds("Services_SectionBOX");
                ViewBag.service1H = Helper.getDicData(mainMetas,"main_panel_services_1_head");
                ViewBag.service1B = Helper.getDicData(mainMetas,"main_panel_services_1_body");

                ViewBag.service2H = Helper.getDicData(mainMetas,"main_panel_services_2_head");
                ViewBag.service2B = Helper.getDicData(mainMetas,"main_panel_services_2_body");

                ViewBag.service3H = Helper.getDicData(mainMetas,"main_panel_services_3_head");
                ViewBag.service3B = Helper.getDicData(mainMetas,"main_panel_services_3_body");
            }
            return View();
        }

        [ValidateInput(false)]
        public ActionResult AboutUs(string main_about_text)
        {

            if (Request.HttpMethod == "POST")
            {
                var parents = new List<string>()
                {
                    "AboutUs_Page"
                };
                var s = "main_about_text";
                ViewBag.AboutText = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = s,
                    MetaText = main_about_text
                }, parents);
                s = "about_tag_line";
                ViewBag.AboutTagLine = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = s,
                    MetaText = Request.Form[s]
                }, parents);

            }
            else
            {
                var mainMetas = SiteMetaDAO.getMetaChilds("AboutUs_Page");
                ViewBag.AboutText = Helper.getDicData(mainMetas, "main_about_text");
                ViewBag.AboutTagLine = Helper.getDicData(mainMetas, "about_tag_line");
            }
            return View("AboutUs");
        }

    }
}