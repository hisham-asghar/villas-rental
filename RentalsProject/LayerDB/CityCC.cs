namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CityCC")]
    public partial class CityCC
    {
        [Key]
        public int CityId { get; set; }

        [Required]
        [StringLength(256)]
        public string Name { get; set; }

        [Required]
        [StringLength(50)]
        public string cc { get; set; }

        public int? CountryId { get; set; }
    }
}
