using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace RentalsClinet
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");


            routes.MapRoute(
                name: "Yachts",
                url: "Yachts",
                defaults: new { controller = "Yachts", action = "Index" }
            );
            routes.MapRoute(
                name: "YachtsDetail",
                url: "Yachts/{token}",
                defaults: new { controller = "Yachts", action = "Index" },
                constraints: new { destination = new CustomRouteConstraints.YachtConstraint() }
            );


            routes.MapRoute(
                name: "Cars",
                url: "Cars",
                defaults: new { controller = "Cars", action = "Index" }
            );
            routes.MapRoute(
                name: "CarsDetail",
                url: "Cars/{token}",
                defaults: new { controller = "Cars", action = "Index" },
                constraints: new { destination = new CustomRouteConstraints.CarConstraint() }
            );

            
            routes.MapRoute(
                name: "Magzines",
                url: "Magzines",
                defaults: new { controller = "Magzines", action = "Index" }
            );
            routes.MapRoute(
                name: "MagzinesDetail",
                url: "Magzines/{token}",
                defaults: new { controller = "Magzines", action = "Index" },
                constraints: new { destination = new CustomRouteConstraints.MagzineConstraint() }
            );

            
            routes.MapRoute(
                name: "Services",
                url: "Services",
                defaults: new { controller = "Services", action = "Index" }
            );
            routes.MapRoute(
                name: "ServicesDetail",
                url: "Services/{service}",
                defaults: new { controller = "Services", action = "Detail" },
                constraints: new { destination = new CustomRouteConstraints.ServiceConstraint() }
            );


            routes.MapRoute(
                name: "DestinationDetail",
                url: "{destination}",
                defaults: new { controller = "Destinations", action = "Index" },
                constraints: new { destination = new CustomRouteConstraints.DestinationConstraint() }
            );
            routes.MapRoute(
                name: "TagDestinationDetail",
                url: "{destination}",
                defaults: new { controller = "Destinations", action = "Filter" },
                constraints: new { destination = new CustomRouteConstraints.TagConstraint() }
            );
            routes.MapRoute(
                name: "Villa",
                url: "{destination}",
                defaults: new { controller = "Destinations", action = "Detail"},
                constraints: new { destination = new CustomRouteConstraints.VillaConstraint() }
            );
            routes.MapRoute(
                name: "DestinationVilla",
                url: "{destination}/{villa}",
                defaults: new { controller = "Destinations", action = "Detail"},
                constraints: new { destination = new CustomRouteConstraints.DestinationVillaConstraint() }
            );
            routes.MapRoute(
                name: "Destination",
                url: "Destinations/{action}",
                defaults: new { controller = "Destinations", action = "Index" }
            );



            routes.MapRoute(
                name: "HomeDefault",
                url: "{action}",
                defaults: new { controller = "Home", action = "Index" },
                constraints: new { destination = new CustomRouteConstraints.HomeConstraint() }
            );
            routes.MapRoute(
                name: "HomeDefault2",
                url: "Home/{action}",
                defaults: new { controller = "Home", action = "Index" }
            );

            routes.MapRoute(
                name: "MainController",
                url: "homeowner",
                defaults: new { controller = "homeowner", action = "Index" }
            );



            routes.MapRoute(
                name: "BogousLink",
                url: "{*tags}",
                defaults: new { controller = "Forwarder", action = "Index", tag = UrlParameter.Optional, tags = UrlParameter.Optional },
                constraints: new { destination = new CustomRouteConstraints.CustomUrlConstraint() }
            );

            routes.MapRoute(
                name: "NotFound",
                url: "{*urls}",
                defaults: new { controller = "Home", action = "Index", urls = UrlParameter.Optional },
                constraints: new { destination = new CustomRouteConstraints.NotFoundConstraint() }
            );

            routes.MapRoute(
                name: "Default",
                url: "{*urls}",
                defaults: new { controller = "Home", action = "Index", urls = UrlParameter.Optional }
            );

        }
    }
}