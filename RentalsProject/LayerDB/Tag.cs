namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Tag
    {
        public Tag()
        {
            PropertyTags = new HashSet<PropertyTag>();
        }

        public int TagId { get; set; }

        [Required]
        [StringLength(100)]
        public string TagName { get; set; }

        [Required]
        [StringLength(100)]
        public string guid { get; set; }

        [StringLength(4096)]
        public string Text { get; set; }

        [StringLength(256)]
        public string image { get; set; }

        public virtual ICollection<PropertyTag> PropertyTags { get; set; }

        [StringLength(256)]
        public string banner { get; set; }
    }
}
