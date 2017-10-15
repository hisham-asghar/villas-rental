using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Routing;

namespace RentalsClinet.CustomRouteConstraints
{
    public class CarConstraint : IRouteConstraint
    {
        public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
        {
            
            if (LayerDAO.StaticData.CARS_URL == null || LayerDAO.StaticData.CARS_URL.Count == 0)
            {
                LayerDAO.StaticData.CARS_URL = LayerDAO.CarDAO.GetUrls();
            }
            foreach (var service in LayerDAO.StaticData.CARS_URL)
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
