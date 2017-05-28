namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Car")]
    public partial class Car
    {
        public Car()
        {
            CarSpecifications = new HashSet<CarSpecification>();
            Inquiries = new HashSet<Inquiry>();
        }

        public int CarId { get; set; }

        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string Description { get; set; }

        public double OneDay { get; set; }

        public double ThreeDay { get; set; }

        public double Week { get; set; }

        public int Type { get; set; }

        [Required]
        [StringLength(250)]
        public string Banner { get; set; }

        [Required]
        [StringLength(256)]
        public string guid { get; set; }

        public virtual ICollection<CarSpecification> CarSpecifications { get; set; }

        public virtual ICollection<Inquiry> Inquiries { get; set; }
    }
}
