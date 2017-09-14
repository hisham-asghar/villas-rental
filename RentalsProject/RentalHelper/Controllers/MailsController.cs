using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RentalHelper.Controllers
{
    public class MailsController : Controller
    {
        // GET: Mails
        public ActionResult Index()
        {
            return View();
        }
        // GET: Mails
        public ActionResult Send(string guid)
        {
            var mail = LayerDAO.MailDAO.get(guid);
            var res = Helper.EmailHelper.SendMail(new RentalHelper.Helper.SendEmailModel()
            {
                Body = mail.Text,
                Subject = mail.Subject,
                To = mail.MailTo
            });
            return Json(res, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Test(string to = "hisham@octacer.com")
        {
            var res = Helper.EmailHelper.SendMail(new RentalHelper.Helper.SendEmailModel()
            {
                Body = "Testing Helper Body",
                Subject = "Testing Helper SUbject",
                To = to
            });
            return Json(res, JsonRequestBehavior.AllowGet);
        }
    }
}