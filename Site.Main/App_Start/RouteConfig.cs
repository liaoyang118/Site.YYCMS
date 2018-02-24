using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Site.Main
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "List",
                url: "List/{pageParam}.html",
                defaults: new { controller = "List", action = "Index" }
            );

            routes.MapRoute(
                name: "Detail",
                url: "Detail/{gid}.html",
                defaults: new { controller = "Detail", action = "Index" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            

        }
    }
}
