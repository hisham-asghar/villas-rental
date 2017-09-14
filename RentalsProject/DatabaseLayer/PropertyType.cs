namespace DatabaseLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PropertyType")]
    public partial class PropertyType
    {
        public PropertyType()
        {
            PropertyDetails = new HashSet<PropertyDetail>();
        }

        public int PropertyTypeId { get; set; }

        [Required]
        [StringLength(150)]
        public string PropertyTypeName { get; set; }

        public virtual ICollection<PropertyDetail> PropertyDetails { get; set; }
    }
}
