using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VT_Shop.Models;
using VT_Shop.DAO;
using System.Globalization;

namespace VT_Shop.Controllers {
    public class OrderController : Controller {
        VTShopEntities db = new VTShopEntities();
        // GET: Order

        public ActionResult Checkout() {
            if(Session["user"] == null) {
                return RedirectToAction("Login", "Account");
            } else {
                int? tongtien = 0;
                var user = Session["user"] as User;
                foreach(var p in ShoppingCart.Cart.Items) {
                    tongtien = tongtien + p.GiaBan;
                }
                var model = new HoaDon();
                model.TongTien = tongtien;
                model.NgayMua = DateTime.Now;
                model.UserId = user.UserId;
                model.User = user;
                model.DiaChi = user.DiaChi;
                ViewBag.Ten = user.UserName;
                return View(model);
            }

        }

        [HttpPost]
        public ActionResult Checkout(HoaDon order, FormCollection form) {
            order.TinhTrang = "Mới đặt hàng";
            order.GioGiaoHang = Request.Form["gioGiaoHang"] + ":" + Request.Form["phutGiaoHang"] + " " + Request.Form["buoiGiaoHang"];
            CultureInfo provider = CultureInfo.InvariantCulture;
            string format = "dd/MM/yyyy";
            order.NgayGiaoHang = DateTime.ParseExact(Request.Form["ngayGiaoHang"], format, provider);
            //order.NgayGiaoHang = Convert.ToDateTime(form["ngaygiaohang"], );
            db.HoaDons.Add(order); // insert order
            UserDAO userDAO = new UserDAO();
            foreach(var p in ShoppingCart.Cart.Items) {
                var detail = new ChiTietHoaDon {
                    HoaDon = order,
                    TreeId = p.TreeId,
                };
                userDAO.BanTree(p.TreeId);
                db.ChiTietHoaDons.Add(detail); // insert orderdetail
            }
            db.SaveChanges();

            ShoppingCart.Cart.Clear();
            return RedirectToAction("Detail", "Order", new { id = order.HoaDonId });
            //return RedirectToAction("List", "Order");
        }

        public ActionResult List() {
            if(Session["user"] == null) {
                return RedirectToAction("Login", "Account");
            } else {
                var user = Session["user"] as User;
                var model = (from n in db.HoaDons
                             where n.UserId.Equals(user.UserId)
                             select new HoaDonDTO {
                                 HoaDonId = n.HoaDonId,
                                 UserId = n.UserId,
                                 NgayMua = n.NgayMua,
                                 TongTien = n.TongTien,
                                 User = n.User

                             }).ToList();

                ViewBag.Ten = user.UserName;
                return View(model);
            }

        }

        public ActionResult Detail(int Id) {
            if(Session["user"] == null) {
                return RedirectToAction("Login", "Account");
            } else {
                var user = Session["user"] as User;
                ViewBag.Ten = user.UserName;
                var model = db.HoaDons.Find(Id);
                return View(model);
            }

        }

        //public ActionResult Items()
        //{
        //    var user = Session["user"] as User;
        //    var model = db.ChiTietHoaDons
        //        .Where(d => d.HoaDon.UserId == user.UserId)
        //        .Select(d => d.Tree)
        //        .Distinct().ToList();
        //    return View("../Product/List", model);
        //}
    }
}