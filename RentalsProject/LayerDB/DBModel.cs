namespace LayerDB
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class DBModel : DbContext
    {
        public DBModel()
            : base("name=DBModelStr")
        {
        }

        public virtual DbSet<Amenity> Amenities { get; set; }
        public virtual DbSet<AmenitiesType> AmenitiesTypes { get; set; }
        public virtual DbSet<Booking> Bookings { get; set; }
        public virtual DbSet<Car> Cars { get; set; }
        public virtual DbSet<CarSpecification> CarSpecifications { get; set; }
        public virtual DbSet<City> Cities { get; set; }
        public virtual DbSet<Composition> Compositions { get; set; }
        public virtual DbSet<File> Files { get; set; }
        public virtual DbSet<Inquiry> Inquiries { get; set; }
        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<PropertyDetail> PropertyDetails { get; set; }
        public virtual DbSet<PropertyRentalBudgetDetail> PropertyRentalBudgetDetails { get; set; }
        public virtual DbSet<PropertyReview> PropertyReviews { get; set; }
        public virtual DbSet<PropertyTag> PropertyTags { get; set; }
        public virtual DbSet<PropertyType> PropertyTypes { get; set; }
        public virtual DbSet<SiteMeta> SiteMetas { get; set; }
        public virtual DbSet<SiteMetaMatch> SiteMetaMatches { get; set; }
        public virtual DbSet<Specification> Specifications { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Tag> Tags { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Yacht> Yachts { get; set; }
        public virtual DbSet<YachtSpecification> YachtSpecifications { get; set; }

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

            modelBuilder.Entity<Car>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Car>()
                .Property(e => e.Banner)
                .IsUnicode(false);

            modelBuilder.Entity<Car>()
                .Property(e => e.guid)
                .IsUnicode(false);

            modelBuilder.Entity<Car>()
                .HasMany(e => e.CarSpecifications)
                .WithRequired(e => e.Car)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Car>()
                .HasMany(e => e.Inquiries)
                .WithRequired(e => e.Car)
                .HasForeignKey(e => e.TypeId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CarSpecification>()
                .Property(e => e.Value)
                .IsUnicode(false);

            modelBuilder.Entity<City>()
                .Property(e => e.CityName)
                .IsUnicode(false);

            modelBuilder.Entity<City>()
                .HasMany(e => e.Locations)
                .WithRequired(e => e.City)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<File>()
                .Property(e => e.FileName)
                .IsUnicode(false);

            modelBuilder.Entity<File>()
                .Property(e => e.mimeType)
                .IsUnicode(false);

            modelBuilder.Entity<File>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .Property(e => e.StreetName)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .Property(e => e.StreetNo)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .Property(e => e.Country)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .HasMany(e => e.PropertyDetails)
                .WithRequired(e => e.Location)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Location>()
                .HasOptional(e => e.User)
                .WithRequired(e => e.Location);

            modelBuilder.Entity<PropertyDetail>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyDetail>()
                .Property(e => e.banner)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyDetail>()
                .Property(e => e.guid)
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
                .HasMany(e => e.Inquiries)
                .WithRequired(e => e.PropertyDetail)
                .HasForeignKey(e => e.TypeId)
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

            modelBuilder.Entity<SiteMeta>()
                .Property(e => e.MetaName)
                .IsUnicode(false);

            modelBuilder.Entity<SiteMeta>()
                .HasMany(e => e.SiteMetaMatches)
                .WithRequired(e => e.SiteMeta)
                .HasForeignKey(e => e.MetaChildId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SiteMeta>()
                .HasMany(e => e.SiteMetaMatches1)
                .WithRequired(e => e.SiteMeta1)
                .HasForeignKey(e => e.MetaParentId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Specification>()
                .Property(e => e.SpecName)
                .IsUnicode(false);

            modelBuilder.Entity<Specification>()
                .HasOptional(e => e.CarSpecification)
                .WithRequired(e => e.Specification);

            modelBuilder.Entity<Specification>()
                .HasOptional(e => e.YachtSpecification)
                .WithRequired(e => e.Specification);

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

            modelBuilder.Entity<Yacht>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Yacht>()
                .Property(e => e.Banner)
                .IsUnicode(false);

            modelBuilder.Entity<Yacht>()
                .Property(e => e.guid)
                .IsUnicode(false);

            modelBuilder.Entity<Yacht>()
                .HasMany(e => e.YachtSpecifications)
                .WithRequired(e => e.Yacht)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<YachtSpecification>()
                .Property(e => e.Value)
                .IsUnicode(false);
        }
    }
}
