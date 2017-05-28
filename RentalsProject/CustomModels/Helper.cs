using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CustomModels
{
    public static class Helper
    {
        public static Meta getDicData(Dictionary<string, Meta> dic,string str)
        {
            return dic.ContainsKey(str) ? dic[str] : new Meta(str,"");
        }
    }
}
