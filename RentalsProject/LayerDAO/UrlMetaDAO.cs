using LayerDB;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;

namespace LayerDAO
{
    public static class UrlMetaDAO
    {
        // Url - bougus link
        // guid - real link
        public static Dictionary<string,string> GetDic()
        {
            using(var db = new DBModel())
            {
                var list = db.UrlMetas;
                foreach(var url in list)
                {
                    url.RealLink = CorrectUrl(url.RealLink);
                    url.DummyLink = CorrectUrl(url.DummyLink);
                }
                return list.ToDictionary(key => key.DummyLink, value => value.RealLink);
            }
        }

        public static string CorrectUrl(string p)
        {
            if(p.Contains("http://") || p.Contains("https://"))
            {
                var idx = p.IndexOfNth("/", 0, 3);
                if (idx == -1)
                    p = "/";
                else
                    p = p.Substring(p.IndexOfNth("/", 0, 3));
            }
            var domain = "themarucagroup.com";
            if(p.Contains(domain))
            {
                int idx = p.LastIndexOf(domain) + domain.Length;
                if (idx == p.Length)
                    p = "/";
                else
                    p = p.Substring(idx);
            }
            return p;
        }

        public static int IndexOfNth(this string input,
                             string value, int startIndex, int nth)
        {
            if (nth < 1)
                return 0;
            if (nth == 1)
                return input.IndexOf(value, startIndex);
            var idx = input.IndexOf(value, startIndex);
            if (idx == -1)
                return -1;
            return input.IndexOfNth(value, idx + 1, --nth);
        }

        public static List<UrlMeta> GetAll()
        {
            using (var db = new DBModel())
            {
                return db.UrlMetas.ToList();
            }
        }

        public static bool Save(UrlMeta model)
        {
            using (var db = new DBModel())
            {
                var url = db.UrlMetas.FirstOrDefault(u => u.UrlMetaId == model.UrlMetaId);
                if (url == null)
                    db.UrlMetas.Add(model);
                else
                {
                    url.RealLink = model.RealLink;
                    url.DummyLink = model.DummyLink;
                }
                try
                {
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

        public static bool Delete(int id)
        {
            using (var db = new DBModel())
            {
                var tag = db.UrlMetas.FirstOrDefault(t => t.UrlMetaId == id);
                if (tag == null) return false;
                try
                {
                    db.UrlMetas.Remove(tag);
                    db.SaveChanges(); StaticData.updateData();
                }
                catch (Exception e)
                {
                    return false;
                }
                return true;
            }
        }
    }
}
