using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VT_Shop.Models;
using VT_Shop.DAO;

namespace VT_Shop.Controllers {
    public class AccountController : Controller {
        VTShopEntities db = new VTShopEntities();
        // GET: Account
        public ActionResult Login() {
            var cki = Request.Cookies["user"];
            if(cki != null) {
                ViewBag.Id = cki.Values["Id"];
                ViewBag.Password = cki.Values["Pw"];
            }
            return View();
        }
        [HttpPost]
        public ActionResult Login(ModelLogin nd) {

            var user = db.Users.Where(n => n.UserName.Equals(nd.UserName)).FirstOrDefault();

            if(user == null) {
                ModelState.AddModelError("", "Sai tên đăng nhập !");
            } else if(user.Password != nd.Password) {
                ModelState.AddModelError("", "Sai mật khẩu !");
            } else {
                Session["user"] = user;
                //ModelState.AddModelError("", "Đăng nhập thành công !");
                return RedirectToAction("Index", "Home");

            }
            // Quay trở lại trang được yêu cầu trước đó

            return View();
        }
        public ActionResult Logoff() {
            Session.Remove("user");
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Register() {
            return View();
        }

        [HttpPost]
        public ActionResult Register(User model) {
            model.Email = Request.Form["email"];
            try {
                model.VaiTro = "Khách hàng";
                db.Users.Add(model);
                db.SaveChanges();
                //ModelState.AddModelError("", "Đăng ký thành công. Vui lòng nhận email và kích hoạt tài khoản !");

                //var url = Request.Url.AbsoluteUri.Replace("Register", "") + "Activate/" + model.Id.ToBase64();
                //var body = @"Click vào liên kết sau để kích hoạt tài khoản: <a href='" + url + "'>Activate</a>";
                //XMail.Send(model.Email, "Welcome mail", body);
            } catch(Exception ex) {
                ModelState.AddModelError("", "Đăng ký thất bại !" + ex);
            }
            return RedirectToAction("Login", "Account");
        }
        public ActionResult editprofile() {
            var user = Session["user"] as User;
            ViewBag.Ten = user.UserName;
            var model = db.Users.Find(user.UserId);
            return View(model);
        }
        [HttpPost]
        public ActionResult editprofile(User model) {
            User nd = db.Users.Find(model.UserId);
            nd.Email = model.Email;
            nd.GioiTinh = model.GioiTinh;
            //nd.NgaySinh = model.NgaySinh;
            nd.Ten = model.Ten;
            nd.GioiTinh = model.GioiTinh;
            nd.SoDienThoai = model.SoDienThoai;
            nd.DiaChi = model.DiaChi;
            db.SaveChanges();
            ViewBag.Message = "Sửa thành công.";
            return View(model);
        }
        public ActionResult editPassword(string message = "") {
            var user = Session["user"] as User;
            ViewBag.Ten = user.UserName;
            var model = db.Users.Find(user.UserId);
            ViewBag.message = message;
            return View(model);
        }
        [HttpPost]
        public ActionResult editPassword(User User, string oldPassword, string newPassword) {
            if(new UserDAO().changePassword(User.UserId, oldPassword, newPassword)) {
                return RedirectToAction("editprofile", "Account");
            }
            return RedirectToAction("editpassword", "Account", new { message = "Thông tin không chính xác, vui lòng nhập lại" });
        }
    }
}