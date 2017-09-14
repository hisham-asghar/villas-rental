namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PropertyService")]
    public partial class PropertyService
    {
        public PropertyService()
        {
            PropertyBookingServices = new HashSet<PropertyBookingService>();
        }

        public int PropertyServiceId { get; set; }

        [Required]
        [StringLength(256)]
        public string Name { get; set; }

        public double Price { get; set; }

        [Required]
        [StringLength(256)]
        public string Guid { get; set; }

        public virtual ICollection<PropertyBookingService> PropertyBookingServices { get; set; }
    }
}
