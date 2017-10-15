using System;
using System.Collections.Generic;
using System.Linq;
using LayerDB;

namespace LayerDAO
{
    public class ServicesDao
    {
        public static Service Get(int id)
        {
            using (var db = new DBModel())
            {
                return db.Services.FirstOrDefault(f => f.ServiceId == id);
            }
        }
        public static Service Get(string token)
        {
            using (var db = new DBModel())
            {
                return db.Services.FirstOrDefault(f => f.guid == token);
            }
        }
        public static bool Delete(int id)
        {
            using (var db = new DBModel())
            {
                var faq = db.Services.FirstOrDefault(f => f.ServiceId == id);
                if (faq == null)
                    return false;
                db.Services.Remove(faq);
                try
                {
                    db.SaveChanges(); StaticData.updateData();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }
        public static List<Service> GetAll()
        {
            using (var db = new DBModel())
            {
                try { return db.Services.ToList(); }
                catch (Exception)
                {
                    return new List<Service>();
                }
            }
        }
        public static bool Save(Service model)
        {
            using (var db = new DBModel())
            {

                var guid = CustomFunctions.Guid(model.Name);
                var faq = db.Services.FirstOrDefault(f => f.ServiceId == model.ServiceId);
                if (faq == null)
                {
                    model.guid = guid;
                    db.Services.Add(model);
                }
                else
                {
                    faq.guid = guid;
                    faq.ImageHeader = string.IsNullOrWhiteSpace(model.ImageHeader) ? faq.ImageHeader : model.ImageHeader;
                    faq.ImageSmall = string.IsNullOrWhiteSpace(model.ImageSmall) ? faq.ImageSmall : model.ImageSmall;
                    faq.Text = model.Text;
                    faq.Name = model.Name;
                    faq.SubName = model.SubName;
                }
                try
                {
                    db.SaveChanges(); StaticData.updateData();
                    return true;
                }
                catch (Exception )
                {
                    return false;
                }
            }
        }

        public static List<string> GetServicesUrl()
        {
            using(var db = new DBModel())
            {
                return db.Services.Select(s => s.guid).ToList();
            }
        }
    }
}
