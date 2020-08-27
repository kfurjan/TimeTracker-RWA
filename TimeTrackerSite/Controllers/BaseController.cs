using System;
using System.Globalization;
using System.Threading;
using System.Web;
using System.Web.Mvc;

namespace TimeTrackerSite.Controllers
{
    public class BaseController : Controller
    {
        protected override IAsyncResult BeginExecuteCore(AsyncCallback callback, object state)
        {
            HttpCookie cultureCookie = Request.Cookies["culture"];

            if (cultureCookie != null)
            {
                string culture = cultureCookie.Value;
                Thread.CurrentThread.CurrentCulture = new CultureInfo(culture);
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(culture);
            }

            return base.BeginExecuteCore(callback, state);
        }
    }
}