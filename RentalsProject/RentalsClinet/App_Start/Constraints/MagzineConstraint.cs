using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Routing;

namespace RentalsClinet.CustomRouteConstraints
{
    public class MagzineConstraint : IRouteConstraint
    {
        public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
        {

            if (LayerDAO.StaticData.MAGZINES_URL == null || LayerDAO.StaticData.MAGZINES_URL.Count == 0)
            {
                LayerDAO.StaticData.MAGZINES_URL = LayerDAO.MagzineDAO.GetUrls();
            }
            foreach (var service in LayerDAO.StaticData.MAGZINES_URL)
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
