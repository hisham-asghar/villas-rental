namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PropertyAmenitiesView")]
    public partial class PropertyAmenitiesView
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int AmenitiesId { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int PropertyId { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int AmenitiesTypeId { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(256)]
        public string AmenitiesTypeName { get; set; }

        [StringLength(1024)]
        public string SVG { get; set; }
    }
}
