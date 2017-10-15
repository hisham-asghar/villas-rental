using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RentalsClinet.Helpers
{
    class CustomFunctions
    {
        public static bool LinkComaprer(string service, string p)
        {
            p = LinkModifier(p);
            service = LinkModifier(service);
            return p == service;
        }

        public static string LinkModifier(string p)
        {
            if(p.Contains(' '))
            {
                p = p.Replace(' ', '-');
            }
            p = LayerDAO.StaticData.LinkTrimmer(p) ?? "";
            return p.ToLower();
        }
    }
}
