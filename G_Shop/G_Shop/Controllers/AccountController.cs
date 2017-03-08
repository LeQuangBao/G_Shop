using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.Models;

namespace G_Shop.Controllers
{
    public class AccountController : Controller
    {
        GShopEntities3 db = new GShopEntities3();
        // GET: Account
        public ActionResult Login()
        {
            var cki = Request.Cookies["user"];
            if (cki != null)
            {
                ViewBag.Id = cki.Values["Id"];
                ViewBag.Password = cki.Values["Pw"];
            }
            return View();
        }
        [HttpPost]
        public ActionResult Login(ModelLogin nd)
        {

            var user = db.NguoiDungs.Where(n => n.TenDangNhap.Equals(nd.UserName)).FirstOrDefault();

            if (user == null)
            {
                ModelState.AddModelError("", "Sai tên đăng nhập !");
            }
            else if (user.MatKhau != nd.Password)
            {
                ModelState.AddModelError("", "Sai mật khẩu !");
            }
            else
            {
                Session["user"] = user;
                //ModelState.AddModelError("", "Đăng nhập thành công !");
                return RedirectToAction("Index", "Home");

            }
            // Quay trở lại trang được yêu cầu trước đó

            return View();
        }
        public ActionResult Logoff()
        {
            Session.Remove("user");
            return RedirectToAction("Login", "Account");
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(NguoiDung model)
        {
            //var f = Request.Files["upPhoto"];
            //f.SaveAs(Server.MapPath("~/images/customers/" + f.FileName));
            try
            {
                model.VaiTro = "Khách hàng";
                db.NguoiDungs.Add(model);
                db.SaveChanges();
                //ModelState.AddModelError("", "Đăng ký thành công. Vui lòng nhận email và kích hoạt tài khoản !");

                //var url = Request.Url.AbsoluteUri.Replace("Register", "") + "Activate/" + model.Id.ToBase64();
                //var body = @"Click vào liên kết sau để kích hoạt tài khoản: <a href='" + url + "'>Activate</a>";
                //XMail.Send(model.Email, "Welcome mail", body);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "Đăng ký thất bại !" + ex);
            }
            return RedirectToAction("Login", "Account");
        }


    }
}