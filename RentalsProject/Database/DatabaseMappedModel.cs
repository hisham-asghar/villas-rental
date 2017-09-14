namespace Database
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class DatabaseMappedModel : DbContext
    {
        public DatabaseMappedModel()
            : base("name=DatabaseConnectionString")
        {
        }

        public virtual DbSet<Amenity> Amenities { get; set; }
        public virtual DbSet<AmenitiesType> AmenitiesTypes { get; set; }
        public virtual DbSet<Booking> Bookings { get; set; }
        public virtual DbSet<Composition> Compositions { get; set; }
        public virtual DbSet<File> Files { get; set; }
        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<PropertyDetail> PropertyDetails { get; set; }
        public virtual DbSet<PropertyReview> PropertyReviews { get; set; }
        public virtual DbSet<PropertyTag> PropertyTags { get; set; }
        public virtual DbSet<PropertyType> PropertyTypes { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Tag> Tags { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<PropertyRentalBudgetDetail> PropertyRentalBudgetDetails { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AmenitiesType>()
                .Property(e => e.AmenitiesTypeName)
                .IsUnicode(false);

            modelBuilder.Entity<AmenitiesType>()
                .HasMany(e => e.Amenities)
                .WithRequired(e => e.AmenitiesType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Booking>()
                .HasMany(e => e.PropertyReviews)
                .WithRequired(e => e.Booking)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<File>()
                .Property(e => e.FileName)
                .IsUnicode(false);

            modelBuilder.Entity<File>()
                .Property(e => e.mimeType)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .Property(e => e.StreetName)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .Property(e => e.StreetNo)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .Property(e => e.City)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .Property(e => e.Country)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .HasOptional(e => e.User)
                .WithRequired(e => e.Location);

            modelBuilder.Entity<PropertyDetail>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyDetail>()
                .HasMany(e => e.Amenities)
                .WithRequired(e => e.PropertyDetail)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PropertyDetail>()
                .HasMany(e => e.Bookings)
                .WithRequired(e => e.PropertyDetail)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PropertyDetail>()
                .HasMany(e => e.Compositions)
                .WithRequired(e => e.PropertyDetail)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PropertyDetail>()
                .HasMany(e => e.PropertyRentalBudgetDetails)
                .WithRequired(e => e.PropertyDetail)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PropertyDetail>()
                .HasMany(e => e.PropertyReviews)
                .WithRequired(e => e.PropertyDetail)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PropertyDetail>()
                .HasMany(e => e.PropertyTags)
                .WithRequired(e => e.PropertyDetail)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PropertyType>()
                .Property(e => e.PropertyTypeName)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyType>()
                .HasMany(e => e.PropertyDetails)
                .WithRequired(e => e.PropertyType)
                .HasForeignKey(e => e.TypeId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Tag>()
                .Property(e => e.TagName)
                .IsUnicode(false);

            modelBuilder.Entity<Tag>()
                .HasMany(e => e.PropertyTags)
                .WithRequired(e => e.Tag)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Username)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.PhoneNumber)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Bookings)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.PropertyReviews)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);
        }
    }
}
