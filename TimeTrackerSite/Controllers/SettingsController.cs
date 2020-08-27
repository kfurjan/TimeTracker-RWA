using DataAccessLayer.Models;
using DataAccessLayer.Repository;
using System.Web;
using System.Web.Mvc;

namespace TimeTrackerSite.Controllers
{
    public class SettingsController : BaseController
    {
        private readonly IRepository _repository = RepositoryFactory.GetRepository();
        [HttpGet]
        public ActionResult Settings()
        {
            if (Session?["user"] == null) { return RedirectToAction(controllerName: "Login", actionName: "Login"); }

            Employee employee = (Session["user"] as Employee)!;
            return View(employee);
        }
        [HttpPost]
        public ActionResult Settings(string culture)
        {
            try
            {
                HttpCookie languageCookie = new HttpCookie("culture") { Value = culture };
                Response.Cookies.Add(languageCookie);
                return Json(new { success = true }, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json(new { message = "Could not save culture" }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public ActionResult ChangePassword()
        {
            if (Session?["user"] == null) { return RedirectToAction(controllerName: "Login", actionName: "Login"); }

            return View();
        }

        [HttpPost]
        public ActionResult ChangePassword(string password, string confirmPassword)
        {
            if (Session["user"] is Employee employee && password.Equals(confirmPassword))
            {
                _repository.ChangeEmployeePassword(employee.IdEmployee, password);
                Session.Clear();
                return RedirectToAction(controllerName: "Login", actionName: "Login");
            }

            return RedirectToAction(controllerName: "Settings", actionName: "ChangePassword");
        }
    }
}
