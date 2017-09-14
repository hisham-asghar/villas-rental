namespace Database
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

        [Required]
        [StringLength(256)]
        public string Username { get; set; }

        [Required]
        [StringLength(256)]
        public string Password { get; set; }

        [Required]
        [StringLength(256)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(256)]
        public string LastName { get; set; }

        [Required]
        [StringLength(256)]
        public string Email { get; set; }

        [Required]
        [StringLength(256)]
        public string PhoneNumber { get; set; }

        public int LocationId { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string Description { get; set; }

        public DateTime onCreated { get; set; }

        public DateTime onModified { get; set; }

        public virtual ICollection<Booking> Bookings { get; set; }

        public virtual Location Location { get; set; }

        public virtual ICollection<PropertyReview> PropertyReviews { get; set; }
    }
}
