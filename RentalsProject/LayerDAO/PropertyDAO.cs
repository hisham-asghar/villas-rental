using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using CustomModels;
using CustomModels.PropertyModels;
using LayerDB;

namespace LayerDAO
{
    public class PropertyDAO
    {
        public static List<PropertyType> GetPropertyType()
        {
            using (var db = new DBModel())
            {
                return db.PropertyTypes.ToList();
            }
        }

        public static List<AmenitiesType> GetAmenitiesType()
        {
            using (var db = new DBModel())
            {
                return db.AmenitiesTypes.ToList();
            }
        }

        public static List<City> GetCities()
        {
            using (var db = new DBModel())
            {
                return db.Cities.ToList();
            }
        }

        public static int SaveCity(City city)
        {
            using (var db = new DBModel())
            {
                var guid = city.CityName.ToLower();
                if (guid.Contains(" "))
                {
                    guid = guid.Replace(" ", "-");
                }
                city.guid = guid;
                if (city.CityId > 0)
                {
                    var cityDb = db.Cities.FirstOrDefault(c => c.CityId == city.CityId);
                    if (cityDb != null)
                    {
                        cityDb.Address = city.Address;
                        cityDb.CityName = city.CityName;
                        cityDb.longitude = city.longitude;
                        cityDb.latitude = city.latitude;
                        if(!string.IsNullOrWhiteSpace(city.banner))
                            cityDb.banner = city.banner;
                        cityDb.guid = guid;
                    }
                    else
                        db.Cities.Add(city);
                }
                else
                {
                    db.Cities.Add(city);   
                }
                try
                {
                    db.SaveChanges();
                    return city.CityId;
                }
                catch (Exception e)
                {
                    return -1;
                }
            }
        }
        public static City GetCity(string token)
        {
            using (var db = new DBModel())
            {
                return db.Cities.FirstOrDefault(c => c.guid.ToLower() == token.ToLower());
            }
        }
        public static City GetCity(int id)
        {
            using (var db = new DBModel())
            {
                return db.Cities.FirstOrDefault(c => c.CityId == id);
            }
        }

        public static int SaveProperty(PropertiesModel model)
        {
            var propertyDetail = new PropertyDetail
            {
                TypeId = model.propertyType,
                Name = model.propertyname,
                SubName = model.propertysubname,
                Availablity = true,
                Description = model.description,
                MaxGuests = model.maxguests,
                OnCreated = DateTime.Now,
                OnModified = DateTime.Now,
                SpaceFT =  0,
                SpaceM2 = 0,
                MinStay = 0,
                guid = Guid.NewGuid().ToString(),
                banner = model.banner,
                pdfFile = model.pdfFile,
                videoURL = model.pdfFile,
                isActive = true
            };

            var location = new Location
            {
                CityId = model.city,
                Country = model.country,
                Latitude = model.latitude,
                Logitude = model.longitude,
                ZipCode = model.postalcode,
                StreetName = model.street
            };
            
            var compositionProperty = new Composition
            {
                Bathrooms = model.baths,
                Bedrooms = model.beds,
                Toilets = model.toilets
            };

            

            using (var db = new DBModel())
            {
                db.Locations.Add(location);
                try
                {
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    return -1;
                }
                
                propertyDetail.LocationId = location.LocationId;
                db.PropertyDetails.Add(propertyDetail);
                try
                {
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    return -1;
                }

                compositionProperty.PropertyId = propertyDetail.PropertyId;
                db.Compositions.Add(compositionProperty);
                try
                {
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    return -1;
                }

                foreach (var a in model.amenities)
                {
                    var amenity = new Amenity()
                    {
                        AmenitiesTypeId = a,
                        PropertyId = propertyDetail.PropertyId
                    };
                    db.Amenities.Add(amenity);
                }
                try
                {
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    return -1;
                }

                if(model.tags != null)
                {

                    foreach (var a in model.tags)
                    {
                        var t = new PropertyTag()
                        {
                            PropertyId = propertyDetail.PropertyId,
                            TagId = a
                        };
                        db.PropertyTags.Add(t);
                    }
                    try
                    {
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        return -1;
                    }
                }


                foreach (var a in model.ImagesList)
                {
                    var t = new LayerDB.File()
                    {
                        FileName = a,
                        FileType = model.propertyType,
                        FileTypeId = propertyDetail.PropertyId,
                        mimeType = "image/jpg",
                        onCreated = DateTime.Now,
                        onModified = DateTime.Now,
                        Description = model.propertyname,
                    };
                    db.Files.Add(t);
                }
                try
                {
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    return -1;
                }

                foreach (var a in model.rates)
                {
                    var sd = new DateTime(DateTime.Now.Year, a.sd.Month, a.sd.Day);
                    var ed = new DateTime(DateTime.Now.Year, a.ed.Month, a.ed.Day);
                    
                    var t = new PropertyRentalBudgetDetail()
                    {
                        onCreated = DateTime.Now,
                        onModified = DateTime.Now,
                        PropertyId = propertyDetail.PropertyId,
                        Price = a.price,
                        EndDate = ed,
                        StartDate = sd,
                        SeasonName = a.SeasonName
                    };
                    db.PropertyRentalBudgetDetails.Add(t);

                    db.SaveChanges();
                }

                return propertyDetail.PropertyId;

            }

        }

