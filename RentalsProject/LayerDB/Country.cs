namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Country")]
    public partial class Country
    {
        public int CountryId { get; set; }

        [Required]
        [StringLength(50)]
        public string cc { get; set; }

        [Required]
        [StringLength(256)]
        public string name { get; set; }
    }
}
