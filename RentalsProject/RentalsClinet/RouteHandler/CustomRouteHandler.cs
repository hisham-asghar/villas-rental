using System.Web;
using System.Web.Routing;

namespace RentalsClinet.RouteHandler
{
    public class CustomRouteHandler
    {
        public IHttpHandler GetHttpHandler(RequestContext requestContext)
        {
            return new CustomHandler(requestContext);
        }
    }
}