        public static List<Tag> GetPropertyTags()
        {
            using (var db = new DBModel())
            {
                return db.Tags.ToList();
            }
        }

        public static List<PropertiesModelGetter> GetPropertyList(int cnt)
        {
            using (var db = new DBModel())
            {
                var properyList = db.PropertyDetails.Where(p => p.Availablity && p.isActive).ToList();

                return (from propertyModel in properyList
                    let propertyId = propertyModel.PropertyId
                    let propertytypeId = propertyModel.TypeId
                    let composition = propertyModel.Compositions.FirstOrDefault()
                    let listTags = propertyModel.PropertyTags.Select(pt => new KeyValuePair<int, string>(pt.Tag.TagId, pt.Tag.TagName)).ToList()
                    let listAminities = propertyModel.Amenities.Select(pt => new KeyValuePair<int, string>(pt.AmenitiesType.AmenitiesTypeId, pt.AmenitiesType.AmenitiesTypeName)).ToList()
                    let listImages = db.Files.Where(f => f.FileType == propertytypeId && f.FileTypeId == propertyId).Select(pt => pt.FileName).ToList()
                    let listRates = propertyModel.PropertyRentalBudgetDetails.Where(r => r.PropertyId == propertyId).Select(r => new RateModel()
                    {
                        sd = r.StartDate, ed = r.EndDate, price = r.Price
                    }).ToList()
                    select new PropertiesModelGetter
                    {
                        propertyid = propertyModel.PropertyId, 
                        propertyname = propertyModel.Name,
                        propertysubname = propertyModel.SubName,
                        night = propertyModel.night,
                        description = propertyModel.Description, 
                        maxguests = propertyModel.MaxGuests, 
                        propertyType = new KeyValuePair<int, string>
                            (propertyModel.PropertyType.PropertyTypeId, propertyModel.PropertyType.PropertyTypeName), 
                        beds = composition.Bedrooms, 
                        baths = composition.Bathrooms, 
                        toilets = composition.Toilets, 
                        tags = listTags, 
                        amenities = listAminities, 
                        ImagesList = listImages, 
                        street = propertyModel.Location.StreetName, 
                        city = propertyModel.Location.City.CityName, 
                        country = propertyModel.Location.Country, 
                        postalcode = propertyModel.Location.ZipCode != null ? (int) propertyModel.Location.ZipCode : 0, 
                        latitude = propertyModel.Location.Latitude != null ? (float) propertyModel.Location.Latitude : 0, 
                        longitude = propertyModel.Location.Logitude != null ? (float) propertyModel.Location.Logitude : 0, 
                        rates = listRates
                    }).ToList();
            }
        }


