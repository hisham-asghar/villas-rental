namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Mail
    {
        public int MailId { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string MailTo { get; set; }

        [StringLength(2048)]
        public string Subject { get; set; }

        [Column(TypeName = "ntext")]
        public string Text { get; set; }

        public bool? Status { get; set; }

        [StringLength(256)]
        public string guid { get; set; }
    }
}
