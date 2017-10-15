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
        public static List<Tag> GetAll()
        {
            using (var db = new DBModel())
            {
                return db.Tags.Include("PropertyTags").ToList();
            }
        }
        public static List<KeyValuePair<Tag,int>> GetDetailAll()
        {
            using (var db = new DBModel())
            {
                var list = db.Tags.ToList();
                return (from tag in list let sum = tag.PropertyTags.Count(p => p.PropertyDetail.isActive && p.PropertyDetail.Availablity) select new KeyValuePair<Tag, int>(tag, sum)).ToList();
            }
        }
        public static bool Delete(int id)
        {
            using (var db = new DBModel())
            {
                var tag = db.Tags.FirstOrDefault(t => t.TagId == id);
                if (tag == null) return false;
                try
                {
                    db.PropertyTags.RemoveRange(tag.PropertyTags);
                    db.Tags.Remove(tag); 
                    db.SaveChanges(); StaticData.updateData();
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
                var guid = CustomFunctions.Guid(model.TagName);
                var tag = db.Tags.FirstOrDefault(f => f.TagId == model.TagId);
                if (tag == null)
                {
                    model.guid = guid;
                    db.Tags.Add(model);
                }
                else
                {
                    tag.guid = guid;
                    tag.TagName = model.TagName;
                    tag.Text = model.Text;
                    tag.image = model.image;
                }
                try
                {
                    db.SaveChanges(); StaticData.updateData();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }

        public static List<string> GetUrls()
        {
            using (var db = new DBModel())
            {
                return db.Tags.Select(t => t.guid).ToList();
            }
        }

        public static Tag get(string token)
        {
            using (var db = new DBModel())
            {
                return db.Tags.FirstOrDefault(f => f.guid == token);
            }
        }
    }
}