        public static List<PropertiesModelGetter> GetDeactivatedPropertyList(int cnt)
        {
            using (var db = new DBModel())
            {
                var properyList = db.PropertyDetails.Where(p => p.isActive == false).ToList();

                return (from propertyModel in properyList
                        let propertyId = propertyModel.PropertyId
                        let propertytypeId = propertyModel.TypeId
                        let composition = propertyModel.Compositions.FirstOrDefault()
                        let listTags = propertyModel.PropertyTags.Select(pt => new KeyValuePair<int, string>(pt.Tag.TagId, pt.Tag.TagName)).ToList()
                        let listAminities = propertyModel.Amenities.Select(pt => new KeyValuePair<int, string>(pt.AmenitiesType.AmenitiesTypeId, pt.AmenitiesType.AmenitiesTypeName)).ToList()
                        let listImages = db.Files.Where(f => f.FileType == propertytypeId && f.FileTypeId == propertyId).Select(pt => pt.FileName).ToList()
                        let listRates = propertyModel.PropertyRentalBudgetDetails.Where(r => r.PropertyId == propertyId).Select(r => new RateModel()
                        {
                            sd = r.StartDate,
                            ed = r.EndDate,
                            price = r.Price
                        }).ToList()
                        select new PropertiesModelGetter
                        {
                            propertyid = propertyModel.PropertyId,
                            propertyname = propertyModel.Name,
                            propertysubname = propertyModel.SubName,
                            night = propertyModel.night,
                            description = propertyModel.Description,
                            maxguests = propertyModel.MaxGuests,
                            propertyType = new KeyValuePair<int, string>
                                (propertyModel.PropertyType.PropertyTypeId, propertyModel.PropertyType.PropertyTypeName),
                            beds = composition.Bedrooms,
                            baths = composition.Bathrooms,
                            toilets = composition.Toilets,
                            tags = listTags,
                            amenities = listAminities,
                            ImagesList = listImages,
                            street = propertyModel.Location.StreetName,
                            city = propertyModel.Location.City.CityName,
                            country = propertyModel.Location.Country,
                            postalcode = propertyModel.Location.ZipCode != null ? (int)propertyModel.Location.ZipCode : 0,
                            latitude = propertyModel.Location.Latitude != null ? (float)propertyModel.Location.Latitude : 0,
                            longitude = propertyModel.Location.Logitude != null ? (float)propertyModel.Location.Logitude : 0,
                            rates = listRates
                        }).ToList();
            }
        }

        public static List<PropertiesModelGetter> GetPropertyList(int cnt,string token)
        {
            using (var db = new DBModel())
            {
                var city = db.Cities.FirstOrDefault(c => c.guid.ToLower() == token.ToLower());
                if (city == null)
                    return null;
                var lipp = db.PropertyDetails.Where(p => p.Availablity && p.isActive).ToList();
                var properyList = lipp.Where(p => p.Location.CityId == city.CityId).ToList();
                var reList = new List<PropertiesModelGetter>();
                foreach (var propertyModel in properyList)
                {
                    var propertyId = propertyModel.PropertyId;
                    var propertytypeId = propertyModel.TypeId;
                    var composition = propertyModel.Compositions.FirstOrDefault();
                    var listTags = propertyModel.PropertyTags.Select(pt => new KeyValuePair<int, string>(pt.Tag.TagId, pt.Tag.TagName)).ToList();
                    var listAminities = propertyModel.Amenities.Select(pt => new KeyValuePair<int, string>(pt.AmenitiesType.AmenitiesTypeId, pt.AmenitiesType.AmenitiesTypeName)).ToList();
                    var listImages = db.Files.Where(f => f.FileType == propertytypeId && f.FileTypeId == propertyId).Select(pt => pt.FileName).ToList();
                    var listRates =
                        propertyModel.PropertyRentalBudgetDetails.Where(r => r.PropertyId == propertyId)
                            .Select(r => new RateModel()
                            {
                                sd = r.StartDate,
                                ed = r.EndDate,
                                price = r.Price,
                                SeasonName = r.SeasonName,
                                guest_price = r.guest_price,
                                minStay = r.minStay,
                            }).ToList();
                    if (composition != null)
                    {
                        var model = new PropertiesModelGetter
                        {
                            propertyid = propertyModel.PropertyId,
                            propertyname = propertyModel.Name,
                            propertysubname = propertyModel.SubName,
                            description = propertyModel.Description,
                            maxguests = propertyModel.MaxGuests,
                            propertyType = new KeyValuePair<int, string>(propertyModel.PropertyType.PropertyTypeId, propertyModel.PropertyType.PropertyTypeName),
                            beds = composition.Bedrooms,
                            night = propertyModel.night,
                            baths = composition.Bathrooms,
                            toilets = composition.Toilets,
                            tags = listTags,
                            amenities = listAminities,
                            ImagesList = listImages,
                            banner = propertyModel.banner,
                            street = propertyModel.Location.StreetName,
                            city = propertyModel.Location.City.CityName,
                            country = propertyModel.Location.Country,
                            postalcode = (int)propertyModel.Location.ZipCode,
                            latitude = (float)propertyModel.Location.Latitude,
                            longitude = (float)propertyModel.Location.Logitude,
                            rates = listRates
                        };
                        reList.Add(model);
                    }
                }
                return reList;
            }
        }

