using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LayerDB;

namespace LayerDAO
{
    public static class LocationDAO
    {
        public static List<Country> GetCountries()
        {
            using (var db = new DBModel())
            {
                return db.Countries.ToList();
            }
        }

        public static List<CityCC> GetCities(string countryFirstCc)
        {
            using (var db = new DBModel())
            {
                return db.CityCCs.Where(c => c.cc == countryFirstCc).ToList();
            }
        }
    }
}
