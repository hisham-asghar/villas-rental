namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class YachtSpecification
    {
        [Key]
        public int YachtSpecId { get; set; }

        public int YachtId { get; set; }

        public int SpecID { get; set; }

        [Required]
        [StringLength(256)]
        public string Value { get; set; }

        public virtual Specification Specification { get; set; }

        public virtual Yacht Yacht { get; set; }
    }
}
