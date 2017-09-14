using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LayerDB;

namespace LayerDAO
{
    public static class TagsDAO
    {
        public static Tag get(int id)
        {
            using (var db = new DBModel())
            {
                return db.Tags.FirstOrDefault(f => f.TagId == id);
            }
        }
        public static List<Tag> getAll()
        {
            using (var db = new DBModel())
            {
                return db.Tags.ToList();
            }
        }
        public static bool Delete(int id)
        {
            using (var db = new DBModel())
            {
                var tag = db.Tags.FirstOrDefault(t => t.TagId == id);
                db.Tags.Remove(tag);
                try
                {
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    return false;
                }
                return true;
            }
        }
        public static bool Save(Tag model)
        {
            using (var db = new DBModel())
            {
                var tag = db.Tags.FirstOrDefault(f => f.TagId == model.TagId);
                if (tag == null)
                {
                    db.Tags.Add(model);
                }
                else
                {
                    tag.TagName = model.TagName;
                }
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }
    }
}
