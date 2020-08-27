using AdminSite.App_LocalResources;
using AdminSite.Models;
using DataAccessLayer.Repository;
using System;

namespace AdminSite
{
    public partial class Report : PageLocalization
    {
        private readonly IRepository _repository = RepositoryFactory.GetRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            Title = Report_aspx.pageTitle;
            if (Session?["user"] == null) { Response.Redirect("Login.aspx"); }

            divReportClient.Visible = false;
            divReportEmployee.Visible = false;
        }

        protected void btnReportEmployeeForm_OnClick(object sender, EventArgs e)
        {
            divReportClient.Visible = false;
            divReportEmployee.Visible = true;

            // initialize drop down list
            ddlEmployees.Items.Clear();
            ddlEmployees.DataSource = _repository.GetEmployees();
            ddlEmployees.DataValueField = "IDEmployee";
            ddlEmployees.DataTextField = "Fullname";
            ddlEmployees.DataBind();
        }

        protected void btnReportClientForm_OnClick(object sender, EventArgs e)
        {
            // visible forms
            divReportEmployee.Visible = false;
            divReportClient.Visible = true;

            // initialize drop down list
            ddlClients.Items.Clear();
            ddlClients.DataSource = _repository.GetClients();
            ddlClients.DataValueField = "IDClient";
            ddlClients.DataTextField = "Name";
            ddlClients.DataBind();
        }

        protected void btnReportEmployee_Click(object sender, EventArgs e)
        {
            var employeeId = int.Parse(ddlEmployees.SelectedValue);
            var employeeName = ddlEmployees.SelectedItem.Text;
            _repository.ExportProjectsByEmployeeId(employeeId, employeeName);
        }

        protected void btnReportClient_Click(object sender, EventArgs e)
        {
            var clientId = int.Parse(ddlClients.SelectedValue);
            var clientName = ddlClients.SelectedItem.Text;
            _repository.ExportProjectsByClientId(clientId, clientName);
        }
    }
}