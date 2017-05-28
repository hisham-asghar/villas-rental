using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;
using RentalsProject.Helpers;

namespace RentalsProject.Controllers
{
    public class FilesController : Controller
    {
        //
        // GET: /Files/
        
        FilesHelper filesHelper;
        String tempPath = "~/uploads/";
        String serverMapPath = "~/uploads/";
        private string StorageRoot
        {
            get { return Path.Combine(HostingEnvironment.MapPath(serverMapPath)); }
        }
        private string UrlBase = "/uploads/";
        String DeleteURL = "/FileUpload/DeleteFile/?file=";
        String DeleteType = "GET";
        public FilesController()
        {
           filesHelper = new FilesHelper(DeleteURL, DeleteType, StorageRoot, UrlBase, tempPath, serverMapPath);
        }


        [HttpGet]
        public JsonResult DeleteFile(string file)
        {
            filesHelper.DeleteFile(file);
            return Json("OK", JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Upload()
        {
            var resultList = new List<ViewDataUploadFilesResult>();

            var currentContext = HttpContext;

            filesHelper.UploadAndShowResults(currentContext, resultList);
            var files = new JsonFiles(resultList);

            var isEmpty = !resultList.Any();
            return isEmpty ? Json("Error ") : Json(files);
        }

    }
}
