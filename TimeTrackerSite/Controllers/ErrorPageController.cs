using System.Web.Mvc;

namespace TimeTrackerSite.Controllers
{
    public class ErrorPageController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Oops(int id)
        {
            Response.StatusCode = id;
            ViewBag.StatusCode = id;

            return View();
        }
    }
}