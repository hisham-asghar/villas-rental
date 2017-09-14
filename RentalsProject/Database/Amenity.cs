namespace Database
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Amenity
    {
        [Key]
        public int AmenitiesId { get; set; }

        public int PropertyId { get; set; }

        public int AmenitiesTypeId { get; set; }

        public virtual AmenitiesType AmenitiesType { get; set; }

        public virtual PropertyDetail PropertyDetail { get; set; }
    }
}
