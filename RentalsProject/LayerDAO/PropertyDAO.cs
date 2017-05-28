using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CustomModels;
using LayerDB;

namespace LayerDAO
{
    public class PropertyDAO
    {
        public static List<PropertyType> getPropertyType()
        {
            using (var db = new DBModel())
            {
                return db.PropertyTypes.ToList();
            }
        }

        public static List<AmenitiesType> getAmenitiesType()
        {
            using (var db = new DBModel())
            {
                return db.AmenitiesTypes.ToList();
            }
        }

        public static List<City> getCities()
        {
            using (var db = new DBModel())
            {
                return db.Cities.ToList();
            }
        }

        public static int saveProperty(PropertiesModel model)
        {
            PropertyDetail propertyDetail = new PropertyDetail
            {
                TypeId = model.propertyType,
                Name = model.propertyname,
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

            Location location = new Location
            {
                CityId = model.city,
                Country = model.country,
                Latitude = model.latitude,
                Logitude = model.longitude,
                ZipCode = model.postalcode,
                StreetName = model.street
            };
            
            Composition compositionProperty = new Composition
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
                    Amenity amenity = new Amenity()
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
                    var t = new LayerDB.PropertyRentalBudgetDetail()
                    {
                        onCreated = DateTime.Now,
                        onModified = DateTime.Now,
                        PropertyId = propertyDetail.PropertyId,
                        EndDate = a.ed,
                        StartDate = a.sd,
                        Price = a.price
                    };
                    db.PropertyRentalBudgetDetails.Add(t);
                }
                try
                {
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    int x = 0;
                }

                return propertyDetail.PropertyId;

            }

        }

        public static List<Tag> getPropertyTags()
        {
            using (var db = new DBModel())
            {
                return db.Tags.ToList();
            }
        }

        public static List<PropertiesModelGetter> getPropertyList(int cnt)
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
                    where composition != null && listImages.Count > 0 && listRates.Count > 0
                    select new PropertiesModelGetter
                    {
                        propertyid = propertyModel.PropertyId, 
                        propertyname = propertyModel.Name, 
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


        public static List<PropertiesModelGetter> getPropertyList(int cnt,string token)
        {
            using (var db = new DBModel())
            {

                var city = db.Cities.FirstOrDefault(c => c.guid.ToLower() == token.ToLower());
                if (city == null)
                    return null;
                var lipp = db.PropertyDetails.Where(p => p.Availablity && p.isActive).ToList();
                var properyList = lipp.Where(p => p.Location.CityId == city.CityId).ToList();
                return (from propertyModel in properyList
                        let propertyId = propertyModel.PropertyId
                        let propertytypeId = propertyModel.TypeId
                        let composition = propertyModel.Compositions.FirstOrDefault()
                        let listTags = propertyModel.PropertyTags.Select(pt => new KeyValuePair<int, string>(pt.Tag.TagId, pt.Tag.TagName)).ToList()
                        let listRates = propertyModel.PropertyRentalBudgetDetails.Where(r => r.PropertyId == propertyId).Select(r => new RateModel()
                        {
                            sd = r.StartDate,
                            ed = r.EndDate,
                            price = r.Price
                        }).ToList()
                        where composition != null && listRates.Count > 0
                        select new PropertiesModelGetter
                        {
                            propertyid = propertyModel.PropertyId,
                            propertyname = propertyModel.Name,
                            maxguests = propertyModel.MaxGuests,
                            propertyType = new KeyValuePair<int, string>
                                (propertyModel.PropertyType.PropertyTypeId, propertyModel.PropertyType.PropertyTypeName),
                            beds = composition.Bedrooms,
                            baths = composition.Bathrooms,
                            toilets = composition.Toilets,
                            tags = listTags,
                            banner = propertyModel.banner,
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

        public static PropertiesModelGetter getPropertyById(int id)
        {
            using (var db = new DBModel())
            {
                var propertyModel = db.PropertyDetails.FirstOrDefault(p => p.PropertyId == id);
                if (propertyModel != null)
                {
                    int propertyId = propertyModel.PropertyId;
                    int propertytypeId = propertyModel.TypeId;
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
                                price = r.Price
                            }).ToList();
                    if (composition != null && listImages.Count > 0 && listRates.Count > 0)
                    {
                        var model = new PropertiesModelGetter
                        {
                            propertyid =  propertyModel.PropertyId,
                            propertyname = propertyModel.Name,
                            description = propertyModel.Description,
                            maxguests = propertyModel.MaxGuests,
                            propertyType = new KeyValuePair<int, string>(propertyModel.PropertyType.PropertyTypeId, propertyModel.PropertyType.PropertyTypeName),
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
                        };
                        return model;
                    }
                }
                return null;
            }
        }
    }
}

