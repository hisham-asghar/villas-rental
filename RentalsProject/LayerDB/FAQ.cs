namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("FAQ")]
    public partial class FAQ
    {
        public int faqId { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string Question { get; set; }

        [Column(TypeName = "ntext")]
        public string Answer { get; set; }

        public int likes { get; set; }

        public int dislikes { get; set; }

        public int type { get; set; }
    }
}
