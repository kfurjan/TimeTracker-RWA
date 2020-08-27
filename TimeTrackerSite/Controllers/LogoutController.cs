using System.Web.Mvc;

namespace TimeTrackerSite.Controllers
{
    public class LogoutController : Controller
    {
        public ActionResult Logout()
        {
            Session["user"] = null;
            return RedirectToAction(controllerName: "Login", actionName: "Login");
        }
    }
}