        public static List<PropertyView> GetPropertyDetailList(int cnt, string token)
        {
            using (var db = new DBModel())
            {
                var list = db.PropertyDetailViews.Where(p => p.isActive && p.Availablity && p.night > 0).ToList();
                    
                if (!string.IsNullOrWhiteSpace(token))
                {
                    list = list.Where(p => p.CityGuid.ToLower() == token.ToLower()).ToList();
                }
                var nlist = new List<PropertyView>();
                foreach (var p in list)
                {
                    var pro = new PropertyView
                    {
                        Country = p.Country,
                        CityGuid = p.CityGuid,
                        AmenitiesList = p.AmenitiesList,
                        Availablity = p.Availablity,
                        Bathrooms = p.Bathrooms,
                        Bedrooms = p.Bedrooms,
                        CityId = p.CityId,
                        CityName = p.CityName,
                        pdfFile = p.pdfFile,
                        CompositionId = p.CompositionId,
                        Description = p.Description,
                        Expr1 = p.Expr1,
                        Images = p.Images,
                        Latitude = p.Latitude,
                        LocationId = p.LocationId,
                        Logitude = p.Logitude,
                        MaxGuests = p.MaxGuests,
                        MinStay = p.MinStay,
                        Name = p.Name,
                        OnCreated = p.OnCreated,
                        OnModified = p.OnModified,
                        PropertyId = p.PropertyId,
                        PropertyTagsList = p.PropertyTagsList,
                        SpaceFT = p.SpaceFT,
                        SpaceM2 = p.SpaceM2,
                        StreetName = p.StreetName,
                        StreetNo = p.StreetNo,
                        SubName = p.SubName,
                        Toilets = p.Toilets,
                        TypeId = p.TypeId,
                        ZipCode = p.ZipCode,
                        banner = p.banner,
                        guid = p.guid,
                        isActive = p.isActive,
                        night = p.night,
                        videoURL = p.videoURL
                    };
                    pro.imageList = !string.IsNullOrWhiteSpace(pro.Images) ? new List<string>(p.Images.Split('#')) : new List<string>();
                    pro.amenitiesList = !string.IsNullOrWhiteSpace(pro.AmenitiesList) ? new List<string>(p.AmenitiesList.Split('#')) : new List<string>();
                    pro.tagsList = !string.IsNullOrWhiteSpace(pro.PropertyTagsList) ? new List<string>(p.PropertyTagsList.Split('#')) : new List<string>();
                    nlist.Add(pro);
                }
                return nlist;
            }
        }

