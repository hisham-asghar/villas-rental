using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using LayerDB;

namespace RentalsProject.Controllers
{
    [AuthorizeSession]
    public class LinkController : Controller
    {
        //
        // GET: /Link/

        public ActionResult Index()
        {
            var list = LayerDAO.UrlMetaDAO.GetAll();
            return View(list);
        }
        public ActionResult Delete(int id = 0)
        {
            if (id > 0)
            {
                LayerDAO.UrlMetaDAO.Delete(id);
            }
            return RedirectToAction("Index");
        }
        public ActionResult Update(string link1, string link2, int id = 0)
        {
            var errorList = new List<string>();
            if (!IsURLValid(link1))
            {
                errorList.Add("("+link1+")Link is not valid!!");
            }
            if (!IsURLValid(link2) || !IsUrlExist(link2))
            {
                errorList.Add("("+link2+")Redirection Link is not valid!!");
            }
            if (link2 == link1)
            {
                errorList.Add("Both links can't be same");
            }
            
            if(LayerDAO.StaticData.IsExistAlready(link1))
            {
                errorList.Add("("+link1+") -- Already exists!!");
            }
            
            if(!LayerDAO.StaticData.IsExistAlready(link2))
            {
                errorList.Add("Redirecting Link ("+link2+") -- doesn't exists!!");
            }

            if (errorList.Count > 0)
            {
                var list = LayerDAO.UrlMetaDAO.GetAll();
                ViewBag.errors = errorList;
                return View("Index", list);
            }


            var model = new UrlMeta()
            {
                UrlMetaId = id,
                DummyLink = link1,
                RealLink = link2
            };
            LayerDAO.UrlMetaDAO.Save(model);

            IsUrlExist(Helpers.CustomActions.getUpdateDataLocation());
            
            return RedirectToAction("Index");
        }

        public static bool IsURLValid(string source)
        {
            Uri uriResult;
            return Uri.TryCreate(source, UriKind.Absolute, out uriResult) && uriResult.Scheme == Uri.UriSchemeHttp;
        }


        /// <summary>
        /// This method will check a url to see that it does not return server or protocol errors
        /// </summary>
        /// <param name="url">The path to check</param>
        /// <returns></returns>
        public bool IsUrlExist(string url)
        {
            try
            {
                var request = WebRequest.Create(url) as HttpWebRequest;
                if (request != null)
                {
                    request.Timeout = 5000; //set the timeout to 5 seconds to keep the user from waiting too long for the page to load
                    request.Method = "HEAD"; //Get only the header information -- no need to download any content

                    var response = request.GetResponse() as HttpWebResponse;

                    if (response != null)
                    {
                        var statusCode = (int)response.StatusCode;
                        if (statusCode >= 100 && statusCode < 400) //Good requests
                        {
                            return true;
                        }
                        if (statusCode >= 500 && statusCode <= 510) //Server Errors
                        {
                    
                            return false;
                        }
                    }
                }
            }
            catch (WebException ex)
            {
                if (ex.Status == WebExceptionStatus.ProtocolError) //400 errors
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                // ignored
            }
            return false;
        }
    }
}
