namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Inquiry
    {
        public int InquiryId { get; set; }

        public int TypeId { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public double Amount { get; set; }

        public DateTime onCreated { get; set; }

        public DateTime onModified { get; set; }

        public int Type { get; set; }

        public virtual Car Car { get; set; }

        public virtual PropertyDetail PropertyDetail { get; set; }
    }
}
