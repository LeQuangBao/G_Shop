﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.Models;

namespace G_Shop.Controllers
{
    public class CartController : Controller
    {
        GShopEntities1 db = new GShopEntities1();
        // GET: Cart
        public ActionResult Index()
        {
            if (Session["user"] == null)
            {
                return RedirectToAction("Login", "Account");
            }
            var user = Session["user"] as NguoiDung;
            ViewBag.tennguoidung = user.TenDangNhap;
            return View();
        }
        public ActionResult Add(int Id)
        {
            ShoppingCart.Cart.Add(Id, 1);
            return Json("", JsonRequestBehavior.AllowGet);
        }

        public ActionResult Remove(int Id)
        {
            ShoppingCart.Cart.Remove(Id);
            return Json("", JsonRequestBehavior.AllowGet);
        }

        public ActionResult Clear()
        {
            ShoppingCart.Cart.Clear();
            return View("Index");
        }

        //public ActionResult Update()
        //{
        //    foreach (var p in ShoppingCart.Cart.Items)
        //    {
        //        String txtName = p.Id.ToString();
        //        int newQty = int.Parse(Request[txtName]);
        //        p.Quantity = newQty;
        //    }
        //    return View("Index");
        //}
    }
}