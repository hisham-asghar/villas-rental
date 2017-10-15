
using System;
using System.Globalization;
using System.Web;
using System.Web.Routing;

namespace RentalsClinet.CustomRouteConstraints
{
  public class ServiceConstraint : IRouteConstraint
  {
    public bool Match(HttpContextBase httpContext, Route route, string parameterName,RouteValueDictionary values, RouteDirection routeDirection)
    {

        if (LayerDAO.StaticData.SERVICES_URL == null || LayerDAO.StaticData.SERVICES_URL.Count == 0)
        {
            LayerDAO.StaticData.SERVICES_URL = LayerDAO.ServicesDao.GetServicesUrl();
        }
        foreach (var service in LayerDAO.StaticData.SERVICES_URL)
        {
            if (Helpers.CustomFunctions.LinkComaprer(service, values["service"].ToString()))
            {
                return true;
            }
        }

        return false;
    }
  }
}