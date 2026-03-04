using Contoso.DataAccess;
using Contoso.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Contoso.Controllers
{
    public class HomeController : Controller
    {
        private SchoolContext db = new SchoolContext();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            /*
SELECT EnrollmentDate AS EnrollmentDate, COUNT(*) AS StudentCount
FROM student
GROUP BY EnrollmentDate;
            */
            // LINQ to Entities 查詢，將學生依照註冊日期分組，並計算每個註冊日期的學生人數。
            var data = from student in db.Students
                       group student by student.EnrollmentDate into dataGroup
                       select new EnrollmentDateGroup()
                       {
                           EnrollmentDate = dataGroup.Key,
                           StudentCount = dataGroup.Count()
                       };

            return View(data.ToList());
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        // controller 被釋放時，也釋放 database context。
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}