using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.Models;
using G_Shop.Areas.Admin.Models;
using G_Shop.DAO;
using System.IO;

namespace G_Shop.Areas.Admin.Controllers
{
    public class AdminHomeController : Controller
    {
        public List<HttpPostedFileBase> fileUpload = new List<HttpPostedFileBase>();
        // GET: Admin/Home
        public ActionResult Index()
        {
            if (Session["Admin"] == null)
                return View("Login");
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            var admin = Session["Admin"] as NguoiDung;
            if (admin != null)
                return RedirectToAction("Index", "Admin");
            return View();
        }

        public ActionResult Logout()
        {
            Session.Remove("Admin");
            return View("Login");
        }

        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDAO();
                int result = dao.Login(model.UserName, model.Password);
                if (result == 1)
                {
                    var admin = dao.GetUser(model.UserName);
                    if (admin.VaiTro == 1)
                    {
                        Session["Admin"] = admin;
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Bạn không có quyền truy cập!");
                    }
                }
                else
                    ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không đúng. Vui lòng đăng nhập lại!");
            }
            return View();
        }

        [ChildActionOnly]
        public ActionResult Navigation()
        {
            var model = new AdminDAO().GetAllTenLoai();
            return PartialView(model);
        }

        public ActionResult TopMenu()
        {
                var model = Session["Admin"] as NguoiDung;
                return PartialView(model);
            
        }

        [HttpGet]
        public ActionResult CaThe(int MaLoai)
        {
            if (Session["Admin"] == null)
                return View("Login");
            else
            { 
                var model = new AdminDAO().GetCaThe_MaLoai(MaLoai);
                ViewBag.TenLoai = new AdminDAO().GetTenLoai_MaLoai(MaLoai);
                return View(model);
            }
        }

        public ActionResult SaveUploadedFile()
        {
            bool isSavedSuccessfully = true;
            string fName = "";
            foreach (string fileName in Request.Files)
            {
                HttpPostedFileBase file = Request.Files[fileName];
                fName = file.FileName;
                var fileName1 = Path.GetFileName(file.FileName);
                if (file != null && file.ContentLength > 0)
                {
                    if (Session["fileUpload"] == null)
                    {
                        fileUpload.Add(file);
                    }
                    else
                    {
                        fileUpload = (List<HttpPostedFileBase>)Session["fileUpload"];
                        fileUpload.Add(file);
                    }
                }
            }
            Session["fileUpload"] = fileUpload;
            if (isSavedSuccessfully)
            {
                return Json(new { Message = fName });
            }
            else
            {
                return Json(new { Message = "Error in saving file" });
            }
        }

        [HttpPost]
        public ActionResult DeleteFile(string id)
        {
            fileUpload = (List<HttpPostedFileBase>)Session["fileUpload"];
            Session.Remove("fileUpload");
            bool isSavedSuccessfully = true;
            string fName = "";
            foreach (var file in fileUpload)
            {
                if (file.FileName == id)
                {
                    fileUpload.Remove(file);
                    break;
                }
            }
            Session["fileUpload"] = fileUpload;
            if (isSavedSuccessfully)
            {
                return Json(new { Message = fName });
            }
            else
            {
                return Json(new { Message = "Error in delete file" });
            }
        }

        [HttpGet]
        public PartialViewResult ThemCaThe()
        {
            return PartialView();
        }

        [HttpPost]
        public ActionResult Them(CaThe model)
        {         
            if (Session["fileUpload"] != null)
            {
                string _fileName;
                string listImages = "";
                fileUpload = (List<HttpPostedFileBase>)Session["fileUpload"];
                foreach (var item in fileUpload)
                {
                    string pic = Path.GetFileName(item.FileName).Substring(0, Path.GetFileName(item.FileName).IndexOf("."));
                    _fileName = pic + ".jpg";
                    var path = Path.Combine(Server.MapPath("~/assets/client/images/"), _fileName);
                    item.SaveAs(path);
                    listImages += _fileName + "|";
                }
                model.HinhAnh = listImages;
                var dao = new AdminDAO();
                dao.ThemCaThe(model);
                Session["fileUpload"] = null;
            }
            return RedirectToAction("CaThe",new { MaLoai = model.MaLoai});
        }

        [HttpGet]
        public ActionResult SuaCaThe(int MaLoai, int MaCaThe)
        {
            var model = new AdminDAO().GetCaThe_MaLoai_MaCaThe(MaLoai, MaCaThe);
            return View(model);
        }

        [HttpPost]
        public ActionResult SuaCaThe(CaThe cathe)
        {
            new AdminDAO().SuaCaThe(cathe);
            return RedirectToAction("CaThe",new { MaLoai=cathe.MaLoai});
        }
        
    }
}