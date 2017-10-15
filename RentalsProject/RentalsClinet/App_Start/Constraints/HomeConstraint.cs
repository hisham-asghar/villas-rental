using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Routing;

namespace RentalsClinet.CustomRouteConstraints
{
    public class HomeConstraint : IRouteConstraint
    {
        public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
        {
            var list = LayerDAO.StaticData.GetHomeUrls();
            foreach (var service in list)
            {
                if (Helpers.CustomFunctions.LinkComaprer(service, values["action"].ToString()))
                {
                    return true;
                }
            }

            return false;
        }
    }
}
