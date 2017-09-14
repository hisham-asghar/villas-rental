namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BlogViewType")]
    public partial class BlogViewType
    {
        public BlogViewType()
        {
            BlogViewItems = new HashSet<BlogViewItem>();
            MagzineItems = new HashSet<MagzineItem>();
            Magzines = new HashSet<Magzine>();
        }

        public int BlogViewTypeId { get; set; }

        [Required]
        [StringLength(1024)]
        public string Name { get; set; }

        public virtual ICollection<BlogViewItem> BlogViewItems { get; set; }

        public virtual ICollection<MagzineItem> MagzineItems { get; set; }

        public virtual ICollection<Magzine> Magzines { get; set; }
    }
}
