using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using AuthorizeMerchantLibrary.Models;
using CustomModels;
using CustomModels.PropertyModels;
using LayerDAO;
using LayerDB;
using RentalsClinet.Helpers;

namespace RentalsClinet.Controllers
{
    public class DestinationsController : Controller
    {
        //
        // GET: /Destinations/

        public ActionResult Index()
        {
            var token = Request.QueryString["token"];
            if (token == null)
            {
                var cities = PropertyDAO.GetCities().OrderBy(p => p.CityName.ToLower()).ToList();
                ViewBag.maxPrice = PropertyDAO.GetMaxNightPrice(0);
                return View("CityIndex", cities);
            }
            const int cnt = 0;
            var list = PropertyDAO.GetPropertyDetailList(cnt,token);

            if(list == null)
            {
                return RedirectToAction("Index");
            }

            ViewBag.city = PropertyDAO.GetCity(token);
            return View("Index", list);
        }

        public ActionResult Search(CustomModels.FormModels.DestinationSearchFormModel model)
        {

            var tagsList = PropertyDAO.GetPropertyTags();
            model.filter = new List<string>();
            const int cnt = 0;
            var list = PropertyDAO.GetPropertyDetailList(cnt, model.d);
            foreach (var tag in tagsList)
            {
                if (!string.IsNullOrWhiteSpace(Request.Form[tag.TagName]))
                {
                    model.filter.Add(tag.TagName);
                }
            }

            ViewBag.modelSearch = model;
            
            if (model.filter.Count > 0)
            {
                list = (from p in list 
                        from filter in model.filter 
                        where p.tagsList.Contains(filter) select p).ToList();
            }

            if (!string.IsNullOrWhiteSpace(model.cityName) && !string.Equals(model.cityName, "*", StringComparison.Ordinal))
            {
                list = list.Where(p => p.CityGuid == model.cityName).ToList();

                ViewBag.city = PropertyDAO.GetCity(model.cityName);
            }

            if (model.g > 0)
            {
                list = list.Where(p => p.MaxGuests >= model.g).ToList();
            }
            if (model.guests > 0)
            {
                list = list.Where(p => p.MaxGuests >= model.guests).ToList();
            }
            if (!string.IsNullOrWhiteSpace(model.price) && model.price.Contains(';'))
            {
                var pirceStrz = model.price.Split(';');
                if (pirceStrz.Length == 2)
                {
                    model.min = Convert.ToInt32(pirceStrz[0]);
                    model.max = Convert.ToInt32(pirceStrz[1]);

                    ViewBag.smax = model.max;
                    ViewBag.smin = model.min;
                }
                else
                {

                    ViewBag.smax = PropertyDAO.GetMaxNightPrice(0);
                    ViewBag.smin = 0;
                }
                list = list.Where(p => p.night >= model.min && p.night <= model.max).ToList();
            }
            else
            {
                ViewBag.smax = PropertyDAO.GetMaxNightPrice(0);
                ViewBag.smin = 0;
            }
            if(!string.IsNullOrWhiteSpace(model.r) && model.r.Contains("-"))
            {
                var ranges = model.r.Split('-');
                var start = ranges[0].Trim();
                var end = ranges[1].Trim();
                var startArr = start.Split('/');
                var endArr = end.Split('/');
                var startDate = new DateTime(Convert.ToInt32(startArr[2]), Convert.ToInt32(startArr[0]), Convert.ToInt32(startArr[1]));
                var endDate = new DateTime(Convert.ToInt32(endArr[2]), Convert.ToInt32(endArr[0]), Convert.ToInt32(endArr[1]));
                
                var dumpList = new List<PropertyView>();
                foreach (var p in list)
                {
                    var rates = PropertyDAO.GetPropertyBookingsVerified(p.PropertyId);
                    bool flagRes = VerifyPropertyAvailablity(p, rates,startDate,endDate);
                    if(flagRes)
                        dumpList.Add(p);
                }
                list = dumpList;

                ViewBag.StartDate = startDate;
                ViewBag.EndDate = endDate;

            }
            if (model.sort == 1)
                list = list.OrderBy(p => p.night).ToList();
            else if (model.sort == 2)
            {
                list = list.OrderByDescending(p => p.night).ToList();
            }
            else if (model.sort == 3)
            {
                list = list.OrderBy(p => p.Bedrooms).ToList();
            }
            else if (model.sort == 4)
            {
                list = list.OrderByDescending(p => p.Bedrooms).ToList();
            }

            if (list == null)
            {
                return RedirectToAction("Index");
            }
            var listCity = new List<List<PropertyView>>();
            var nsize = 3;
            while (list.Any())
            {
                listCity.Add(list.Take(nsize).ToList());;
                list = list.Skip(nsize).ToList();
            }

            ViewBag.maxPrice = PropertyDAO.GetMaxNightPrice(0);
            return View("Search", listCity);
        }

