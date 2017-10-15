
using System;
using System.Globalization;
using System.Web;
using System.Web.Routing;

namespace RentalsClinet.CustomRouteConstraints
{
  public class DestinationConstraint : IRouteConstraint
  {
    public bool Match(HttpContextBase httpContext, Route route, string parameterName,RouteValueDictionary values, RouteDirection routeDirection)
    {
        if (values["destination"].ToString().ToLower() == "destinations")
            return true;

        if (LayerDAO.StaticData.CITIES_URL == null || LayerDAO.StaticData.CITIES_URL.Count == 0)
        {
            LayerDAO.StaticData.CITIES_URL = LayerDAO.PropertyDAO.GetCitiesUrl();
        }
        foreach (var city in LayerDAO.StaticData.CITIES_URL)
        {
            if (Helpers.CustomFunctions.LinkComaprer(city, values["destination"].ToString()))
            {
                return true;
            }
        }


        return false;
    }
  }

    public class TagConstraint : IRouteConstraint
    {
        public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
        {
            if (LayerDAO.StaticData.TAG_URLS == null || LayerDAO.StaticData.TAG_URLS.Count == 0)
            {
                LayerDAO.StaticData.TAG_URLS = LayerDAO.TagsDAO.GetUrls();
            }
            foreach (var tag in LayerDAO.StaticData.TAG_URLS)
            {
                if (Helpers.CustomFunctions.LinkComaprer(tag, values["destination"].ToString()))
                {
                    return true;
                }

            }

            return false;
        }
    }
  public class VillaConstraint : IRouteConstraint
  {
      public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
      {
          if (LayerDAO.StaticData.VILLAS_URL == null || LayerDAO.StaticData.VILLAS_URL.Count == 0)
          {
              LayerDAO.StaticData.VILLAS_URL = LayerDAO.PropertyDAO.GetVillasUrl();
          }
          foreach (var guid in LayerDAO.StaticData.VILLAS_URL)
          {
              if (Helpers.CustomFunctions.LinkComaprer(guid, values["destination"].ToString()))
              {
                  return true;
              }
          }

          return false;
      }
  }
  public class DestinationVillaConstraint : IRouteConstraint
  {
      public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
      {
          if (LayerDAO.StaticData.DESTINATION_VILLAS_URL == null || LayerDAO.StaticData.DESTINATION_VILLAS_URL.Count == 0)
          {
              LayerDAO.StaticData.DESTINATION_VILLAS_URL = LayerDAO.PropertyDAO.GetDestinationVillasUrl();
          }
          foreach (var guid in LayerDAO.StaticData.DESTINATION_VILLAS_URL)
          {
              if (Helpers.CustomFunctions.LinkComaprer(guid.Key, values["villa"].ToString()))
              {
                  if (Helpers.CustomFunctions.LinkComaprer(guid.Value, values["destination"].ToString()))
                  {
                      values["destination"] = guid.Value;
                  }
                  return true;
              }
          }

          return false;
      }
  }
}