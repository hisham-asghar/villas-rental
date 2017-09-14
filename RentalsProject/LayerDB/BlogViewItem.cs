namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BlogViewItem")]
    public partial class BlogViewItem
    {
        public BlogViewItem()
        {
            MagzineItems = new HashSet<MagzineItem>();
        }

        public int BlogViewItemId { get; set; }

        public int BlogViewTypeId { get; set; }

        [Required]
        [StringLength(128)]
        public string TypeName { get; set; }

        [Required]
        [StringLength(50)]
        public string Type { get; set; }

        public virtual BlogViewType BlogViewType { get; set; }

        public virtual ICollection<MagzineItem> MagzineItems { get; set; }
    }
}
