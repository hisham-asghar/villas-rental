using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using LayerDB;

namespace LayerDAO
{
    public static class CustomFunctions
    {
        public static string Guid(string str)
        {
            if(str == null)
            {
                return "";
            }
            var guid = str.Trim().ToLower();
            if (guid.Contains(' '))
                guid = guid.Replace(' ', '-');
            guid = System.Text.RegularExpressions.Regex.Replace(guid, @"[^0-9a-zA-Z]+", "-");
            return guid;
        }


        public static bool updateUrls()
        {
            using (var db = new DBModel())
            {
                var properties = db.PropertyDetails;
                foreach (var p in properties)
                {
                    p.guid = Guid(p.Name);
                }
                var cars = db.Cars;
                foreach (var p in cars)
                {
                    p.guid = Guid(p.Name);
                }
                var magzineSet = db.Magzines;
                foreach (var p in magzineSet)
                {
                    p.GUID = Guid(p.Title);
                }
                var services = db.Services;
                foreach (var p in services)
                {
                    p.guid = Guid(p.Name);
                }

                var yachts = db.Yachts;
                foreach (var p in yachts)
                {
                    p.guid = Guid(p.Name);
                }

                var tags = db.Tags;
                foreach (var p in tags)
                {
                    p.guid = Guid(p.TagName);
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
    }
}
