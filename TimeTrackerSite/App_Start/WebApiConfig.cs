using System.Linq;
using System.Web.Http;

namespace TimeTrackerSite
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            SetJsonReturnType(config);
        }

        private static void SetJsonReturnType(HttpConfiguration config)
        {
            var xmlType =
                config.
                Formatters.
                XmlFormatter.
                SupportedMediaTypes.
                FirstOrDefault(mt => mt.MediaType == "application/xml");

            config.Formatters.XmlFormatter.SupportedMediaTypes.Remove(xmlType);
        }
    }
}
