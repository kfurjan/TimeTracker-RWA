using AdminSite.App_LocalResources;
using AdminSite.Models;
using DataAccessLayer.Repository;
using System;

namespace AdminSite
{
    public partial class Project : PageLocalization
    {
        private readonly IRepository _repository = RepositoryFactory.GetRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            Title = Project_aspx.pageTitle;
            if (Session?["user"] == null) { Response.Redirect("Login.aspx"); }

            inputProjectTeam.Visible = false;
            btnProjectAdd.Visible = false;
            btnProjectDelete.Visible = false;
            btnProjectEdit.Visible = false;
            btnProjectAddTeam.Visible = false;
        }

        protected void btnProjectFormShow_Click(object sender, EventArgs e)
        {
            ddlClients.Items.Clear();
            ddlTeams.Items.Clear();
            // DropDownList for clients
            ddlClients.DataSource = _repository.GetClients();
            ddlClients.DataValueField = "IDClient";
            ddlClients.DataTextField = "Name";
            ddlClients.DataBind();
            // DropDownList for teams
            ddlTeams.DataSource = _repository.GetTeams();
            ddlTeams.DataValueField = "IdTeam";
            ddlTeams.DataTextField = "Name";
            ddlTeams.DataBind();

            inputProjectTeam.Visible = true;
            btnProjectAdd.Visible = true;

            btnProjectDelete.Visible = false;
            btnProjectEdit.Visible = false;
            btnProjectAddTeam.Visible = false;

            txtDescription.Text = string.Empty;
            txtProject.Text = string.Empty;
        }

        protected void GridViewProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlClients.Items.Clear();
            ddlTeams.Items.Clear();
            // DropDownList for clients
            ddlClients.DataSource = _repository.GetClients();
            ddlClients.DataValueField = "IDClient";
            ddlClients.DataTextField = "Name";
            ddlClients.DataBind();
            // DropDownList for teams
            ddlTeams.DataSource = _repository.GetTeams();
            ddlTeams.DataValueField = "IdTeam";
            ddlTeams.DataTextField = "Name";
            ddlTeams.DataBind();

            inputProjectTeam.Visible = true;
            btnProjectDelete.Visible = true;
            btnProjectEdit.Visible = true;
            btnProjectAddTeam.Visible = true;
            btnProjectAdd.Visible = false;

            txtProject.Text = GridViewProject.SelectedRow.Cells[2].Text;
            txtDescription.Text = GridViewProject.SelectedRow.Cells[3].Text;
            try
            {
                ddlTeams.SelectedValue = GridViewProject.SelectedRow.Cells[6].Text;
            }
            catch
            {
                ddlTeams.SelectedValue = "1";
            }
        }

        protected void btnProjectEdit_Click(object sender, EventArgs e)
        {
            int idProject = int.Parse(GridViewProject.SelectedRow.Cells[1].Text);
            int oldIdTeam = int.Parse(GridViewProject.SelectedRow.Cells[6].Text);
            string projectName = txtProject.Text;
            string description = txtDescription.Text;
            int idClient = int.Parse(ddlClients.SelectedValue);
            int newIdTeam = int.Parse(ddlTeams.SelectedValue);

            _repository.UpdateProject(idProject, oldIdTeam, projectName, description, idClient, newIdTeam);
            Response.Redirect(Request.Url.LocalPath);
        }

        protected void btnProjectDelete_Click(object sender, EventArgs e)
        {
            int idProject = int.Parse(GridViewProject.SelectedRow.Cells[1].Text);
            int idTeam = int.Parse(GridViewProject.SelectedRow.Cells[6].Text);

            _repository.DeleteProject(idProject, idTeam);
            Response.Redirect(Request.Url.LocalPath);
        }

        protected void btnProjectAdd_Click(object sender, EventArgs e)
        {
            string projectName = txtProject.Text;
            string description = txtDescription.Text;
            int idClient = int.Parse(ddlClients.SelectedValue);
            int idTeam = int.Parse(ddlTeams.SelectedValue);

            _repository.CreateProject(projectName, description, idClient, idTeam);
            Response.Redirect(Request.Url.LocalPath);
        }

        protected void btnProjectAddTeam_Click(object sender, EventArgs e)
        {
            int idProject = int.Parse(GridViewProject.SelectedRow.Cells[1].Text);
            int idTeam = int.Parse(ddlTeams.SelectedValue);

            _repository.AddTeamToExistingProject(idProject, idTeam);
            Response.Redirect(Request.Url.LocalPath);
        }
    }
}