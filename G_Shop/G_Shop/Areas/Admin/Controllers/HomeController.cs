using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.Models;
using G_Shop.Areas.Admin.Models;
using G_Shop.DAO;
namespace G_Shop.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
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
            return RedirectToAction("Login");
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
    }
}