using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LayerDB;

namespace LayerDAO
{
    public class HomeOwnerDAO
    {
        public static bool Save(HomeOwner model)
        {
            using (var db = new DBModel())
            {
                db.HomeOwners.Add(model);
                try
                {
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
