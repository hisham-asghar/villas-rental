namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CarSpecification")]
    public partial class CarSpecification
    {
        public int CarSpecificationID { get; set; }

        public int CarID { get; set; }

        public int CarSpecId { get; set; }

        [Required]
        [StringLength(512)]
        public string Value { get; set; }

        public virtual Car Car { get; set; }

        public virtual Specification Specification { get; set; }
    }
}
