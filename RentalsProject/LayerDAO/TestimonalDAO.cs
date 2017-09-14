using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LayerDB;

namespace LayerDAO
{
    public class TestimonalDAO
    {
        public static Testimonal get(int id)
        {
            using (var db = new DBModel())
            {
                return db.Testimonals.FirstOrDefault(f => f.TestimonalId == id);
            }
        }
        public static bool delete(int id)
        {
            using (var db = new DBModel())
            {
                var faq = db.Testimonals.FirstOrDefault(f => f.TestimonalId == id);
                db.Testimonals.Remove(faq);
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch(Exception e)
                {
                    return false;
                }
            }
        }
        public static List<Testimonal> getAll()
        {
            using (var db = new DBModel())
            {
                return db.Testimonals.ToList();
            }
        }
        public static bool Save(Testimonal model)
        {
            using (var db = new DBModel())
            {
                var faq = db.Testimonals.FirstOrDefault(f => f.TestimonalId == model.TestimonalId);
                if (faq == null)
                {
                    model.onCreated = DateTime.Now;
                    db.Testimonals.Add(model);
                }
                else
                {
                    faq.Text = model.Text;
                    faq.Name = model.Name;
                    faq.socialMediaLinks = model.socialMediaLinks;
                    faq.UserImage = model.UserImage;
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
