using DataAccessLayer.Repository;
using System.Web.Mvc;

namespace TimeTrackerSite.Controllers
{
    public class LoginController : BaseController
    {
        private readonly IRepository _repository = RepositoryFactory.GetRepository();
        [HttpGet]
        public ActionResult Login() => View();

        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            try
            {
                if (_repository.EmployeeExists(username, password))
                {
                    Session["user"] = _repository.GetEmployee(username);
                    return RedirectToAction(controllerName: "Home", actionName: "Projects");
                }
            }
            catch { Session["user"] = null; }

            return RedirectToAction("Login");
        }
    }
}