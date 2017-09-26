using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CustomModels;
using LayerDAO;

namespace RentalsProject.Controllers
{
    public class itemText
    {
        public int itemId { get; set; }
        public string value { get; set; }
    }
    public class itemImage
    {
        public int itemId { get; set; }
        public HttpPostedFileBase value { get; set; }
    }

    [AuthorizeSession]
    public class MagzinesController : Controller
    {
        //
        // GET: /Magzines/

        public ActionResult Index()
        {
            return View();
        }
        [ValidateInput(false)]
        public ActionResult Add(List<itemText> model, List<itemImage> modelImg,int categoryId = 0)
        {
            var items = MagzineDAO.GetMagzineTypeItems("SampleDesign1");
            var categories = MagzineDAO.GetMagzineCategories();
            ViewBag.cat = categories;
            if (Request.HttpMethod == "POST")
            {
                string Title = "";
                int blogId = 0;
                var blogItems = new List<LayerDB.MagzineItem>();
                foreach (var item in items)
                {
                    blogId = item.BlogViewTypeId;
                    if (item.Type.ToLower().Trim() == "image")
                    {
                        foreach (var m in modelImg)
                        {
                            if (m.itemId != item.BlogViewItemId) continue;
                            var pic = m.value;
                            if (pic != null && pic.ContentLength > 0)
                            {
                                try
                                {
                                    var fileName = Guid.NewGuid() + ".jpg";
                                    var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                                    pic.SaveAs(path);
                                    var mgz_item = new LayerDB.MagzineItem()
                                    {
                                        BlogId = item.BlogViewTypeId,
                                        BlogItemId = item.BlogViewItemId,
                                        Text = fileName
                                    };
                                    blogItems.Add(mgz_item);
                                }
                                catch (Exception)
                                {
                                    // ignored
                                }
                            }
                            break;
                        }
                    }
                    else
                    {
                        foreach (var m in model)
                        {
                            if(m.itemId != item.BlogViewItemId) continue;
                            var mgz_item = new LayerDB.MagzineItem()
                            {
                                BlogId = item.BlogViewTypeId,
                                BlogItemId = item.BlogViewItemId,
                                Text = m.value
                            };
                            if (item.TypeName.ToLower().Trim() == "title")
                            {
                                Title = mgz_item.Text;
                            }
                            blogItems.Add(mgz_item);
                            break;
                        }
                        
                    }
                }
                if (blogItems.Count > 0)
                {
                    MagzineDAO.Save(blogItems,Title,blogId,categoryId);
                }
            }
            return View("Add",items);
        }

    }
}
