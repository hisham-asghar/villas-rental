using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CustomModels.PropertyModels;

namespace CustomModels
{
    public class PropertyBasicInfo
    {
        public int propertyId { get; set; }
        public string propertyname { get; set; }
        public string propertysubname { get; set; }
        public int propertyType { get; set; }
        public int maxguests { get; set; }

        public double longitude { get; set; }
        public double latitude { get; set; }
        public string street { get; set; }
        public string country { get; set; }
        public int city { get; set; }
        public long postalcode { get; set; }
        
    }
    public class PropertiesModel: PropertyBasicInfo
    {
        public int spacem2 { get; set; }
        public int spaceft { get; set; }
        public int beds { get; set; }
        public int baths { get; set; }
        public int toilets { get; set; }
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
        public string propertysubname { get; set; }
        public KeyValuePair<int, string> propertyType { get; set; }
        public int maxguests { get; set; }
        public int spacem2 { get; set; }
        public int spaceft { get; set; }
        public int propertyid { get; set; }
        public int beds { get; set; }
        public int baths { get; set; }
        public int toilets { get; set; }
        public float longitude { get; set; }
        public double night { get; set; }
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

    public class DateModel
    {
        public DateTime sd { get; set; }
        public DateTime ed { get; set; }
    }

    public class RateModel : DateModel
    {
        public int SeasonId { get; set; }
        public string SeasonName { get; set; }
        public double price { get; set; }
        public double guest_price { get; set; }
        public int minStay { get; set; }
    }
    public class BookingModel
    {
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
        public double price { get; set; }
    }

    public class Service
    {
        public int d { get; set; }
        public int h { get; set; }
        public int price { get; set; }
    }
    public class ServiceBed
    {
        public int count { get; set; }
        public int days { get; set; }
        public int price { get; set; }
    }

    public class BookingModel2
    {
        public String to { get; set; }
        public String from { get; set; }
        public DateTime toDate { get; set; }
        public DateTime fromDate { get; set; }
        public int days { get; set; }
        public double perNightRate { get; set; }
        public double TotalPrice { get; set; }
        public double TotalPriceWithTax { get; set; }
        public double TotalRoomPrice { get; set; }
        public double Tax { get; set; }
        public string SeasonName { get; set; }
        public int SeasonId { get; set; }
        public ServiceBed bed { get; set; }
        public Service hk { get; set; }
        public Service pc { get; set; }
    }

    public class DetailBookingModel : BookingModel2
    {
        public PropertyView Property { get; set; }
        public double TotalTaxPrice { get; set; }
    }
    public class UpdateExtraModel
    {
        public HttpPostedFileBase banner { get; set; }
        public HttpPostedFileBase pdf { get; set; }
        public string videoUrl { get; set; }
        public int propertyId { get; set; }
        public string bannerUrl { get; set; }
        public string pdfUrl { get; set; }
    }
}