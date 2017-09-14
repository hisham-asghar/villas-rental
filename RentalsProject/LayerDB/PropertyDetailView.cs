namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PropertyDetailView")]
    public partial class PropertyDetailView
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int PropertyId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(256)]
        public string Name { get; set; }

        [StringLength(256)]
        public string SubName { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int TypeId { get; set; }

        [Key]
        [Column(Order = 3)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaxGuests { get; set; }

        [Key]
        [Column(Order = 4)]
        public double SpaceM2 { get; set; }

        [Key]
        [Column(Order = 5)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int LocationId { get; set; }

        [Key]
        [Column(Order = 6)]
        public double SpaceFT { get; set; }

        [Key]
        [Column(Order = 7)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MinStay { get; set; }

        [Key]
        [Column(Order = 8)]
        public bool Availablity { get; set; }

        [Key]
        [Column(Order = 9, TypeName = "ntext")]
        public string Description { get; set; }

        [Key]
        [Column(Order = 10)]
        public DateTime OnCreated { get; set; }

        [Key]
        [Column(Order = 11)]
        public DateTime OnModified { get; set; }

        [StringLength(256)]
        public string banner { get; set; }

        [Key]
        [Column(Order = 12)]
        public bool isActive { get; set; }

        [Key]
        [Column(Order = 13)]
        [StringLength(256)]
        public string guid { get; set; }

        [StringLength(512)]
        public string videoURL { get; set; }

        [StringLength(256)]
        public string pdfFile { get; set; }

        [Key]
        [Column(Order = 14)]
        public double night { get; set; }

        [Key]
        [Column(Order = 15)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Expr1 { get; set; }

        [StringLength(256)]
        public string StreetName { get; set; }

        [StringLength(256)]
        public string StreetNo { get; set; }

        [Key]
        [Column(Order = 16)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long ZipCode { get; set; }

        [Key]
        [Column(Order = 17)]
        public double Latitude { get; set; }

        [Key]
        [Column(Order = 18)]
        public double Logitude { get; set; }

        [StringLength(256)]
        public string Country { get; set; }

        [Key]
        [Column(Order = 19)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CityId { get; set; }

        [StringLength(256)]
        public string CityName { get; set; }

        [StringLength(256)]
        public string CityGuid { get; set; }

        [Key]
        [Column(Order = 20)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Bedrooms { get; set; }

        [Key]
        [Column(Order = 21)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CompositionId { get; set; }

        [Key]
        [Column(Order = 22)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Bathrooms { get; set; }

        [Key]
        [Column(Order = 23)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Toilets { get; set; }

        public string Images { get; set; }

        public string AmenitiesList { get; set; }

        public string PropertyTagsList { get; set; }
    }
}
