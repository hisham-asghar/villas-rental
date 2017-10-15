using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using LayerDB;

namespace LayerDAO
{
    public class MagzineDAO
    {
        public static List<BlogViewItem> GetMagzineTypeItems(string type)
        {
            using (var db = new DBModel())
            {
                return db.BlogViewItems.Where(b => b.BlogViewType.Name.ToLower().Trim() == type.ToLower().Trim()).ToList();
            }
        }
        public static List<MagzineCategory> GetMagzineCategories()
        {
            using (var db = new DBModel())
            {
                return db.MagzineCategories.ToList();
            }
        }
        public static List<Dictionary<string,string>> GetMagzines(int cnt)
        {
            using (var db = new DBModel())
            {
                var list = db.Magzines.ToList();
                var dicList = new List<Dictionary<string,string>>();
                foreach (var m in list)
                {
                    var itemList = m.MagzineItems.ToList();
                    var items = new Dictionary<string, string>();
                    foreach (var it in itemList)
                    {
                        items.Add(it.BlogViewItem.TypeName,it.Text);
                    }
                    items.Add("guid",m.GUID);
                    dicList.Add(items);
                }
                return dicList;
            }
        }

        public static bool Save(List<MagzineItem> blogItems, string title, int blogId, int categoryId)
        {
            using (var db = new DBModel())
            {
                
                var guid = CustomFunctions.Guid(title);
                try
                {
                    var mgz = new Magzine()
                    {
                        Title = title,
                        BlogViewTypeId = blogId,
                        MagzineItems = blogItems,
                        isActive = true,
                        CategoryId = categoryId,
                        GUID = guid
                    };
                    db.Magzines.Add(mgz);
                    db.SaveChanges(); StaticData.updateData();
                    return true;
                }
                catch (DbEntityValidationException e)
                {
                    return false;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }

        public static Dictionary<string, string> GetMagzine(string token)
        {
            using (var db = new DBModel())
            {
                var magz = db.Magzines.FirstOrDefault(m => m.GUID.ToLower().Trim() == token.ToLower().Trim());
                var items = new Dictionary<string, string>();
                if (magz == null) return items;
                var itemList = magz.MagzineItems.ToList();
                foreach (var item in itemList)
                    items.Add(item.BlogViewItem.TypeName, item.Text);
                return items;
            }
        }

        public static List<string> GetUrls()
        {
            using (var db = new DBModel())
            {
                return db.Magzines.Select(c => c.GUID).ToList();
            }
        }
    }
}
