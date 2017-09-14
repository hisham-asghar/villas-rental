namespace Database
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PropertyReview
    {
        [Key]
        public int ReviewId { get; set; }

        public int PropertyId { get; set; }

        public int BookingId { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string Text { get; set; }

        public double Ratings { get; set; }

        public int UserId { get; set; }

        public virtual Booking Booking { get; set; }

        public virtual PropertyDetail PropertyDetail { get; set; }

        public virtual User User { get; set; }
    }
}
