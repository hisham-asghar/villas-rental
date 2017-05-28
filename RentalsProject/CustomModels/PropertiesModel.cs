using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CustomModels
{
    public class PropertiesModel
    {
        public string propertyname { get; set; }
        public int propertyType { get; set; }
        public int maxguests { get; set; }
        public int spacem2 { get; set; }
        public int spaceft { get; set; }
        public int beds { get; set; }
        public int baths { get; set; }
        public int toilets { get; set; }
        public float longitude { get; set; }
        public float latitude { get; set; }
        public string street { get; set; }
        public string country { get; set; }
        public int city { get; set; }
        public int postalcode { get; set; }
        public string description { get; set; }
        public string videoURL { get; set; }
        public string pdfFile { get; set; }
        public string banner { get; set; }
        public List<int> amenities { get; set; }
        public List<int> tags { get; set; }
        public List<string> ImagesList { get; set; }
        public List<RateModel> rates { get; set; }
    }
    public class PropertiesModelGetter
    {
        public string propertyname { get; set; }
        public KeyValuePair<int, string> propertyType { get; set; }
        public int maxguests { get; set; }
        public int spacem2 { get; set; }
        public int spaceft { get; set; }
        public int propertyid { get; set; }
        public int beds { get; set; }
        public int baths { get; set; }
        public int toilets { get; set; }
        public float longitude { get; set; }
        public float latitude { get; set; }
        public string street { get; set; }
        public string country { get; set; }
        public string city { get; set; }
        public int postalcode { get; set; }
        public string banner { get; set; }
        public string description { get; set; }
        public List<KeyValuePair<int, string>> amenities { get; set; }
        public List<KeyValuePair<int,string>> tags { get; set; }
        public List<string> ImagesList { get; set; }
        public List<RateModel> rates { get; set; }
    }

    public class RateModel
    {
        public DateTime sd { get; set; }
        public DateTime ed { get; set; }
        public int price { get; set; }
    }
}