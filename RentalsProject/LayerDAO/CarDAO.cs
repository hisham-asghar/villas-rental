using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CustomModels.Cars;
using CustomModels.Yachts;
using LayerDB;
using System.Data.Entity.Validation;

namespace LayerDAO
{
    public static class CarDAO
    {
        public static List<Specification> getSpecsList()
        {
            using (var db = new DBModel())
            {
                return db.Specifications.Where(s => s.Type == 0).ToList();
            }
        }
        public static CarModel getCar(int id)
        {
            using (var db = new DBModel())
            {
                return db.Cars.Select(y => new CarModel()
                {
                    id = y.CarId,
                    banner = y.Banner,
                    description = y.Description,
                    name = y.Name,
                    guid = y.guid,
                    Type = y.Type,
                    priceOneDay = y.OneDay,
                    priceWeek = y.Week,
                    priceThreeDays = y.ThreeDay
                }).FirstOrDefault(s => s.id == id);
            }
        }
        public static CarModel getCar(string guid)
        {
            using (var db = new DBModel())
            {
                return db.Cars.Select(y => new CarModel()
                {
                    id = y.CarId,
                    banner = y.Banner,
                    description = y.Description,
                    name = y.Name,
                    guid = y.guid,
                    Type = y.Type,
                    priceOneDay = y.OneDay,
                    priceWeek = y.Week,
                    priceThreeDays = y.ThreeDay
                }).FirstOrDefault(s => s.guid == guid);
            }
        }
        public static CarModelDetail getCarDetail(string guid)
        {
            using (var db = new DBModel())
            {
                var yt = db.Cars.Select(y => new CarModelDetail()
                {
                    id = y.CarId,
                    banner = y.Banner,
                    description = y.Description,
                    name = y.Name,
                    guid = y.guid,
                    Type = y.Type,
                    priceOneDay = y.OneDay,
                    priceWeek = y.Week,
                    priceThreeDays = y.ThreeDay,
                    images = db.Files.Where(f => f.FileType == 2 && f.FileTypeId == y.CarId).Select(f => f.FileName).ToList(),
                    specs = db.CarSpecifications.Where(ys => ys.CarID == y.CarId).Select(ys => new Spec()
                    {
                        Id = ys.CarSpecId,
                        Name = ys.Specification.SpecName,
                        Value = ys.Value
                    }).ToList()
                }).FirstOrDefault(s => s.guid == guid);
                if(yt != null)
                    yt.specs = GetYachtSpecifications(yt.id);
                return yt;
            }
        }
        public static List<CarModel> getCars(int type)
        {
            using (var db = new DBModel())
            {
                if (type == -1)
                {
                    return db.Cars.Select(y => new CarModel()
                    {
                        id = y.CarId,
                        banner = y.Banner,
                        description = y.Description,
                        name = y.Name,
                        guid = y.guid,
                        Type = y.Type,
                        TypeName = y.Type == 0 ? "Exotic" : "Luxury",
                        priceOneDay = y.OneDay,
                        priceWeek = y.Week,
                        priceThreeDays = y.ThreeDay
                    }).ToList();
                }
                else
                {
                    return db.Cars.Select(y => new CarModel()
                    {
                        id = y.CarId,
                        banner = y.Banner,
                        description = y.Description,
                        name = y.Name,
                        guid = y.guid,
                        Type = y.Type,
                        priceOneDay = y.OneDay,
                        priceWeek = y.Week,
                        priceThreeDays = y.ThreeDay
                    }).Where(s => s.Type == type).ToList();
                }
            }
        }

        public static List<CarModel> getCars()
        {
            using (var db = new DBModel())
            {
                return db.Cars.Select(y => new CarModel()
                {
                    id = y.CarId,
                    banner = y.Banner,
                    description = y.Description,
                    name = y.Name,
                    guid = y.guid,
                    Type = y.Type,
                    priceOneDay = y.OneDay,
                    priceWeek = y.Week,
                    priceThreeDays = y.ThreeDay
                }).ToList();
            }
        }

        public static List<CustomModels.Yachts.Spec> GetYachtSpecifications(int id)
        {
            using (var db = new DBModel())
            {
                var specList = db.Specifications.Where(s => s.Type == 0).ToList();
                var dic = specList.ToDictionary(sp => sp.SpecId, sp => sp.SpecName);

                var list = db.CarSpecifications.Where(y => y.CarID == id).ToList();
                return list.Select(y => new Spec
                {
                    Value = y.Value,
                    Id = y.CarSpecificationID,
                    Name = dic[y.CarSpecificationID]
                }).ToList();
            }
        }

        public static int SaveYacht(int id, NewCarModel model, List<CarSpecification> specs)
        {
            using (var db = new DBModel())
            {
                try
                {
                    var guidUrl = CustomFunctions.Guid(model.name);
                    if (id != 0) return id;
                    var yacht = new Car()
                    {
                        Name = model.name.Replace("'", "'"),
                        Description = model.description,
                        Banner = model.banner,
                        OneDay = model.priceOneDay,
                        ThreeDay = model.priceThreeDays,
                        Week = model.priceWeek,
                        Type = model.Type,
                        guid = guidUrl
                    };
                    db.Cars.Add(yacht);
                    db.SaveChanges(); StaticData.updateData();

                    foreach (var im in model.YachtsImage)
                    {
                        db.Files.Add(new File()
                        {
                            FileName = im,
                            mimeType = "image",
                            onCreated = DateTime.Now,
                            onModified = DateTime.Now,
                            Description = "",
                            FileType = 2,
                            FileTypeId = yacht.CarId
                        });
                        db.SaveChanges(); StaticData.updateData();
                    }

                    foreach (var sp in specs)
                    {
                        var query =
                            "INSERT INTO [dbo].[CarSpecification]([CarId],[CarSpecID],[Value])VALUES({0},{1},'{2}');";
                        query = string.Format(query, yacht.CarId, sp.Specification.SpecId, sp.Value.Replace("'", "''"));
                        db.Database.ExecuteSqlCommand(query);
                    }
                    id = yacht.CarId;
                    return id;
                }
                catch (Exception e)
                {
                    return -1;
                }
            }
        }

        public static bool updateCarsUrl()
        {
            using (var db = new DBModel())
            {
                var list = db.Cars.ToList();
                foreach (var p in list)
                {
                    var guid = p.Name.Trim().ToLower();
                    if (guid.Contains(' '))
                        guid = guid.Replace(' ', '-');
                    guid = System.Text.RegularExpressions.Regex.Replace(guid, @"[^0-9a-zA-Z]+", "-");
                    p.guid = guid;
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

        public static List<string> GetUrls()
        {
            using(var db = new DBModel())
            {
                return db.Cars.Select(c => c.guid).ToList();
            }
        }
    }
}
