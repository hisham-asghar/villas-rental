namespace Database
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PropertyRentalBudgetDetail
    {
        [Key]
        [Column(Order = 0)]
        public int RentalBudgetId { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int PropertyId { get; set; }

        [Key]
        [Column(Order = 2)]
        public DateTime StartDate { get; set; }

        [Key]
        [Column(Order = 3)]
        public DateTime EndDate { get; set; }

        [Key]
        [Column(Order = 4)]
        public DateTime onCreated { get; set; }

        [Key]
        [Column(Order = 5)]
        public DateTime onModified { get; set; }

        public virtual PropertyDetail PropertyDetail { get; set; }
    }
}
