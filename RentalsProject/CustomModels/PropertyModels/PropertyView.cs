using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CustomModels.PropertyModels
{
    public class PropertyView : LayerDB.PropertyDetailView
    {
        
        public List<string> imageList { get; set; }
        public List<string> tagsList { get; set; }
        public List<string> amenitiesList { get; set; }
        public List<RateModel> rates { get; set; }
    }
}
