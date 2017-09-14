namespace DatabaseLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Composition")]
    public partial class Composition
    {
        public int CompositionId { get; set; }

        public int Bedrooms { get; set; }

        public int Bathrooms { get; set; }

        public int Toilets { get; set; }

        public int PropertyId { get; set; }

        public virtual PropertyDetail PropertyDetail { get; set; }
    }
}
