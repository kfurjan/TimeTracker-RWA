using DataAccessLayer.Models;
using System.Web.Mvc;

namespace TimeTrackerSite.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Projects()
        {
            if (Session?["user"] == null) { return RedirectToAction(controllerName: "Login", actionName: "Login"); }

            return View();
        }

        public ActionResult Employees()
        {
            if (Session?["user"] is Employee employee)
            {
                if (employee.EmployeeType == EmployeeType.Director || employee.EmployeeType == EmployeeType.TeamLead)
                {
                    return View();
                }
            }

            return RedirectToAction(controllerName: "Login", actionName: "Login");
        }
    }
}