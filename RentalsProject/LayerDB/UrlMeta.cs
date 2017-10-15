namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("UrlMeta")]
    public partial class UrlMeta
    {
        public int UrlMetaId { get; set; }

        [Required]
        [StringLength(4096)]
        public string RealLink { get; set; }

        [Required]
        public string DummyLink { get; set; }
    }
}
