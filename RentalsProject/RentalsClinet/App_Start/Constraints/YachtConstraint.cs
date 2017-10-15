using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Routing;

namespace RentalsClinet.CustomRouteConstraints
{
    public class YachtConstraint : IRouteConstraint
    {
        public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
        {

            if (LayerDAO.StaticData.YACHTS_URL == null || LayerDAO.StaticData.YACHTS_URL.Count == 0)
            {
                LayerDAO.StaticData.YACHTS_URL = LayerDAO.YachtDAO.GetYachtsUrl();
            }
            var val = values["token"].ToString();
            if(val.Contains(' '))
                val = val.Replace(" ","");
            if (val == "34-63" || val == "64-77" || val == "78-99" || val == "100")
                return true;

            foreach (var service in LayerDAO.StaticData.YACHTS_URL)
            {
                if (Helpers.CustomFunctions.LinkComaprer(service, values["token"].ToString()))
                {
                    return true;
                }
            }

            return false;
        }
    }
}
