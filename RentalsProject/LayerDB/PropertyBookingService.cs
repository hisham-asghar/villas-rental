namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PropertyBookingService")]
    public partial class PropertyBookingService
    {
        public int PropertyBookingServiceId { get; set; }

        public int BookingId { get; set; }

        public int PropertyServiceId { get; set; }

        public int? TimeLimitPerDay { get; set; }

        public int? TimeLimitPerHour { get; set; }

        public virtual Booking Booking { get; set; }

        public virtual PropertyService PropertyService { get; set; }
    }
}
