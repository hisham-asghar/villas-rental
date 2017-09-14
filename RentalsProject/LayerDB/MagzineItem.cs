namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class MagzineItem
    {
        public int MagzineItemId { get; set; }

        public int MagzineId { get; set; }

        public int BlogId { get; set; }

        public int BlogItemId { get; set; }

        [Column(TypeName = "ntext")]
        public string Text { get; set; }

        public virtual BlogViewItem BlogViewItem { get; set; }

        public virtual BlogViewType BlogViewType { get; set; }

        public virtual Magzine Magzine { get; set; }
    }
}
