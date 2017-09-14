using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace RentalsClinet.RouteHandler
{
    public class CustomHandler : IHttpHandler
    {
        public RequestContext LocalRequestContext { get; set; }

        public CustomHandler(RequestContext requestContext)
        {
            LocalRequestContext = requestContext;
        }

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                var controllerName = LocalRequestContext.RouteData.GetRequiredString("controller");
                var controller = ControllerBuilder.Current.GetControllerFactory().
                    CreateController(LocalRequestContext, controllerName);
                if (controller != null)
                {
                    controller.Execute(LocalRequestContext);
                }
            }
            catch
            {
                try
                {
                    var client = new WebClient();
                    var content = client.DownloadString("http://localhost:24220/" +
                                                        LocalRequestContext.HttpContext.Request.FilePath);
                    LocalRequestContext.HttpContext.Response.Write(content);
                }
                catch
                {
                    LocalRequestContext.HttpContext.Response.StatusCode = 404;
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return true;
            }
        }
    }
}