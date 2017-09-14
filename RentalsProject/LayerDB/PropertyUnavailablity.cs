namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PropertyUnavailablity")]
    public partial class PropertyUnavailablity
    {
        public int PropertyUnavailablityId { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public DateTime onCreated { get; set; }

        public DateTime onModified { get; set; }

        public int PropertyId { get; set; }

        public virtual PropertyDetail PropertyDetail { get; set; }
    }
}
