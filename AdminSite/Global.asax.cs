using System;

namespace AdminSite
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e) { }

        private void Application_Error(object sender, EventArgs e) { Response.Redirect("~/CustomErrorPages/DefaultErrorPage.aspx"); }
    }
}