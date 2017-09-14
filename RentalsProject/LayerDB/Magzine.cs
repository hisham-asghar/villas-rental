namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Magzine
    {
        public Magzine()
        {
            MagzineItems = new HashSet<MagzineItem>();
        }

        public int MagzineId { get; set; }

        public int BlogViewTypeId { get; set; }

        [Required]
        [StringLength(1024)]
        public string Title { get; set; }

        [Required]
        [StringLength(1024)]
        public string GUID { get; set; }

        public int CategoryId { get; set; }

        public bool isActive { get; set; }

        public virtual BlogViewType BlogViewType { get; set; }

        public virtual MagzineCategory MagzineCategory { get; set; }

        public virtual ICollection<MagzineItem> MagzineItems { get; set; }
    }
}
