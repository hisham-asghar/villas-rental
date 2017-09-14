namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PropertyRentalBudgetDetail
    {
        public PropertyRentalBudgetDetail()
        {
            Bookings = new HashSet<Booking>();
        }

        [Key]
        public int RentalBudgetId { get; set; }

        public int PropertyId { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public DateTime onCreated { get; set; }

        public DateTime onModified { get; set; }

        public double Price { get; set; }

        [StringLength(256)]
        public string SeasonName { get; set; }

        public double guest_price { get; set; }

        public int minStay { get; set; }

        public virtual ICollection<Booking> Bookings { get; set; }

        public virtual PropertyDetail PropertyDetail { get; set; }
    }
}
