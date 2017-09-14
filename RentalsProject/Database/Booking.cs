namespace Database
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Booking
    {
        public Booking()
        {
            PropertyReviews = new HashSet<PropertyReview>();
        }

        public int BookingId { get; set; }

        public int UserId { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public double CalculatedAmount { get; set; }

        public DateTime onCreated { get; set; }

        public DateTime onModified { get; set; }

        public bool isBooked { get; set; }

        public bool isChecked { get; set; }

        public int PropertyId { get; set; }

        public virtual PropertyDetail PropertyDetail { get; set; }

        public virtual User User { get; set; }

        public virtual ICollection<PropertyReview> PropertyReviews { get; set; }
    }
}
