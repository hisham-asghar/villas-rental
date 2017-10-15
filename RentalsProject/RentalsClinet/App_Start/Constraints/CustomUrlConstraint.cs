using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Routing;

namespace RentalsClinet.CustomRouteConstraints
{
  public class CustomUrlConstraint : IRouteConstraint
  {
      public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
      {
          if (LayerDAO.StaticData.BOUGUS_URL == null || LayerDAO.StaticData.BOUGUS_URL.Count == 0)
          {
              LayerDAO.StaticData.BOUGUS_URL = LayerDAO.UrlMetaDAO.GetDic();
          }
          var url = "/" + values["tags"];
          foreach(var p in LayerDAO.StaticData.BOUGUS_URL)
          {
              if (Helpers.CustomFunctions.LinkComaprer(p.Key, url))
              {
                  return true;
              }
          }

          return false;
      }
  }
}
