using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CustomModels
{
    public class Meta
    {
        public string MetaName { get; set; }

        public string MetaText { get; set; }

        public Meta()
        {

        }
        public Meta(string name,string text)
        {
            MetaName = name;
            MetaText = text;
        }
    }
}
