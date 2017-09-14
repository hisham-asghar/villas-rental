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
        [StringLength(1024)]
        public string guid { get; set; }

        [StringLength(256)]
        public string Controller { get; set; }

        [StringLength(256)]
        public string ActionName { get; set; }

        [StringLength(256)]
        public string QueryString { get; set; }

        [StringLength(2048)]
        public string Url { get; set; }
    }
}
