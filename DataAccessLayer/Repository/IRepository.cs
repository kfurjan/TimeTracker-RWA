using DataAccessLayer.Models;
using System.Collections.Generic;

namespace DataAccessLayer.Repository
{
    public interface IRepository
    {
        int CreateEmployee(string firstName, string lastName, string password, string email, string phone,
            int idEmployeeType, int idTeam);
        int DeleteEmployee(int idEmployee);
        int UpdateEmployee(int idEmployee, string firstName, string lastName, string email, string phone,
            int idEmployeeType, int idTeam);
        int ChangeEmployeePassword(int idEmployee, string password);
        Employee GetEmployee(int idEmployee);
        Employee GetEmployee(string email);
        IEnumerable<Employee> GetEmployees();

        IEnumerable<EmployeeTypeModel> GetEmployeeTypes();

        bool EmployeeExists(string email, string password, bool admin = false);
        bool EmailExists(string email);

        IEnumerable<Client> GetClients();
        int CreateClient(string name, string email);

        IEnumerable<TeamLead> GetTeamLeads();

        IEnumerable<Team> GetTeams();
        int CreateTeam(string teamName, int idTeamLead);
        int UpdateTeam(int idTeam, string teamName, int idTeamLead);
        int DeleteTeam(int idTeam);

        int CreateProject(string projectName, string description, int idClient, int idTeam);
        int UpdateProject(int idProject, int oldIdTeam, string projectName, string description, int idClient,
            int newIdTeam);
        int DeleteProject(int idProject, int idTeam);
        int AddTeamToExistingProject(int idProject, int idTeam);
        IEnumerable<Project> GetProjectsByEmployeeId(int id);
        int UpdateTimeWorkedByIdEmployee(int employeeId, int projectId, int timeWorked);

        int GetIdTeamLead(int employeeId);
        IEnumerable<EmployeeTimeSheet> GetAllEmployeesByIdTeamLead(int teamLeadId);

        public void ExportProjectsByEmployeeId(int id, string name);
        public void ExportProjectsByClientId(int id, string name);
    }
}
