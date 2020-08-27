using AdminSite.App_LocalResources;
using AdminSite.Models;
using DataAccessLayer.Repository;
using System;

namespace AdminSite
{
    public partial class Employee : PageLocalization
    {
        private readonly IRepository _repository = RepositoryFactory.GetRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            Title = Employee_aspx.pageTitle;
            if (Session?["user"] == null) { Response.Redirect("Login.aspx"); }

            inputEmployee.Visible = false;
            btnEmployeeAdd.Visible = false;
        }

        protected void btnEmployeeFormShow_OnClick(object sender, EventArgs e)
        {
            // input form
            inputEmployee.Visible = true;
            btnEmployeeAdd.Visible = true;
            lblPassword.Visible = true;
            txtPassword.Visible = true;

            btnEmployeeEdit.Visible = false;
            btnEmployeeDelete.Visible = false;
            divAlert.Visible = false;

            // DropDownList for teams
            ddlTeams.Items.Clear();
            ddlTeams.DataSource = _repository.GetTeams();
            ddlTeams.DataValueField = "IdTeam";
            ddlTeams.DataTextField = "Name";
            ddlTeams.DataBind();

            // DropDownList for EmployeeTypes
            ddlEmpoyeeTypes.Items.Clear();
            ddlEmpoyeeTypes.DataSource = _repository.GetEmployeeTypes();
            ddlEmpoyeeTypes.DataValueField = "IdEmployeeType";
            ddlEmpoyeeTypes.DataTextField = "EmployeeType";
            ddlEmpoyeeTypes.DataBind();

            // clear data in input fields
            txtName.Text = string.Empty;
            txtLastname.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            ddlEmpoyeeTypes.SelectedValue = "1";
            ddlTeams.SelectedValue = "1";
        }

        protected void GridViewEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            // input form
            inputEmployee.Visible = true;
            btnEmployeeEdit.Visible = true;
            btnEmployeeDelete.Visible = true;

            lblPassword.Visible = false;
            txtPassword.Visible = false;
            divAlert.Visible = false;

            // DropDownList for teams
            ddlTeams.Items.Clear();
            ddlTeams.DataSource = _repository.GetTeams();
            ddlTeams.DataValueField = "IdTeam";
            ddlTeams.DataTextField = "Name";
            ddlTeams.DataBind();

            // DropDownList for EmployeeTypes
            ddlEmpoyeeTypes.Items.Clear();
            ddlEmpoyeeTypes.DataSource = _repository.GetEmployeeTypes();
            ddlEmpoyeeTypes.DataValueField = "IdEmployeeType";
            ddlEmpoyeeTypes.DataTextField = "EmployeeType";
            ddlEmpoyeeTypes.DataBind();

            // data in input fields
            txtName.Text = GridViewEmployee.SelectedRow.Cells[2].Text;
            txtLastname.Text = GridViewEmployee.SelectedRow.Cells[3].Text;
            txtEmail.Text = GridViewEmployee.SelectedRow.Cells[4].Text;
            txtPhone.Text = GridViewEmployee.SelectedRow.Cells[5].Text;
            try
            {
                ddlEmpoyeeTypes.SelectedValue = GridViewEmployee.SelectedRow.Cells[7].Text;
                ddlTeams.SelectedValue = GridViewEmployee.SelectedRow.Cells[9].Text;
            }
            catch
            {
                ddlEmpoyeeTypes.SelectedValue = "1";
                ddlTeams.SelectedValue = "1";
            }
        }

        protected void btnEmployeeAdd_OnClick(object sender, EventArgs e)
        {
            string firstName = txtName.Text;
            string lastName = txtLastname.Text;
            string password = txtPassword.Text;
            string email = txtEmail.Text;
            string phone = txtPhone.Text;
            int idEmployeeType = int.Parse(ddlEmpoyeeTypes.SelectedValue);
            int idTeam = int.Parse(ddlTeams.SelectedValue);

            if (_repository.EmailExists(email.Trim()))
            {
                divAlert.Visible = true;
                return;
            }

            _repository.CreateEmployee(firstName, lastName, password, email, phone, idEmployeeType, idTeam);
            Response.Redirect(Request.Url.LocalPath);
        }

        protected void btnEmployeeDelete_OnClick(object sender, EventArgs e)
        {
            int idEmployee = int.Parse(GridViewEmployee.SelectedRow.Cells[1].Text);
            _repository.DeleteEmployee(idEmployee);
            Response.Redirect(Request.Url.LocalPath);
        }

        protected void btnEmployeeEdit_OnClick(object sender, EventArgs e)
        {
            int idEmployee = int.Parse(GridViewEmployee.SelectedRow.Cells[1].Text);
            string firstName = txtName.Text;
            string lastName = txtLastname.Text;
            string email = txtEmail.Text;
            string phone = txtPhone.Text;
            int idEmployeeType = int.Parse(ddlEmpoyeeTypes.SelectedValue);
            int idTeam = int.Parse(ddlTeams.SelectedValue);

            _repository.UpdateEmployee(idEmployee, firstName, lastName, email, phone, idEmployeeType, idTeam);
            Response.Redirect(Request.Url.LocalPath);
        }
    }
}