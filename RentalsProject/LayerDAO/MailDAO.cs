using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LayerDB;

namespace LayerDAO
{
    public class MailDAO
    {
        public static Mail get(int id)
        {
            using (var db = new DBModel())
            {
                return db.Mails.FirstOrDefault(f => f.MailId == id);
            }
        }
        public static Mail get(string guid)
        {
            using (var db = new DBModel())
            {
                return db.Mails.FirstOrDefault(f => f.guid == guid);
            }
        }
        public static bool delete(int id)
        {
            using (var db = new DBModel())
            {
                var faq = db.Mails.FirstOrDefault(f => f.MailId == id);
                if (faq == null)
                    return false;
                db.Mails.Remove(faq);
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
        public static List<Mail> getAll()
        {
            using (var db = new DBModel())
            {
                return db.Mails.ToList();
            }
        }
        public static bool Save(Mail model)
        {
            using (var db = new DBModel())
            {
                var faq = db.Mails.FirstOrDefault(f => f.MailId == model.MailId);
                if (faq == null)
                {
                    db.Mails.Add(model);
                }
                else
                {
                    faq.Status = model.Status;
                    faq.Subject = model.Subject;
                    faq.MailTo = model.MailTo;
                    faq.Text = model.Text;
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
    }
}
