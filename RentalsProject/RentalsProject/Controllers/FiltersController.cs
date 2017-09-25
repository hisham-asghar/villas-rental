using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RentalsProject.Controllers
{
    public class FiltersController : Controller
    {
        //
        // GET: /Filters/

        public ActionResult Index()
        {
            var list = LayerDAO.TagsDAO.getAll();
            return View(list);
        }

        public ActionResult PropertyFilters()
        {
            var list = LayerDAO.PropertyDAO.GetPropertiesFilters();

            var taglist = LayerDAO.TagsDAO.getAll();
            ViewBag.taglist = taglist;
            
            foreach(var p in list)
            {
                p.filtersDic = new Dictionary<int, bool>();
                foreach(var tag in taglist)
                {
                    p.filtersDic[tag.TagId] = p.filters.Contains(tag.TagId);
                }
            }

            return View(list);
        }
        public ActionResult Delete(int id = 0)
        {
            if(id > 0)
            {
                LayerDAO.TagsDAO.Delete(id);
            }
            return RedirectToAction("Index");
        }
        public ActionResult Update(string name, int id = 0)
        {
            LayerDB.Tag model = new LayerDB.Tag()
            {
                TagId = id,
                TagName = name
            };
            if (model != null)
            {
                LayerDAO.TagsDAO.Save(model);                
            }
            return RedirectToAction("Index");
        }

    }
}
