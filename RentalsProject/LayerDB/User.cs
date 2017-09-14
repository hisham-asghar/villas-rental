namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {
        public User()
        {
            Bookings = new HashSet<Booking>();
            PropertyReviews = new HashSet<PropertyReview>();
        }

        public int UserId { get; set; }

        [StringLength(256)]
        public string Password { get; set; }

        [StringLength(256)]
        public string FirstName { get; set; }

        [StringLength(256)]
        public string LastName { get; set; }

        [StringLength(256)]
        public string Email { get; set; }

        [StringLength(20)]
        public string PhoneNumber { get; set; }

        [StringLength(12)]
        public string Zip { get; set; }

        [Column(TypeName = "ntext")]
        public string Description { get; set; }

        public DateTime? onCreated { get; set; }

        public DateTime? onModified { get; set; }

        [StringLength(50)]
        public string Country { get; set; }

        [StringLength(256)]
        public string Address { get; set; }

        [StringLength(256)]
        public string Address2 { get; set; }

        [StringLength(256)]
        public string VerificationCode { get; set; }

        public bool? EmailVerified { get; set; }

        [StringLength(256)]
        public string City { get; set; }

        [StringLength(256)]
        public string State { get; set; }

        [StringLength(256)]
        public string CardNumber { get; set; }

        [StringLength(10)]
        public string ExpirationDate { get; set; }

        [StringLength(5)]
        public string CardCode { get; set; }

        public virtual ICollection<Booking> Bookings { get; set; }

        public virtual Location Location { get; set; }

        public virtual ICollection<PropertyReview> PropertyReviews { get; set; }
    }
}
