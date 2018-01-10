using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.Models;
using System.Globalization;

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
        public JsonResult Add(int Id)
        {
            ShoppingCart.Cart.Add(Id, 4);
            return Json("ok", JsonRequestBehavior.AllowGet);
        }

        public ActionResult Remove(int Id)
        {
            ShoppingCart.Cart.Remove(Id);
            int? tongtien = ShoppingCart.Cart.Amount;
            string tong = tongtien.Value.ToString("C", CultureInfo.CurrentCulture);
            return Json(new { tong = tong }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Clear()
        {
            ShoppingCart.Cart.Clear();
            return View("Index");
        }

    }
}