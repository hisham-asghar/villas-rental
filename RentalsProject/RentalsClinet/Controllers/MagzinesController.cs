using System.Web.Mvc;
using LayerDAO;

namespace RentalsClinet.Controllers
{
    public class MagzinesController : Controller
    {
        //
        // GET: /Magzines/

        public ActionResult Index(string token)
        {
            if (!string.IsNullOrWhiteSpace(token))
            {
                token = Helpers.CustomFunctions.LinkModifier(token);
                var magzineDictionary = MagzineDAO.GetMagzine(token);
                if (magzineDictionary.Count > 0)
                {
                    return View("Detail", magzineDictionary);
                }
            }
            var list = MagzineDAO.GetMagzines(0);
            return View(list);
        }

    }
}
