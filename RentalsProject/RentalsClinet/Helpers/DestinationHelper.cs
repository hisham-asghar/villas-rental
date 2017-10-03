using CustomModels;
using CustomModels.PropertyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RentalsClinet.Helpers
{
    public static class DestinationHelper
    {

        public static ActionResult VillaBooking(BookingModel2 bmodel, int _id, ActionResult resultView, PropertyView model)
        {
            string[] formats = {
                "M/d/yyyy", 
                "M/d/yyyy", 
                "MM/dd/yyyy", 
                "M/d/yyyy", 
                "M/d/yyyy", 
                "M/d/yyyy", 
                "M/d/yyyy", 
                "M/d/yyyy", 
                "MM/dd/yyyy", 
                "M/dd/yyyy"
                               };
            if (bmodel.hk == null)
            {
                ViewBag.villaId = _id;
                if (model != null)
                    resultView = View(model);
            }

            DateTime outParam;
            if (DateTime.TryParseExact(bmodel.@from, formats, new CultureInfo("en-US"), DateTimeStyles.None, out outParam))
            {
                bmodel.fromDate = outParam;
            }
            if (DateTime.TryParseExact(bmodel.to, formats, new CultureInfo("en-US"), DateTimeStyles.None, out outParam))
            {
                bmodel.toDate = outParam;
            }

            bmodel.days = (int)Math.Floor((bmodel.toDate - bmodel.fromDate).TotalDays);

            if (bmodel.hk != null && bmodel.hk.d > bmodel.days)
                bmodel.hk.d = bmodel.days;
            if (bmodel.pc.d > bmodel.days)
                bmodel.pc.d = bmodel.days;

            var services = PropertyDAO.GetPropertyServices();

            if (model != null)
            {
                bmodel.bed = new ServiceBed
                {
                    count = model.Bedrooms,
                    days = bmodel.days
                };
                bmodel.bed.price = (int)(services["bed"].Price * bmodel.bed.count * bmodel.days);

                bmodel.pc.price = (int)(services["pc"].Price * bmodel.pc.h * bmodel.pc.d);
                bmodel.hk.price = (int)(services["hk"].Price * bmodel.hk.h * bmodel.hk.d);
                bmodel.perNightRate = 0;
                bmodel.SeasonName = null;
                foreach (var r in model.rates)
                {
                    var startdate = new DateTime(bmodel.fromDate.Year, r.sd.Month, r.sd.Day);
                    var enddate = new DateTime(bmodel.fromDate.Year, r.ed.Month, r.ed.Day);
                    var checkdate = new DateTime(bmodel.fromDate.Year, bmodel.fromDate.Month, bmodel.fromDate.Day);

                    if (checkdate < startdate || checkdate > enddate) continue;
                    bmodel.perNightRate = r.price;
                    bmodel.SeasonName = r.SeasonName;
                    bmodel.SeasonId = r.SeasonId;
                    break;
                }
                if (bmodel.SeasonName == null)
                {
                    bmodel.perNightRate = model.night;
                    bmodel.SeasonId = 0;
                }

                bmodel.TotalRoomPrice = bmodel.perNightRate * bmodel.days;

                bmodel.TotalPrice = bmodel.TotalRoomPrice + bmodel.bed.price + bmodel.hk.price +
                                    bmodel.pc.price;

                bmodel.Tax = 13;

                bmodel.TotalPriceWithTax = bmodel.TotalPrice * bmodel.Tax / 100;

                var bookingModel = new LayerDB.Booking()
                {
                    PropertyId = model.PropertyId,
                    CalculatedAmount = bmodel.TotalPrice,
                    TotalPrice = bmodel.TotalPrice,
                    StartDate = bmodel.fromDate,
                    EndDate = bmodel.toDate,
                    TotalPriceWithTax = bmodel.TotalPriceWithTax + bmodel.TotalPrice,
                    Tax = (int)bmodel.Tax,
                    isChecked = false,
                    isBooked = false,
                    TotalTaxPrice = bmodel.TotalPriceWithTax,
                    onCreated = DateTime.Now,
                    onModified = DateTime.Now,
                    Days = bmodel.days,
                    guid = Guid.NewGuid().ToString()
                };
                if (bmodel.SeasonId > 0)
                {
                    bookingModel.SeasonId = bmodel.SeasonId;
                }

                var listSerivces = new List<PropertyBookingService>
                        {
                            new PropertyBookingService()
                            {
                                PropertyServiceId = services["bed"].PropertyServiceId,
                            },
                            new PropertyBookingService()
                            {
                                PropertyServiceId = services["hk"].PropertyServiceId,
                                TimeLimitPerDay = bmodel.hk.d,
                                TimeLimitPerHour = bmodel.hk.h
                            },
                            new PropertyBookingService()
                            {
                                PropertyServiceId = services["pc"].PropertyServiceId,
                                TimeLimitPerDay = bmodel.pc.d,
                                TimeLimitPerHour = bmodel.pc.h
                            }
                        };
                bookingModel.PropertyBookingServices = listSerivces;

                var res = VerifyBooking(bookingModel,
                    PropertyDAO.GetPropertyBookingsVerified(bookingModel.PropertyId));
                if (res)
                {
                    bookingModel = PropertyDAO.BookProperty(bookingModel);
                    ViewBag.book = bmodel;
                    resultView = RedirectToAction("Booking", new { id = bookingModel.guid });
                }
                ViewBag.villaId = _id;
                if (model != null)
                    resultView = View(model);
            }
            return resultView;
        }

        public static bool isBooked(Booking model, List<DateModel> bookings)
        {
            var bookingFlag = true;
            foreach (var b in bookings)
            {
                if (model.StartDate >= b.sd && model.StartDate <= b.ed)
                {
                    bookingFlag = false;
                    break;
                }
                if (model.EndDate >= b.sd && model.EndDate <= b.ed)
                {
                    bookingFlag = false;
                    break;
                }
            }
            return bookingFlag;
        }

    }
}