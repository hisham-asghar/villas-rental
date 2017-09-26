using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RentalsProject.Controllers
{
    public class UserController : Controller
    {
        //
        // GET: /User/
        [HttpGet]
        public ActionResult SignIn()
        {
            if(Session["user"] != null)
                return RedirectToAction("Index", "MyProperty");
            return View();
        }

        [HttpGet]
        public ActionResult SignOut()
        {
            Session.RemoveAll();
            return RedirectToAction("Index","MyProperty");
        }
        
        [HttpPost]
        [ActionName("SignIn")]
        public ActionResult Login(string username = "",string password = "")
        {
            if (username == "cesar" && password == "cesar")
            {
                Session["user"] = true;
                return RedirectToAction("Index", "MyProperty");
            }
            return View();
        }

    }
}
