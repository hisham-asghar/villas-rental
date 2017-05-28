namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SiteMetaMatch")]
    public partial class SiteMetaMatch
    {
        [Key]
        public int MatchMetaId { get; set; }

        public int MetaParentId { get; set; }

        public int MetaChildId { get; set; }

        public virtual SiteMeta SiteMeta { get; set; }

        public virtual SiteMeta SiteMeta1 { get; set; }
    }
}
