namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MagzineCategory")]
    public partial class MagzineCategory
    {
        public MagzineCategory()
        {
            Magzines = new HashSet<Magzine>();
        }

        public int MagzineCategoryId { get; set; }

        [Required]
        [StringLength(1024)]
        public string Name { get; set; }

        public virtual ICollection<Magzine> Magzines { get; set; }
    }
}
