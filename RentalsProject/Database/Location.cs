namespace Database
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Location")]
    public partial class Location
    {
        public int LocationId { get; set; }

        [StringLength(256)]
        public string StreetName { get; set; }

        [StringLength(256)]
        public string StreetNo { get; set; }

        [StringLength(256)]
        public string City { get; set; }

        [StringLength(256)]
        public string Country { get; set; }

        public long? ZipCode { get; set; }

        public double? Logitude { get; set; }

        public double? Latitude { get; set; }

        public virtual User User { get; set; }
    }
}
