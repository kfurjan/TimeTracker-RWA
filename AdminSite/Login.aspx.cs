using AdminSite.App_LocalResources;
using AdminSite.Models;
using DataAccessLayer.Repository;
using System;

namespace AdminSite
{
    public partial class Login : PageLocalization
    {
        private readonly IRepository _repository = RepositoryFactory.GetRepository();

        protected void Page_Load(object sender, EventArgs e) { Title = Login_aspx.pageTitle; }

        protected void ValidateUser(object sender, EventArgs e)
        {
            if (!_repository.EmployeeExists($@"{txtUsername.Text}", $@"{txtPassword.Text}", admin: true))
            {
                dvMessage.Visible = true;
                txtUsername.Text = string.Empty;
                return;
            }
            Session["user"] = _repository.GetEmployee(txtUsername.Text);

            dvMessage.Visible = false;
            txtUsername.Text = string.Empty;
            Response.Redirect("Employee.aspx");
        }
    }
}