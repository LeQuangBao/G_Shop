﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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
            //var admin = Session["Admin"] as TMDT.Account;
            //if (admin != null)
            //    return RedirectToAction("Index", "Admin");
            return View();
        }

        public ActionResult Logout()
        {
            Session.Remove("Admin");
            return RedirectToAction("Login");
        }

        //[HttpPost]
        //public ActionResult Login(string username, string pass)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var dao = new AccountDAO();
        //        int result = dao.Login(username, pass);
        //        if (result == 1)
        //        {
        //            var admin = dao.GetUser(username);
        //            if (admin.Level == 0)
        //            {
        //                Session["Admin"] = admin;
        //                return RedirectToAction("Users");
        //            }
        //            else
        //            {
        //                ModelState.AddModelError("", "Bạn không có quyền truy cập!");
        //            }
        //        }
        //        else
        //            ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không đúng. Vui lòng đăng nhập lại!");
        //    }
        //    return View();
        //}
    }
}