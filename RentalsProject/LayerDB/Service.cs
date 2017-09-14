namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Service
    {
        public int ServiceId { get; set; }

        [Required]
        [StringLength(64)]
        public string Name { get; set; }

        [StringLength(256)]
        public string SubName { get; set; }

        [StringLength(256)]
        public string ImageSmall { get; set; }

        [StringLength(256)]
        public string ImageHeader { get; set; }

        [Column(TypeName = "ntext")]
        public string Text { get; set; }

        [Required]
        [StringLength(256)]
        public string guid { get; set; }
    }
}
