using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
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
                "100"
            };            
            if (token != null && tokenList.Any(p => p == token.Replace("+", "").Replace(" ", "")))
            {
                List<YachtModel> list = null;
                token = token.Replace("+", "").Replace(" ", "");
                ViewBag.Token = token;
                switch (token)
                {
                    case "34-63":
                        list  = YachtDAO.getYachts(34, 63);
                        ViewBag.banner = "/Content/Images/Yachts/36-63.jpg";
                        break;
                    case "64-77":
                        list = YachtDAO.getYachts(64, 77);
                        ViewBag.banner = "/Content/Images/Yachts/64-77.jpg";
                        break;
                    case "78-99":
                        list = YachtDAO.getYachts(78, 99);
                        ViewBag.banner = "/Content/Images/Yachts/78-99.jpg";
                        break;
                    case "100":
                        list = YachtDAO.getYachts(100, 0);
                        ViewBag.Token = "100+";
                        ViewBag.banner = "/Content/Images/Yachts/100.jpg";
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
                    return View("SubIndex", dlist);
                }
            }
            if (token == null) return View();
            var yacht = YachtDAO.getYachtDetail(token);
            return yacht != null ? View("Detail", yacht) : View();
        }

    }
}