        public static PropertyView GetPropertyById(int id)
        {
            using (var db = new DBModel())
            {
                var prop = db.PropertyDetailViews.Where(p => p.PropertyId == id)
                    .Select(p => new PropertyView()
                    {
                        Country = p.Country,
                        CityGuid = p.CityGuid,
                        AmenitiesList = p.AmenitiesList,
                        Availablity = p.Availablity,
                        Bathrooms = p.Bathrooms,
                        Bedrooms = p.Bedrooms,
                        CityId = p.CityId,
                        CityName = p.CityName,
                        pdfFile = p.pdfFile,
                        CompositionId = p.CompositionId,
                        Description = p.Description,
                        Expr1 = p.Expr1,
                        Images = p.Images,
                        Latitude = p.Latitude,
                        LocationId = p.LocationId,
                        Logitude = p.Logitude,
                        MaxGuests = p.MaxGuests,
                        MinStay = p.MinStay,
                        Name = p.Name,
                        OnCreated = p.OnCreated,
                        OnModified = p.OnModified,
                        PropertyId = p.PropertyId,
                        PropertyTagsList = p.PropertyTagsList,
                        SpaceFT = p.SpaceFT,
                        SpaceM2 = p.SpaceM2,
                        StreetName = p.StreetName,
                        StreetNo = p.StreetNo,
                        SubName = p.SubName,
                        Toilets = p.Toilets,
                        TypeId = p.TypeId,
                        ZipCode = p.ZipCode,
                        banner = p.banner,
                        guid = p.guid,
                        isActive = p.isActive,
                        night = p.night,
                        videoURL = p.videoURL
                    }).FirstOrDefault();
                if (prop == null) return null;

                prop.imageList = !string.IsNullOrWhiteSpace(prop.Images) ? new List<string>(prop.Images.Split('#')) : new List<string>();
                prop.amenitiesList = !string.IsNullOrWhiteSpace(prop.AmenitiesList) ? new List<string>(prop.AmenitiesList.Split('#')) : new List<string>();
                prop.tagsList = !string.IsNullOrWhiteSpace(prop.PropertyTagsList) ? new List<string>(prop.PropertyTagsList.Split('#')) : new List<string>();
                prop.rates = db.PropertyRentalBudgetDetails.Where(r => r.PropertyId == id)
                        .Select(r => new RateModel()
                        {
                            sd = r.StartDate,
                            ed = r.EndDate,
                            price = r.Price,
                            SeasonName = r.SeasonName,
                            guest_price = r.guest_price,
                            minStay = r.minStay,
                            SeasonId = r.RentalBudgetId
                        }).ToList();
                prop.rates = prop.rates ?? new List<RateModel>();
                return prop;
            }
        }

        public static bool Deactive(int id,bool val)
        {
            using (var db = new DBModel())
            {
                var model = db.PropertyDetails.FirstOrDefault(p => p.PropertyId == id);
                if (model == null)
                    return false;
                try
                {
                    if (string.IsNullOrWhiteSpace(model.guid))
                    {
                        var guid = model.Name.ToLower();
                        if (guid.Contains(" "))
                        {
                            guid = guid.Replace(" ", "-");
                        }
                        model.guid = guid;
                    }
                    model.isActive = val;
                    db.SaveChanges();
                    return true;
                }
                catch(Exception e)
                {
                    return false;
                }
            }
        }

        public static bool Verify(int id)
        {
            using (var db = new DBModel())
            {
                return db.PropertyDetails.Count(p => p.PropertyId == id) > 0;
                
            }
        }

