using System.Web.Mvc;
using LayerDAO;
using RentalHelper.Helper;

namespace RentalHelper.Controllers
{
    public class MailsController : Controller
    {
        // GET: Mails
        public ActionResult Index()
        {
            // ReSharper disable once Mvc.ViewNotResolved
            return View();
        }
        // GET: Mails
        public ActionResult Send(string guid)
        {
            var mail = MailDAO.get(guid);
            var res = EmailHelper.SendMail(new SendEmailModel
            {
                Body = mail.Text,
                Subject = mail.Subject,
                To = mail.MailTo
            });
            return Json(res, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Test(string to = "hisham@octacer.com")
        {
            var res = EmailHelper.SendMail(new SendEmailModel
            {
                Body = "Testing Helper Body",
                Subject = "Testing Helper SUbject",
                To = to
            });
            return Json(res, JsonRequestBehavior.AllowGet);
        }
    }
}