        private bool VerifyPropertyAvailablity(PropertyView propertyView, List<DateModel> rates, DateTime startDate, DateTime endDate)
        {

            foreach (var season in rates)
            {
                if ((season.sd <= startDate && season.ed >= startDate) ||
                    (season.sd <= endDate && season.ed >= endDate))
                {
                    return false;
                }
            }
            return true;
        }


        public ActionResult updateData()
        {
            var res = PropertyDAO.updateNights();
            return Json(res, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Detail(BookingModel2 bmodel)
        {
            
            var id = Request.QueryString["id"];
            if (id == null) return RedirectToAction("Index");
            var _id = Convert.ToInt32(id);
            ActionResult resultView = null;
            try
            {
                var model = PropertyDAO.GetPropertyById(_id);
                if(!model.isActive)
                    resultView = RedirectToAction("Index");
                ViewBag.bookingsList = PropertyDAO.GetPropertyBookingsVerified(_id);
                if (bmodel != null)
                {
                    resultView = DestinationHelper.VillaBooking(bmodel, _id, resultView, model);
                }
                ViewBag.villaId = _id;
                if (model != null)
                    resultView = View(model);
                resultView = RedirectToAction("Index");
            }
            catch (Exception e)
            {
                resultView = RedirectToAction("Index");
            }
            resultView = RedirectToAction("Index");
            return resultView;
        }

        private static bool VerifyBooking(Booking model, List<DateModel> bookings)
        {
            return DestinationHelper.isBooked(model, bookings, isBooked);
        }

        
        public ActionResult BookVilla(string booking, BillingAddress model, CreditCard card)
        {
            if (string.IsNullOrWhiteSpace(booking)) return RedirectToAction("Index");

            
            var modelBooking = PropertyDAO.GetBooking(booking);


            if (modelBooking == null) return RedirectToAction("Index");

            var property = PropertyDAO.GetPropertyById(modelBooking.PropertyId);

            var slip = new VillaTransactionSlip()
            {
                villa = property.Name + property.SubName,
                days = modelBooking.Days,
                TotalPrice = modelBooking.TotalPrice,
                TotalPriceWithTax = modelBooking.TotalPriceWithTax,
                TotalPriceWithTaxTransaction = modelBooking.TotalPriceWithTax * 1.029
            };
            var BookingUser = new LayerDB.User()
            {
                FirstName = card.name,
                Country = model.country,
                Address = model.address,
                City = model.city,
                Email = model.email,
                Zip = model.zip,
                onCreated = DateTime.Now,
                onModified = DateTime.Now,
                State = model.state,
                LastName = model.lastName,
                PhoneNumber = model.phoneNumber,
                CardCode = card.cardCode,
                CardNumber = card.cardNumber,
                ExpirationDate = card.expirationDate
            };
            var flag = PropertyDAO.SavePropertyBooker(BookingUser, modelBooking.BookingId);

            var location = CustomActions.getMerchantLocation();
            var locationUrl = location + "/Destinations/BookingUpdate?id=" + modelBooking.guid;
            var request = WebRequest.Create(locationUrl) as HttpWebRequest;
            
            var response = request.GetResponse() as HttpWebResponse;
            var streamr = new StreamReader(response.GetResponseStream());
            var line = streamr.ReadToEnd();
            var errorLine = "Could not Process the transaction";
            
            /*
            var result = MerchantHelper.GetTransactionRes(line);
            if (result == null || result.response == null)
                return Json(new BookedResultJson
                {
                    flag = 2,
                    message = errorLine
                }, JsonRequestBehavior.AllowGet);
            
            if (result.result == ResultType.OK)
            {
                var success = (SuccessTransactionResult) result;
                if (success.ResponseCode == 1 || success.MessageCode != "1")
                    return Json(success.Description, JsonRequestBehavior.AllowGet);
                var resFlag = PropertyDAO.BookPropertyVerfied(modelBooking.BookingId);
                return Json(new BookedResultJson
                {
                    flag = 0,
                    message = success.Description
                }, JsonRequestBehavior.AllowGet);
            }
            
            if (result.result == ResultType.ERROR)
            {
                var fail = (FailedTransactionResult) result;
                return Json(new BookedResultJson
                {
                    flag = 1,
                    message = fail.MessageCode
                }, JsonRequestBehavior.AllowGet);
            }
            */
            return Json(line, JsonRequestBehavior.AllowGet);

        }

        public ActionResult BookingUpdate(string id)
        {
            if (string.IsNullOrWhiteSpace(id)) return null;


            var booking = PropertyDAO.GetBooking(id);


            if (booking == null || booking.UserId == null) return null;


            var user = PropertyDAO.GetUser(booking.UserId ?? 0);

            var card = new CreditCard()
            {
                name = user.FirstName,
                expirationDate = user.ExpirationDate,
                cardCode = user.CardCode,
                cardNumber = user.CardNumber
            };

            var model = new BillingAddress()
            {
                country = user.Country,
                city = user.City,
                phoneNumber = user.PhoneNumber,
                lastName = user.LastName,
                state = user.State,
                zip = user.Zip,
                email = user.Email,
                firstName = user.FirstName,
                address = user.Address
            };
            var property = PropertyDAO.GetPropertyById(booking.PropertyId);

            var slip = new VillaTransactionSlip()
            {
                villa = property.Name + property.SubName,
                days = booking.Days,
                TotalPrice = booking.TotalPrice,
                TotalPriceWithTax = booking.TotalPriceWithTax,
                TotalPriceWithTaxTransaction = booking.TotalPriceWithTax * 1.029
            };
            var res = MerchantHelper.ChargeCreditCardHelper(model, card, slip);
            return Json(res, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Booking(string id)
        {
            if (Request.Url == null && id == null)
                return RedirectToAction("Index");
            if ((Request.Url.Segments.Length < 4 || string.IsNullOrWhiteSpace(Request.Url.Segments[3])) &&  id == null)
                return RedirectToAction("Index");

            if (id == null)
                id = Request.Url.Segments[3];

            var booking = PropertyDAO.GetBooking(id);

            if (booking == null)
                return RedirectToAction("Index");

            var property = PropertyDAO.GetPropertyById(booking.PropertyId);

            if (booking.StartDate <= DateTime.Now || booking.EndDate <= DateTime.Now)
                return RedirectToAction("Index");
            
            var bm = new DetailBookingModel()
            {
                days = booking.Days,
                Tax = booking.Tax,
                TotalPrice = booking.TotalPrice,
                TotalPriceWithTax = booking.TotalPriceWithTax,
                fromDate = booking.StartDate,
                toDate = booking.EndDate,
                Property = property,
                TotalTaxPrice = booking.TotalTaxPrice
            };
            var propertyBookingServices = PropertyDAO.GetBookingPropertyServices(booking.BookingId);

            var services = PropertyDAO.GetPropertyServicesDictionaryById();
            foreach (var service in propertyBookingServices)
            {
                if (services[service.PropertyServiceId].Guid == "hk")
                {
                    bm.hk = new CustomModels.Service()
                    {
                        d = service.TimeLimitPerDay ?? 0,
                        h = service.TimeLimitPerHour ?? 0,
                        
                    };
                    bm.hk.price = (int)(services[service.PropertyServiceId].Price * bm.hk.d * bm.hk.h);
                }
                else if (services[service.PropertyServiceId].Guid == "pc")
                {
                    bm.pc = new CustomModels.Service()
                    {
                        d = service.TimeLimitPerDay ?? 0,
                        h = service.TimeLimitPerHour ?? 0,

                    };
                    bm.pc.price = (int)(services[service.PropertyServiceId].Price * bm.pc.d * bm.pc.h);
                }
                else if (services[service.PropertyServiceId].Guid == "bed")
                {
                    bm.bed = new ServiceBed
                    {
                        days = bm.days,
                        count = property.Bedrooms
                    };

                    bm.bed.price = (int)(services[service.PropertyServiceId].Price * bm.days * bm.bed.count);
                }
                var season = PropertyDAO.GetBookingSeason(booking.BookingId);
                if (season != null)
                {
                    bm.SeasonName = season.SeasonName;
                    bm.perNightRate = season.Price;
                }
                else
                {
                    bm.perNightRate = property.night;
                    bm.SeasonName = null;
                }
            }
            ViewBag.BookingId = id;
            return View("Booking", bm);
        }

    }
}
