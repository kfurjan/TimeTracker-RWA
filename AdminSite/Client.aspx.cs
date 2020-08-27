using AdminSite.App_LocalResources;
using AdminSite.Models;
using DataAccessLayer.Repository;
using System;

namespace AdminSite
{
    public partial class Client : PageLocalization
    {
        private readonly IRepository _repository = RepositoryFactory.GetRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            Title = Client_aspx.pageTitle;
            if (Session?["user"] == null) { Response.Redirect("Login.aspx"); }
            inputFormClient.Visible = false;
        }

        protected void btnClientAdd_OnClick(object sender, EventArgs e)
        {
            _repository.CreateClient(txtClient.Text, txtClientEmail.Text);
            Response.Redirect(Request.Url.LocalPath);
        }

        protected void btnClientFormShow_OnClick(object sender, EventArgs e) { inputFormClient.Visible = true; }
    }
}