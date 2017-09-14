using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CustomModels.FormModels
{
    public class DestinationSearchFormModel
    {
        public int g { get; set; }
        public string d { get; set; }
        public string r { get; set; }
        public string cityName { get; set; }
        public string price { get; set; }
        public int sort { get; set; }
        public int max { get; set; }
        public int min { get; set; }
        public int guests { get; set; }
        public List<string> filter { get; set; }
        public DateTime startDate { get; set; }
        public DateTime endDate { get; set; }
    }
}
