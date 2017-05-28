namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("City")]
    public partial class City
    {
        public City()
        {
            Locations = new HashSet<Location>();
        }

        public int CityId { get; set; }

        [Required]
        [StringLength(256)]
        public string CityName { get; set; }

        [Required]
        [StringLength(256)]
        public string guid { get; set; }

        [Required]
        [StringLength(256)]
        public string banner { get; set; }

        public virtual ICollection<Location> Locations { get; set; }
    }
}
