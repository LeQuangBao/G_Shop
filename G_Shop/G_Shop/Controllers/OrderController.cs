using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.Models;

namespace G_Shop.Controllers
{
    public class OrderController : Controller
    {
        GShopEntities1 db = new GShopEntities1();
        // GET: Order

        public ActionResult Checkout()
        {
            if(Session["user"]==null)
            {
                return RedirectToAction("Login", "Account");
            }
          else  {
                int tongtien = 0;
                var user = Session["user"] as NguoiDung;
                foreach (var p in ShoppingCart.Cart.Items)
                {
                    tongtien = tongtien + p.Gia;
                }
                var model = new HoaDon();
                model.TongTien = tongtien;
                model.NgayMua = DateTime.Now;
                model.MaNguoiDung = user.MaNguoiDung;
                ViewBag.tennguoidung = user.TenDangNhap;
                return View(model);
            }
        
        }

        [HttpPost]
        public ActionResult Checkout(HoaDon order)
        {
            try
            {
                db.HoaDons.Add(order); // insert order
                foreach (var p in ShoppingCart.Cart.Items)
                {
                    var detail = new ChiTietHoaDon
                    {
                        HoaDon = order,
                        MaCaThe = p.MaCaThe,
                    };
                    db.ChiTietHoaDons.Add(detail); // insert orderdetail
                }
                db.SaveChanges();

                ShoppingCart.Cart.Clear();

                return RedirectToAction("List", "Order");
            }
            catch
            {
                ModelState.AddModelError("", "Lỗi đặt hàng !");
                return View(order);
            }
        }

        public ActionResult List()
        {
            if (Session["user"] == null)
            {
                return RedirectToAction("Login", "Account");
            }
            else {
                var user = Session["user"] as NguoiDung;
                var model = (from n in db.HoaDons
                             where n.MaNguoiDung.Equals(user.MaNguoiDung)
                             select new HoaDonDTO
                             {
                                 MaHoaDon=n.MaHoaDon,
                                 MaNguoiDung=n.MaNguoiDung,
                                 NgayMua=n.NgayMua,
                                 TongTien=n.TongTien,
                                 NguoiDung=n.NguoiDung
                                 
                             }).ToList();

                ViewBag.tennguoidung = user.TenDangNhap;
                return View(model);
            }
         
        }

        public ActionResult Detail(int Id)
        {
            if(Session["user"]==null)
            {
                return RedirectToAction("Login", "Account");
            }
            else {
                var user = Session["user"] as NguoiDung;
                ViewBag.tennguoidung = user.TenDangNhap;
                var model = db.HoaDons.Find(Id);
                return View(model);
            }
         
        }

        //public ActionResult Items()
        //{
        //    var user = Session["user"] as NguoiDung;
        //    var model = db.ChiTietHoaDons
        //        .Where(d => d.HoaDon.MaNguoiDung == user.MaNguoiDung)
        //        .Select(d => d.CaThe)
        //        .Distinct().ToList();
        //    return View("../Product/List", model);
        //}
    }
}