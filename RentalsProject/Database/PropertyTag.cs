namespace Database
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PropertyTag
    {
        public int PropertyTagId { get; set; }

        public int PropertyId { get; set; }

        public int TagId { get; set; }

        public virtual PropertyDetail PropertyDetail { get; set; }

        public virtual Tag Tag { get; set; }
    }
}
