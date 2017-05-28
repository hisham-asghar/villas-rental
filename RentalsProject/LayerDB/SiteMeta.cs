namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SiteMeta")]
    public partial class SiteMeta
    {
        public SiteMeta()
        {
            SiteMetaMatches = new HashSet<SiteMetaMatch>();
            SiteMetaMatches1 = new HashSet<SiteMetaMatch>();
        }

        [Key]
        public int MetaId { get; set; }

        [Required]
        [StringLength(500)]
        public string MetaName { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string MetaText { get; set; }

        public virtual ICollection<SiteMetaMatch> SiteMetaMatches { get; set; }

        public virtual ICollection<SiteMetaMatch> SiteMetaMatches1 { get; set; }
    }
}
