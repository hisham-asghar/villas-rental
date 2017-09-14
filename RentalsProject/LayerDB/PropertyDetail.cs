namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PropertyDetail
    {
        public PropertyDetail()
        {
            Amenities = new HashSet<Amenity>();
            Bookings = new HashSet<Booking>();
            Compositions = new HashSet<Composition>();
            Inquiries = new HashSet<Inquiry>();
            PropertyRentalBudgetDetails = new HashSet<PropertyRentalBudgetDetail>();
            PropertyReviews = new HashSet<PropertyReview>();
            PropertyTags = new HashSet<PropertyTag>();
            PropertyUnavailablities = new HashSet<PropertyUnavailablity>();
        }

        [Key]
        public int PropertyId { get; set; }

        [Required]
        [StringLength(256)]
        public string Name { get; set; }

        [StringLength(256)]
        public string SubName { get; set; }

        public int TypeId { get; set; }

        public int MaxGuests { get; set; }

        public double SpaceM2 { get; set; }

        public int LocationId { get; set; }

        public double SpaceFT { get; set; }

        public int MinStay { get; set; }

        public bool Availablity { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string Description { get; set; }

        public DateTime OnCreated { get; set; }

        public DateTime OnModified { get; set; }

        [StringLength(256)]
        public string banner { get; set; }

        public bool isActive { get; set; }

        [Required]
        [StringLength(256)]
        public string guid { get; set; }

        [StringLength(512)]
        public string videoURL { get; set; }

        [StringLength(256)]
        public string pdfFile { get; set; }

        public double night { get; set; }

        public virtual ICollection<Amenity> Amenities { get; set; }

        public virtual ICollection<Booking> Bookings { get; set; }

        public virtual ICollection<Composition> Compositions { get; set; }

        public virtual ICollection<Inquiry> Inquiries { get; set; }

        public virtual Location Location { get; set; }

        public virtual PropertyType PropertyType { get; set; }

        public virtual ICollection<PropertyRentalBudgetDetail> PropertyRentalBudgetDetails { get; set; }

        public virtual ICollection<PropertyReview> PropertyReviews { get; set; }

        public virtual ICollection<PropertyTag> PropertyTags { get; set; }

        public virtual ICollection<PropertyUnavailablity> PropertyUnavailablities { get; set; }
    }
}