        public static bool UpdateRates(List<PropertyRentalBudgetDetail> list, int id)
        {
            using (var db = new DBModel())
            {
                var property = db.PropertyDetails.FirstOrDefault(p => p.PropertyId == id);
                if (property == null)
                    return false;
                var items = property.PropertyRentalBudgetDetails;
                db.PropertyRentalBudgetDetails.RemoveRange(items); 

                try
                {
                    db.SaveChanges();
                    db.PropertyRentalBudgetDetails.AddRange(list);
                    db.SaveChanges();
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

        public static UpdateExtraModel GetExtraModel(int id)
        {
            using (var db = new DBModel())
            {
                return db.PropertyDetails.Select(p => new UpdateExtraModel()
                {
                    bannerUrl = p.banner,
                    pdfUrl = p.pdfFile,
                    videoUrl = p.videoURL,
                    propertyId = p.PropertyId
                }).FirstOrDefault(p => p.propertyId == id);
            }
        }

        public static bool SaveExtraModel(int id,UpdateExtraModel model)
        {
            using (var db = new DBModel())
            {
                try
                {
                    var extra = db.PropertyDetails.FirstOrDefault(p => p.PropertyId == id);
                    if (extra == null)
                        return false;
                    extra.pdfFile = model.pdfUrl;
                    extra.videoURL = model.videoUrl;
                    extra.banner = model.bannerUrl;
                    db.SaveChanges();
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

        public static PropertyBasicInfo GetBasicInfoModel(int id)
        {
            using (var db = new DBModel())
            {
                return db.PropertyDetails.Select(p => new PropertyBasicInfo()
                {
                    propertyId = p.PropertyId,
                    propertyname = p.Name,
                    propertysubname = p.SubName,
                    propertyType = p.TypeId,
                    maxguests = p.MaxGuests,
                    city = p.Location.CityId,
                    latitude = p.Location.Latitude,
                    longitude = p.Location.Logitude,
                    street = p.Location.StreetName,
                    country = p.Location.Country,
                    postalcode = p.Location.ZipCode
                }).FirstOrDefault(p => p.propertyId == id);
            }
        }

        public static bool SaveBasicInfoModel(int id, PropertyBasicInfo model)
        {
            using (var db = new DBModel())
            {
                var property = db.PropertyDetails.FirstOrDefault(p => p.PropertyId == id);
                if (property == null)
                    return false;
                property.Name = model.propertyname;
                property.SubName = model.propertysubname;
                property.TypeId = model.propertyType;
                property.MaxGuests = model.maxguests;
                property.Location.CityId = model.city;
                property.Location.Latitude = model.latitude;
                property.Location.Logitude = model.longitude;
                property.Location.StreetName = model.street;
                property.Location.Country = model.country;
                property.Location.ZipCode = model.postalcode;
                try
                {
                    db.SaveChanges();
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

        public static int GetMaxNightPrice(int cityId)
        {
            using (var db = new DBModel())
            {
                return Convert.ToInt32(Math.Floor(db.PropertyDetails.Max(p => p.night)));
            }
        }

        public static bool updateNights()
        {
            using (var db = new DBModel())
            {
                var list = db.PropertyDetails.ToList();
                foreach (var p in list)
                {
                    var min = db.PropertyRentalBudgetDetails.Where(pr => pr.PropertyId == p.PropertyId).ToList();
                    if (min != null & min.Count > 0)
                    {
                        p.night = min.Min(pr => pr.Price);
                    }
                    if (string.IsNullOrWhiteSpace(p.guid))
                        p.guid = Guid.NewGuid().ToString();
                }
                try
                {
                    db.SaveChanges();
                }
                catch (DbEntityValidationException e)
                {
                    return false;
                }
                catch (Exception e)
                {
                    return false;
                }
                return true;
            }

        }

        public static List<PropertyRentalBudgetDetail> GetPropertyRentalDetails(int id)
        {
            if(id == 0)
                return new List<PropertyRentalBudgetDetail>();
            using (var db = new DBModel())
            {
                return db.PropertyRentalBudgetDetails.Where(p => p.PropertyId == id).ToList();
            }
        }

        public static PropertyDetail GetProperty(int id)
        {
            using (var db = new DBModel())
            {
                return db.PropertyDetails.FirstOrDefault(p => p.PropertyId == id);
            }
        }

        public static Dictionary<string,PropertyService> GetPropertyServices()
        {
            using (var db = new DBModel())
            {
                return db.PropertyServices.ToDictionary(k => k.Guid, v => v);
            }
        }

        public static Booking BookProperty(Booking bookingModel)
        {
            using (var db = new DBModel())
            {
                db.Bookings.Add(bookingModel);
                try
                {
                    db.SaveChanges();
                }
                catch (DbEntityValidationException)
                {
                    return null;
                }
                catch (Exception e)
                {
                    return null;
                }
                return bookingModel;
            }
        }

        public static Booking GetBooking(string id)
        {
            using (var db = new DBModel())
            {
                return db.Bookings.FirstOrDefault(b => b.guid == id);
            }
        }

        public static Dictionary<int,PropertyService> GetPropertyServicesDictionaryById()
        {
            using (var db = new DBModel())
            {
                return db.PropertyServices.ToDictionary(k => k.PropertyServiceId, v => v);
            }
        }

        public static List<PropertyBookingService> GetBookingPropertyServices(int bookingBookingId)
        {
            using (var db = new DBModel())
            {
                return db.PropertyBookingServices.Where(p => p.BookingId == bookingBookingId).ToList();
            }
        }

        public static PropertyRentalBudgetDetail GetBookingSeason(int bookingBookingId)
        {
            using (var db = new DBModel())
            {
                return db.Bookings.Where(b => b.BookingId == bookingBookingId).Select(b => b.PropertyRentalBudgetDetail)
                    .FirstOrDefault();
            }
        }

        public static List<DateModel> GetPropertyBookings(int id)
        {
            using (var db = new DBModel())
            {
                return db.Bookings.Where(b => b.PropertyId == id).Select(b => new DateModel()
                {
                    sd = b.StartDate,
                    ed = b.EndDate
                }).ToList();
            }
        }

        public static List<DateModel> GetPropertyBookingsVerified(int id)
        {
            using (var db = new DBModel())
            {
                return db.Bookings.Where(b => b.PropertyId == id && b.isBooked).Select(b => new DateModel()
                {
                    sd = b.StartDate,
                    ed = b.EndDate
                }).ToList();
            }
        }
        public static List<DateModel> GetPropertyBookingsChecked(int id)
        {
            using (var db = new DBModel())
            {
                return db.Bookings.Where(b => b.PropertyId == id && b.isBooked && b.isChecked)
                    .Select(b => new DateModel()
                    {
                        sd = b.StartDate,
                        ed = b.EndDate
                    }).ToList();
            }
        }

        public static bool SavePropertyBooker(User u, int modelBookingBookingId)
        {
            using (var db = new DBModel())
            {
                //db.Users.Add(u);
                var str = "INSERT INTO [dbo].[Users]([FirstName],[LastName],[Email],[PhoneNumber],[Zip],[Country],[Address],[City],[State],[CardNumber],[ExpirationDate],[CardCode])"+
                        "VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}')";
                str = String.Format(str, u.FirstName, u.LastName, u.Email, u.PhoneNumber, u.Zip, u.Country, u.Address,
                    u.City, u.State, u.CardNumber, u.ExpirationDate, u.CardCode);
                var booking = db.Bookings.FirstOrDefault(p => p.BookingId == modelBookingBookingId);
                try
                {
                    db.Database.ExecuteSqlCommand(str);
                    if (booking != null)
                    {
                        var user = db.Users.OrderByDescending(p => p.UserId).FirstOrDefault();
                        if(user != null)
                        booking.UserId = user.UserId;
                        db.SaveChanges();
                    }
                }
                catch (DbEntityValidationException e)
                {
                    return false;
                }
                catch (Exception e)
                {
                    return false;
                }
                return true;
            }
        }

        public static User GetUser(int bookingUserId = 0)
        {
            using (var db = new DBModel())
            {
                return db.Users.FirstOrDefault(u => u.UserId == bookingUserId);
            }
        }

        public static bool BookPropertyVerfied(int modelBookingBookingId)
        {
            using (var db = new DBModel())
            {
                var booking = db.Bookings.FirstOrDefault(b => b.BookingId == modelBookingBookingId);
                if(booking == null)
                    return false;
                try
                {
                    booking.isBooked = true;
                    booking.guid = Guid.NewGuid().ToString();
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    return false;
                }
                return true;
            }
        }

        public static List<PropertyFilters> GetPropertiesFilters()
        {
            using(var db = new DBModel())
            {
                return db.PropertyDetails.Include("PropertyTags")
                    .Where(p => p.isActive && p.Availablity).Select(p => new PropertyFilters()
                {
                    id = p.PropertyId,
                    name = p.Name,
                    filters = p.PropertyTags.Select(pf => pf.TagId).ToList()
                }).ToList();
            }
        }
    }
}



