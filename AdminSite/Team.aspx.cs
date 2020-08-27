using AdminSite.App_LocalResources;
using AdminSite.Models;
using DataAccessLayer.Repository;
using System;

namespace AdminSite
{
    public partial class Team : PageLocalization
    {
        private readonly IRepository _repository = RepositoryFactory.GetRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            Title = Team_aspx.pageTitle;
            if (Session?["user"] == null) { Response.Redirect("Login.aspx"); }

            inputFormTeam.Visible = false;
            btnTeamAdd.Visible = false;
            btnTeamEdit.Visible = false;
            btnTeamDelete.Visible = false;
        }

        protected void GridViewTeam_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlTeamLead.Items.Clear();
            ddlTeamLead.DataSource = _repository.GetTeamLeads();
            ddlTeamLead.DataValueField = "IdTeamLead";
            ddlTeamLead.DataTextField = "Name";
            ddlTeamLead.DataBind();

            inputFormTeam.Visible = true;
            btnTeamEdit.Visible = true;
            btnTeamDelete.Visible = true;
            txtTeam.Text = GridViewTeam.SelectedRow.Cells[2].Text;
        }

        protected void btnTeamFormShow_Click(object sender, EventArgs e)
        {
            ddlTeamLead.Items.Clear();
            ddlTeamLead.DataSource = _repository.GetTeamLeads();
            ddlTeamLead.DataValueField = "IdTeamLead";
            ddlTeamLead.DataTextField = "Name";
            ddlTeamLead.DataBind();
            inputFormTeam.Visible = true;
            btnTeamAdd.Visible = true;

            btnTeamDelete.Visible = false;
            btnTeamEdit.Visible = false;
            txtTeam.Text = string.Empty;
        }

        protected void btnTeamDelete_Click(object sender, EventArgs e)
        {
            string idTeam = GridViewTeam.SelectedRow.Cells[1].Text;
            _repository.DeleteTeam(int.Parse(idTeam));
            Response.Redirect(Request.Url.LocalPath);
        }

        protected void btnTeamEdit_Click(object sender, EventArgs e)
        {
            string idTeam = GridViewTeam.SelectedRow.Cells[1].Text;
            string teamName = txtTeam.Text;
            string idTeamLead = ddlTeamLead.SelectedValue;

            _repository.UpdateTeam(int.Parse(idTeam), teamName, int.Parse(idTeamLead));
            Response.Redirect(Request.Url.LocalPath);
        }

        protected void btnTeamAdd_Click(object sender, EventArgs e)
        {
            string teamName = txtTeam.Text;
            string idTeamLead = ddlTeamLead.SelectedValue;

            _repository.CreateTeam(teamName, int.Parse(idTeamLead));
            Response.Redirect(Request.Url.LocalPath);
        }
    }
}