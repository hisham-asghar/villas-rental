using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CustomModels.Yachts;
using LayerDB;

namespace LayerDAO
{
    public static class YachtDAO
    {
        public static List<Specification> getSpecsList()
        {
            using (var db = new DBModel())
            {
                return db.Specifications.Where(s => s.Type == 1).ToList();
            }
        }
        public static YachtModel getYacht(int id)
        {
            using (var db = new DBModel())
            {
                return db.Yachts.Select(y => new YachtModel()
                {
                    id = y.YachtID,
                    banner = y.Banner,
                    description = y.Description,
                    length = y.Length,
                    name = y.Name,
                    guid = y.guid
                }).FirstOrDefault(s => s.id == id);
            }
        }
        public static YachtModel getYacht(string guid)
        {
            using (var db = new DBModel())
            {
                return db.Yachts.Select(y => new YachtModel()
                {
                    id = y.YachtID,
                    banner = y.Banner,
                    description = y.Description,
                    length = y.Length,
                    name = y.Name,
                    guid = y.guid
                }).FirstOrDefault(s => s.guid == guid);
            }
        }
        public static YachtModelDetail getYachtDetail(string guid)
        {
            using (var db = new DBModel())
            {
                var yt = db.Yachts.Select(y => new YachtModelDetail()
                {
                    id = y.YachtID,
                    banner = y.Banner,
                    description = y.Description,
                    length = y.Length,
                    name = y.Name,
                    guid = y.guid,
                    images = db.Files.Where(f => f.FileType == 3 && f.FileTypeId == y.YachtID).Select(f => f.FileName).ToList(),
                    specs = db.YachtSpecifications.Where(ys => ys.YachtId == y.YachtID).Select(ys => new Spec()
                    {
                        Id = ys.YachtSpecId,
                        Name = ys.Specification.SpecName,
                        Value = ys.Value
                    }).ToList()
                }).FirstOrDefault(s => s.guid == guid);
                yt.specs = GetYachtSpecifications(yt.id);
                return yt;
            }
        }
        public static List<YachtModel> getYachts(double l1, double l2)
        {
            using (var db = new DBModel())
            {
                if (l1 == 0.0 && l2 == 0.0)
                {
                    return db.Yachts.Select(y => new YachtModel()
                    {
                        id = y.YachtID,
                        banner = y.Banner,
                        description = y.Description,
                        length = y.Length,
                        name = y.Name,
                        guid = y.guid
                    }).OrderByDescending(y => y.id).ToList();
                }
                else if (l1 == 100.0 && l2 == 0.0)
                {
                    return db.Yachts.Select(y => new YachtModel()
                    {
                        id = y.YachtID,
                        banner = y.Banner,
                        description = y.Description,
                        length = y.Length,
                        name = y.Name,
                        guid = y.guid
                    }).Where(s => s.length >= l1).ToList();
                }
                else
                {
                    return db.Yachts.Select(y => new YachtModel()
                    {
                        id = y.YachtID,
                        banner = y.Banner,
                        description = y.Description,
                        length = y.Length,
                        name = y.Name,
                        guid = y.guid
                    }).Where(s => s.length >= l1 && s.length <= l2).ToList();
                }
            }
        }

        public static List<YachtModel> getYachts()
        {
            using (var db = new DBModel())
            {
                return db.Yachts.Select(y => new YachtModel()
                {
                    id = y.YachtID,
                    banner = y.Banner,
                    description = y.Description,
                    length = y.Length,
                    name = y.Name,
                    guid = y.guid
                }).ToList();
            }
        }

        public static List<CustomModels.Yachts.Spec> GetYachtSpecifications(int id)
        {
            using (var db = new DBModel())
            {
                var specList = db.Specifications.Where(s => s.Type == 1).ToList();
                var dic = specList.ToDictionary(sp => sp.SpecId, sp => sp.SpecName);

                var list = db.YachtSpecifications.Where(y => y.YachtId == id).ToList();
                return list.Select(y => new Spec
                {
                    Value = y.Value,
                    Id = y.SpecID,
                    Name = dic[y.SpecID]
                }).ToList();
            }
        }

        public static int SaveYacht(int id, NewYachtModel model, List<YachtSpecification> specs)
        {
            using (var db = new DBModel())
            {
                try
                {
                    if (id == 0)
                    {

                        var yacht = new Yacht()
                        {
                            Name = model.name.Replace("'", "'"),
                            Description = model.description,
                            Banner = model.banner,
                            Length = model.length,
                            guid = Guid.NewGuid().ToString()
                        };
                        db.Yachts.Add(yacht);
                        db.SaveChanges();

                        foreach (var im in model.YachtsImage)
                        {
                            db.Files.Add(new File()
                            {
                                FileName = im,
                                mimeType = "image",
                                onCreated = DateTime.Now,
                                onModified = DateTime.Now,
                                Description = "",
                                FileType = 3,
                                FileTypeId = yacht.YachtID
                            });
                            db.SaveChanges();
                        }

                        foreach (var sp in specs)
                        {
                            var query =
                                "INSERT INTO [dbo].[YachtSpecifications]([YachtId],[SpecID],[Value])VALUES({0},{1},'{2}');";
                            query = string.Format(query, yacht.YachtID, sp.Specification.SpecId, sp.Value.Replace("'", "''"));
                            db.Database.ExecuteSqlCommand(query);
                        }
                        id = yacht.YachtID;
                    }
                    return id;
                }
                catch (Exception e)
                {
                    return -1;
                }
            }
        }
    }
}
