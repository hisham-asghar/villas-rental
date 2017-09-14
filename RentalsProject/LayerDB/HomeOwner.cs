namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HomeOwner")]
    public partial class HomeOwner
    {
        public int HomeownerId { get; set; }

        [StringLength(256)]
        public string name { get; set; }

        [StringLength(256)]
        public string entityName { get; set; }

        [StringLength(256)]
        public string email { get; set; }

        [StringLength(50)]
        public string phone { get; set; }

        [StringLength(256)]
        public string role { get; set; }

        [StringLength(128)]
        public string country { get; set; }

        [StringLength(256)]
        public string city { get; set; }

        [StringLength(512)]
        public string source { get; set; }

        [Column(TypeName = "ntext")]
        public string link { get; set; }

        [Column(TypeName = "ntext")]
        public string message { get; set; }

        [StringLength(5)]
        public string primary_residence { get; set; }
    }
}
