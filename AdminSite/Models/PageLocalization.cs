using System.Globalization;
using System.Threading;

namespace AdminSite.Models
{
    public class PageLocalization : System.Web.UI.Page
    {
        public int DdlLanguageIndex
        {
            get => Request.Cookies["localization"]?["index"] != null ? int.Parse(Request.Cookies["localization"]["index"]) : 0;
            set => Request.Cookies["localization"]["index"] = value.ToString();
        }

        protected override void InitializeCulture()
        {
            if (Request.Cookies["localization"]?["language"] != null)
            {
                string culture = Request.Cookies["localization"]["language"];
                Thread.CurrentThread.CurrentCulture = new CultureInfo(culture);
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(culture);
            }
            base.InitializeCulture();
        }
    }
}