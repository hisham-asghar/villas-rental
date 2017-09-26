using LayerDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LayerDAO
{
    public class FAQDAO
    {
        public static FAQ getFAQ(int id)
        {
            using (var db = new DBModel())
            {
                return db.FAQs.FirstOrDefault(f => f.faqId == id);
            }
        }
        public static List<FAQ> getAllFAQ()
        {
            using (var db = new DBModel())
            {
                return db.FAQs.ToList();
            }
        }
        public static List<FAQ> getAll(int type = 0)
        {
            using (var db = new DBModel())
            {
                return db.FAQs.Where(f => f.type == type).ToList();
            }
        }
        public static bool SaveFAQ(FAQ model)
        {
            using (var db = new DBModel())
            {
                var faq = db.FAQs.FirstOrDefault(f => f.faqId == model.faqId);
                if(faq == null)
                {
                    db.FAQs.Add(model);
                }
                else
                {
                    faq.Question = model.Question;
                    faq.Answer = model.Answer;
                    faq.type = model.type;
                }
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
    }
}
