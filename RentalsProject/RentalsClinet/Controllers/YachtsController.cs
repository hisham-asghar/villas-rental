using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using CustomModels.Yachts;
using LayerDAO;
using RentalsClinet.Helpers;

namespace RentalsClinet.Controllers
{
    public class YachtsController : Controller
    {
        //
        // GET: /Yachts/

        public ActionResult Index(UserReuqestYacht model)
        {
            if (Request.HttpMethod == "POST" && model != null)
            {
                var requestUrl = Request.Url;
                if (requestUrl != null)
                {
                    model.link = requestUrl.AbsoluteUri;
                    var domain = string.Format("{0}://{1}", requestUrl.Scheme, requestUrl.Authority);
                    EmailHelper.InquiryYachts(model, Request.MapPath("~/App_Data/"));
                }
            }
            var token = Request.QueryString["token"];
            var tokenList = new List<string>()
            {
                "34-63",
                "64-77",
                "78-99",
                "100+"
            };
            if (token != null && tokenList.Any(p => p == token))
            {
                List<YachtModel> list = null;
                switch (token)
                {
                    case "34-63":
                        list  = YachtDAO.getYachts(34, 63);
                        break;
                    case "64-77":
                        list = YachtDAO.getYachts(64, 77);
                        break;
                    case "78-99":
                        list = YachtDAO.getYachts(78, 99);
                        break;
                    case "100+":
                        list = YachtDAO.getYachts(100, 0);
                        break;
                }
                if (list != null)
                {
                    List<List<YachtModel>> dlist = new List<List<YachtModel>>();

                    int countAdded = 0;
                    int pgno = 0;
                    int count = 3;
                    while (countAdded < list.Count)
                    {
                        dlist.Add(list.Skip(pgno * count).Take(count).ToList());
                        pgno++;
                        countAdded += count;
                    }
                    //ViewBag.list = dlist;
                    ViewBag.Token = token;
                    return View("SubIndex", dlist);
                }
            }
            if (token == null) return View();
            var yacht = YachtDAO.getYachtDetail(token);
            return yacht != null ? View("Detail", yacht) : View();
        }

    }
}
