namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Location")]
    public partial class Location
    {
        public Location()
        {
            PropertyDetails = new HashSet<PropertyDetail>();
        }

        public int LocationId { get; set; }

        [StringLength(256)]
        public string StreetName { get; set; }

        [StringLength(256)]
        public string StreetNo { get; set; }

        [StringLength(256)]
        public string Country { get; set; }

        public long? ZipCode { get; set; }

        public double? Logitude { get; set; }

        public double? Latitude { get; set; }

        public int CityId { get; set; }

        public virtual City City { get; set; }

        public virtual ICollection<PropertyDetail> PropertyDetails { get; set; }

        public virtual User User { get; set; }
    }
}
