namespace DatabaseLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AmenitiesType")]
    public partial class AmenitiesType
    {
        public AmenitiesType()
        {
            Amenities = new HashSet<Amenity>();
        }

        public int AmenitiesTypeId { get; set; }

        [Required]
        [StringLength(256)]
        public string AmenitiesTypeName { get; set; }

        public virtual ICollection<Amenity> Amenities { get; set; }
    }
}
