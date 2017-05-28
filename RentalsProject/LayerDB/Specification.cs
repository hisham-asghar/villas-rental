namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Specification
    {
        [Key]
        public int SpecId { get; set; }

        [Required]
        [StringLength(256)]
        public string SpecName { get; set; }

        public int Type { get; set; }

        public virtual CarSpecification CarSpecification { get; set; }

        public virtual YachtSpecification YachtSpecification { get; set; }
    }
}
