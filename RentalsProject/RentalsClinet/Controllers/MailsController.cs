using RentalHelper.Helper;
using System.Web.Mvc;

namespace RentalsClinet.Controllers
{
    public class MailsController : Controller
    {
        //
        // GET: /Mails/


        // GET: Mails
        public ActionResult Send(string guid)
        {
            var mail = LayerDAO.MailDAO.get(guid);
            var res = RentalsClinet.Helpers.EmailHelper.SendMail_SendGrid(new SendEmailModel()
            {
                Body = mail.Text,
                Subject = mail.Subject,
                To = mail.MailTo
            });
            return Json(res ? 1 : 0, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Test(string to = "hisham@octacer.com")
        {
            var res = RentalsClinet.Helpers.EmailHelper.SendMail_SendGrid(new RentalHelper.Helper.SendEmailModel()
            {
                Body = "Testing <b>Helper</b> <br/>Body",
                Subject = "Testing Helper SUbject",
                To = to
            });
            return Json(res, JsonRequestBehavior.AllowGet);
        }
    }
}
