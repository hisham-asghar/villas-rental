using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CustomModels.PropertyModels
{
    public class PropertyFilters
    {
        public int id { get; set; }
        public string name { get; set; }
        public List<int> filters { get; set; }
        public Dictionary<int,bool> filtersDic { get; set; }
    }
}
