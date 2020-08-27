using DataAccessLayer.Csv;
using DataAccessLayer.Models;
using DataAccessLayer.Repository;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.SQL
{
    public class SqlRepository : IRepository
    {
        private const string Cs = @"Server=.;Database=PRA20-Kevin-Furjan;Uid=sql-login;Pwd=sqlServer01.";

        public int CreateEmployee(string firstName, string lastName, string password, string email, string phone, int idEmployeeType,
            int idTeam) =>
            SqlHelper.ExecuteNonQuery(Cs, "createEmployee",
                firstName, lastName, password, email, phone, idEmployeeType, idTeam);
        public int DeleteEmployee(int idEmployee) => SqlHelper.ExecuteNonQuery(Cs, "softDeleteEmployee", idEmployee);
        public int UpdateEmployee(int idEmployee, string firstName, string lastName, string email, string phone,
            int idEmployeeType, int idTeam) =>
            SqlHelper.ExecuteNonQuery(Cs, "updateEmployee",
                idEmployee, firstName, lastName, email, phone, idEmployeeType, idTeam);

        public int ChangeEmployeePassword(int idEmployee, string password)
            => SqlHelper.ExecuteNonQuery(Cs, "changeEmployeePassword", idEmployee, password);

        public Employee GetEmployee(int idEmployee) => throw new NotImplementedException();

        public Employee GetEmployee(string email)
        {
            DataRow row = SqlHelper
                    .ExecuteDataset(Cs, "selectEmployeeByEmail", email)
                    .Tables[0].Rows[0];

            return new Employee
            {
                IdEmployee = (int)row["IDEmployee"],
                Firstname = row["Firstname"].ToString(),
                Lastname = row["Lastname"].ToString(),
                Password = row["Password"].ToString(),
                Email = row["Email"].ToString(),
                Phone = row["Phone"].ToString(),
                EmployeeType = (EmployeeType)row["EmployeeTypeID"],
                TeamId = (int)row["TeamID"]
            };
        }

        public IEnumerable<Employee> GetEmployees()
        {
            foreach (DataRow row in SqlHelper.ExecuteDataset(Cs, "selectAllEmployees").Tables[0].Rows)
            {
                yield return new Employee
                {
                    IdEmployee = (int)row["IDEmployee"],
                    Firstname = row["Firstname"].ToString(),
                    Lastname = row["Lastname"].ToString(),
                    Password = row["Password"].ToString(),
                    Email = row["Email"].ToString(),
                    Phone = row["Phone"].ToString(),
                    EmployeeType = (EmployeeType)row["EmployeeTypeID"],
                    TeamId = (int)row["TeamID"],
                    Fullname = row["Fullname"].ToString()
                };
            }
        }

        public IEnumerable<EmployeeTypeModel> GetEmployeeTypes()
        {
            foreach (DataRow row in SqlHelper.ExecuteDataset(Cs, "selectEmployeeTypes").Tables[0].Rows)
            {
                yield return new EmployeeTypeModel
                {
                    IdEmployeeType = (int)row["ID"],
                    EmployeeType = row["Name"].ToString(),
                };
            }
        }

        public bool EmployeeExists(string email, string password, bool admin = false)
        {
            try
            {
                DataRow row = SqlHelper
                    .ExecuteDataset(Cs, "selectEmployeeLogin", email, password)
                    .Tables[0].Rows[0];

                if (admin)
                {
                    return row["Email"].ToString() == email &&
                           row["Password"].ToString() == password &&
                           ((int)row["EmployeeTypeID"] == 1 || (int)row["EmployeeTypeID"] == 2);
                }

                return row["Email"].ToString() == email &&
                       row["Password"].ToString() == password;
            }
            catch (Exception e) when (e is IndexOutOfRangeException || e is SqlException) { return false; }
        }
        public bool EmailExists(string email)
        {
            try
            {
                DataRow row = SqlHelper
                    .ExecuteDataset(Cs, "selectEmployeeEmail", email)
                    .Tables[0].Rows[0];

                return row["Email"].ToString() == email;
            }
            catch (Exception e) when (e is IndexOutOfRangeException || e is SqlException) { return false; }
        }

        public IEnumerable<Client> GetClients()
        {
            foreach (DataRow row in SqlHelper.ExecuteDataset(Cs, "selectClients").Tables[0].Rows)
            {
                yield return new Client
                {
                    IdClient = (int)row["IDClient"],
                    Name = row["Name"].ToString(),
                    Email = row["Email"].ToString()
                };
            }
        }
        public int CreateClient(string name, string email)
        {
            return SqlHelper.ExecuteNonQuery(Cs, "insertClient", name, email);
        }

        public IEnumerable<TeamLead> GetTeamLeads()
        {
            foreach (DataRow row in SqlHelper.ExecuteDataset(Cs, "selectTeamLeads").Tables[0].Rows)
            {
                yield return new TeamLead
                {
                    IdTeamLead = (int)row["IdTeamLead"],
                    Name = row["Name"].ToString()
                };
            }
        }

        public IEnumerable<Team> GetTeams()
        {
            foreach (DataRow row in SqlHelper.ExecuteDataset(Cs, "selectTeams").Tables[0].Rows)
            {
                yield return new Team
                {
                    IdTeam = (int)row["ID"],
                    Name = row["Name"].ToString(),
                    TeamLead = new TeamLead
                    {
                        IdTeamLead = (int)row["IDTeamLead"],
                        Name = row["Team lead"].ToString()
                    }
                };
            }
        }
        public int CreateTeam(string teamName, int idTeamLead) => SqlHelper.ExecuteNonQuery(Cs, "createTeam", teamName, idTeamLead);

        public int UpdateTeam(int idTeam, string teamName, int idTeamLead) => SqlHelper.ExecuteNonQuery(Cs, "updateTeam", idTeam, teamName, idTeamLead);

        public int DeleteTeam(int idTeam) => SqlHelper.ExecuteNonQuery(Cs, "softDeleteTeam", idTeam);

        public int CreateProject(string projectName, string description, int idClient, int idTeam) => SqlHelper.ExecuteNonQuery(Cs, "createProject", projectName, description, idClient, idTeam);

        public int UpdateProject(int idProject, int oldIdTeam, string projectName, string description, int idClient, int newIdTeam) =>
            SqlHelper.ExecuteNonQuery(Cs, "updateProject",
                idProject, oldIdTeam, projectName, description, idClient, newIdTeam);

        public int DeleteProject(int idProject, int idTeam) =>
            SqlHelper.ExecuteNonQuery(Cs, "softDeleteProject", idProject, idTeam);

        public int AddTeamToExistingProject(int idProject, int idTeam) =>
            SqlHelper.ExecuteNonQuery(Cs, "addTeamToExistingProject", idProject, idTeam);

        public IEnumerable<Project> GetProjectsByEmployeeId(int id)
        {
            foreach (DataRow row in SqlHelper.ExecuteDataset(Cs, "getProjectsByIDEmployee", id).Tables[0].Rows)
            {
                yield return new Project
                {
                    IdProject = (int)row["IDProject"],
                    Name = row["Name"].ToString(),
                    Description = row["Description"].ToString(),
                    TimeWorked = (int)row["TimeWorked"]
                };
            }
        }

        public int UpdateTimeWorkedByIdEmployee(int employeeId, int projectId, int timeWorked)
            => SqlHelper.ExecuteNonQuery(Cs, "updateTimeWorkedByIDEmployee", employeeId, projectId, timeWorked);

        public int GetIdTeamLead(int employeeId)
        {
            foreach (DataRow row in SqlHelper.ExecuteDataset(Cs, "getIdTeamLead", employeeId).Tables[0].Rows) { return (int)row["IDTeamLead"]; }
            return 0;
        }
        public IEnumerable<EmployeeTimeSheet> GetAllEmployeesByIdTeamLead(int teamLeadId)
        {
            foreach (DataRow row in SqlHelper.ExecuteDataset(Cs, "getAllEmployeesByIdTeamLead", teamLeadId).Tables[0].Rows)
            {
                yield return new EmployeeTimeSheet
                {
                    Fullname = row["Fullname"].ToString(),
                    ProjectName = row["Project"].ToString(),
                    TeamName = row["Team"].ToString(),
                    TimeWorked = (int)row["TimeWorked"]
                };
            }
        }


        // CSV Export
        public void ExportProjectsByEmployeeId(int id, string name)
        {
            var query = SqlHelper.ExecuteDataset(Cs, "getProjectsByIDEmployee", id);
            CsvHelper.ExportSqlQuery(query, name);
        }

        public void ExportProjectsByClientId(int id, string name)
        {
            var query = SqlHelper.ExecuteDataset(Cs, "getProjectsTimeByIDClient", id);
            CsvHelper.ExportSqlQuery(query, name);
        }
    }
}
