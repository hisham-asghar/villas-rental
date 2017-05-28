using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using CustomModels;
using LayerDB;

namespace LayerDAO
{
    public static class SiteMetaDAO
    {
        public static Meta getMeta(string str)
        {
            using (var db = new DBModel())
            {
                var meta = db.SiteMetas.Select(s => new Meta()
                {
                    MetaName = s.MetaName,
                    MetaText = s.MetaText
                }).FirstOrDefault(s => s.MetaName == str);
                return meta ?? new Meta()
                {
                    MetaName = str,
                    MetaText = ""
                };
            }
        }
        public static Dictionary<string,Meta> getMetaChilds(string str)
        {
            using (var db = new DBModel())
            {
                var parent = db.SiteMetas
                    .FirstOrDefault(m => m.MetaName.ToLower() == str.ToLower());
                if(parent == null)
                    return new Dictionary<string, Meta>();
                var list = db.SiteMetaMatches.Where(sm => sm.MetaParentId == parent.MetaId).ToList();
                return list.ToDictionary(
                        k => k.SiteMeta.MetaName, 
                        v => new Meta(v.SiteMeta.MetaName, v.SiteMeta.MetaText
                            ));
            }
        }
        public static Meta getMeta(string str,string emp)
        {
            using (var db = new DBModel())
            {
                var meta = db.SiteMetas.Select(s => new Meta()
                {
                    MetaName = s.MetaName,
                    MetaText = s.MetaText
                }).FirstOrDefault(s => s.MetaName == str);
                return meta ?? new Meta()
                {
                    MetaName = str,
                    MetaText = emp
                };
            }
        }
        public static Meta SaveMeta(Meta metaUpdated,List<string> MetaParents)
        {
            if (metaUpdated == null)
                return null;
            if(string.IsNullOrWhiteSpace(metaUpdated.MetaText))
                metaUpdated.MetaText = "";
            using (var db = new DBModel())
            {
                var meta = db.SiteMetas.FirstOrDefault(s => s.MetaName == metaUpdated.MetaName);
                if (meta == null)
                {
                    meta = new SiteMeta()
                    {
                        MetaName = metaUpdated.MetaName,
                        MetaText = metaUpdated.MetaText
                    };
                    db.SiteMetas.Add(meta);
                }
                else
                {
                    meta.MetaText = metaUpdated.MetaText;
                }
                try
                {
                    db.SaveChanges();
                    if (MetaParents != null)
                        foreach (var parent in MetaParents)
                        {
                            if (!string.IsNullOrWhiteSpace(parent))
                            {
                                var pmeta = db.SiteMetas.FirstOrDefault(m => m.MetaName == parent);

                                if (pmeta == null)
                                {
                                    pmeta = new SiteMeta()
                                    {
                                        MetaName = parent,
                                        MetaText = parent
                                    };
                                    db.SiteMetas.Add(pmeta);
                                    try
                                    {
                                        db.SaveChanges();
                                    }
                                    catch (Exception e)
                                    {
                                        return null;
                                    }
                                }

                                var match = db.SiteMetaMatches.FirstOrDefault(
                                    m => m.MetaParentId == pmeta.MetaId && m.MetaChildId == meta.MetaId);

                                if (match == null)
                                {
                                    db.SiteMetaMatches.Add(new SiteMetaMatch()
                                    {
                                        MetaParentId = pmeta.MetaId,
                                        MetaChildId = meta.MetaId
                                    });
                                    try
                                    {
                                        db.SaveChanges();
                                    }
                                    catch (Exception e)
                                    {
                                        return null;
                                    }
                                }
                            }
                        }

                    return new Meta(meta.MetaName,meta.MetaText);
                }
                catch (DbEntityValidationException e)
                {
                    return null;
                }
                catch (Exception e)
                {
                    return null;
                }
            }
        }
    }
}
