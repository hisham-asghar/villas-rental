namespace DatabaseLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class File
    {
        public int FileId { get; set; }

        [Required]
        [StringLength(256)]
        public string FileName { get; set; }

        [Required]
        [StringLength(256)]
        public string mimeType { get; set; }

        public int? FileType { get; set; }

        public DateTime onCreated { get; set; }

        public DateTime onModified { get; set; }

        public int? FileTypeId { get; set; }
    }
}
