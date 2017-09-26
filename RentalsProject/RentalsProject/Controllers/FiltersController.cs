using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RentalsProject.Controllers
{
    [AuthorizeSession]
    public class FiltersController : Controller
    {
        //
        // GET: /Filters/

        public ActionResult Index()
        {
            var list = LayerDAO.TagsDAO.getAll();
            return View(list);
        }

        [HttpPost]
        public ActionResult UpdatePropertyFilters(List<int> list, int id = 0)
        {
            var model = new CustomModels.PropertyModels.PropertyFilters()
            {
                id = id
            };
            model.filters = new List<KeyValuePair<int, bool>>();
            model.filtersDic = new Dictionary<int, bool>();
            foreach(var i in list)
            {
                model.filters.Add(new KeyValuePair<int,bool>(i,true));
                model.filtersDic[i] = true;
            }
            if (model != null)
            {
                LayerDAO.PropertyDAO.UpdatePropertyFilters(model);
            }
            return Json("true", JsonRequestBehavior.AllowGet);
        }

        public ActionResult PropertyFilters()
        {
            var list = LayerDAO.PropertyDAO.GetPropertiesFilters();

            var taglist = LayerDAO.TagsDAO.getAll();
            ViewBag.taglist = taglist;
            
            foreach(var p in list)
            {
                if(p.filtersDic == null)
                    p.filtersDic = new Dictionary<int, bool>();
                foreach(var tag in taglist)
                {
                    try
                    {
                        var ff = p.filters.FirstOrDefault(pair => pair.Key == tag.TagId);
                        p.filtersDic[tag.TagId] = ff.Value;
                    }catch(ArgumentNullException e)
                    {
                        p.filtersDic[tag.TagId] = false;
                    }
                    catch (Exception e)
                    {
                        p.filtersDic[tag.TagId] = false;
                    }
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
