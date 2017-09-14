namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Testimonal
    {
        public int TestimonalId { get; set; }

        [StringLength(256)]
        public string Name { get; set; }

        [StringLength(256)]
        public string UserImage { get; set; }

        [Column(TypeName = "ntext")]
        public string Text { get; set; }

        [StringLength(256)]
        public string VideoURL { get; set; }

        public DateTime onCreated { get; set; }

        [StringLength(256)]
        public string socialMediaLinks { get; set; }
    }
}
