namespace LayerDB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Yacht
    {
        public Yacht()
        {
            YachtSpecifications = new HashSet<YachtSpecification>();
        }

        public int YachtID { get; set; }

        [Required]
        [StringLength(512)]
        public string Name { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string Description { get; set; }

        public double Length { get; set; }

        [Required]
        [StringLength(256)]
        public string Banner { get; set; }

        [Required]
        [StringLength(128)]
        public string guid { get; set; }

        public virtual ICollection<YachtSpecification> YachtSpecifications { get; set; }
    }
}
