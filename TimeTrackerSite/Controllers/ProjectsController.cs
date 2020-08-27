using DataAccessLayer.Repository;
using System.Web.Http;

namespace TimeTrackerSite.Controllers
{
    public class ProjectsController : ApiController
    {
        private readonly IRepository _repository = RepositoryFactory.GetRepository();

        // GET: Projects by employee id
        [HttpGet]
        [Route("api/projects/{id:int}")]
        public IHttpActionResult GetProjects(int id)
        {
            if (!ModelState.IsValid) { return BadRequest(); }
            return Ok(_repository.GetProjectsByEmployeeId(id));
        }

        // GET: all employees by teamLeadId
        [HttpGet]
        [Route("api/employees/{employeeId:int}")]
        public IHttpActionResult GetAllEmployees(int employeeId)
        {
            if (!ModelState.IsValid) { return BadRequest(); }

            var teamLeadId = _repository.GetIdTeamLead(employeeId);
            return Ok(_repository.GetAllEmployeesByIdTeamLead(teamLeadId));
        }

        // PUT: update time spent on project by employee id
        [HttpPut]
        [Route("api/projects/{employeeId:int}/{projectId:int}/{timeWorked:int}")]
        public IHttpActionResult UpdateProjectTime([FromUri] int employeeId, [FromUri] int projectId, [FromUri] int timeWorked)
        {
            if (!ModelState.IsValid) { return BadRequest(); }

            _repository.UpdateTimeWorkedByIdEmployee(employeeId, projectId, timeWorked);

            return Ok();
        }
    }
}
