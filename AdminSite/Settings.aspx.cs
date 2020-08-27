using AdminSite.App_LocalResources;
using AdminSite.Models;
using System;
using System.Web;
using System.Web.UI.WebControls;

namespace AdminSite
{
    public partial class Settings : PageLocalization
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Title = Settings_aspx.pageTitle;
            if (Session?["user"] == null) { Response.Redirect("Login.aspx"); }

            SetDdlToCorrectIndex();
        }

        private void SetDdlToCorrectIndex()
        {
            if (!IsPostBack)
            {
                ddlLanguage.SelectedIndex = DdlLanguageIndex;
            }
        }

        protected void ddlLanguage_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlLanguage.SelectedValue == "0") return;

            HttpCookie languageCookie = new HttpCookie("localization")
            {
                ["language"] = ddlLanguage.SelectedValue,
                ["index"] = ((DropDownList)sender).SelectedIndex.ToString()
            };

            Response.Cookies.Add(languageCookie);
            Response.Redirect(Request.Url.LocalPath);
        }
    }
}