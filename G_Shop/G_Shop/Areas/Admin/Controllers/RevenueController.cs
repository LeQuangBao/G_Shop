using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.Models;

namespace G_Shop.Areas.Admin.Controllers
{
    public class RevenueController : Controller
    {
        GShopEntities4 db = new GShopEntities4();
        // GET: Admin/Revenue
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Cathe()
        {
            if(Session["Admin"]==null)
            {
                return RedirectToAction("Login", "AdminHome");
            }
            return View();
        }
        public ActionResult Loai()
        {

            if (Session["Admin"] == null)
            {
                return RedirectToAction("Login", "AdminHome");
            }
            return View();
        }
        public ActionResult KhachHang()
        {

            if (Session["Admin"] == null)
            {
                return RedirectToAction("Login", "AdminHome");
            }
            return View();
        }

        [HttpPost]
        public ActionResult CaThe(FormCollection form)
        {
            string ngaybd = form["ngaybd"];
            string ngaykt = form["ngaykt"];
            string[] angaybatdau = ngaybd.Split(new Char[] { '-' });
            string[] angaykethuc = ngaykt.Split(new Char[] { '-' });
            string ngaybatdau2 = angaybatdau[2] + "/" + angaybatdau[1] + "/" + angaybatdau[0];
            string ngaykethuc2 = angaykethuc[2] + "/" + angaykethuc[1] + "/" + angaykethuc[0];
            DateTime ngaybd1 = Convert.ToDateTime(ngaybd);
            DateTime ngaykt1 = Convert.ToDateTime(ngaykt);
            var model = db.ChiTietHoaDons.
                Where(p => p.HoaDon.NgayMua >= ngaybd1 && p.HoaDon.NgayMua <= ngaykt1).
                GroupBy(p => p.CaThe)
                .Select(g => new ReportInfo
                {
                    Group = g.Key.TenCaThe,
                    Count = g.Sum(p => p.MaCaThe),
                    Total = g.Sum(p => p.CaThe.GiaBan*1),
                    MinPrice = g.Min(p => p.CaThe.GiaBan),
                    MaxPrice = g.Max(p => p.CaThe.GiaBan),
                    AvgPrice = g.Average(p => p.CaThe.GiaBan)
                });
            ViewBag.ngaybd = ngaybatdau2;
            ViewBag.ngaykt = ngaykethuc2;
            ViewBag.Group = "Cá thể";
            return View("Index", model);
        }
        [HttpPost]
        public ActionResult Loai(FormCollection form)
        {
            string ngaybd = form["ngaybd"];
            string ngaykt = form["ngaykt"];
            string[] angaybatdau = ngaybd.Split(new Char[] { '-' });
            string[] angaykethuc = ngaykt.Split(new Char[] { '-' });
            string ngaybatdau2 = angaybatdau[2] + "/" + angaybatdau[1] + "/" + angaybatdau[0];
            string ngaykethuc2 = angaykethuc[2] + "/" + angaykethuc[1] + "/" + angaykethuc[0];
            DateTime ngaybd1 = Convert.ToDateTime(ngaybd);
            DateTime ngaykt1 = Convert.ToDateTime(ngaykt);
            var model = db.ChiTietHoaDons.
                Where(p => p.HoaDon.NgayMua >=ngaybd1 && p.HoaDon.NgayMua <= ngaykt1).
                GroupBy(p => p.CaThe.Loai)
                .Select(g => new ReportInfo
                {
                    Group = g.Key.TenLoai,
                    Count = g.Sum(p => p.CaThe.Loai.MaLoai),
                    Total = g.Sum(p => p.CaThe.GiaBan * 1),
                    MinPrice = g.Min(p => p.CaThe.GiaBan),
                    MaxPrice = g.Max(p => p.CaThe.GiaBan),
                    AvgPrice = g.Average(p => p.CaThe.GiaBan)
                });
            ViewBag.ngaybd = ngaybatdau2;
            ViewBag.ngaykt = ngaykethuc2;
            ViewBag.Group = "Loài";
            return View("Index", model);
        }
        [HttpPost]
        public ActionResult KhachHang(FormCollection form)
        {
            string ngaybd = form["ngaybd"];
            string ngaykt = form["ngaykt"];
            string[] angaybatdau = ngaybd.Split(new Char[] { '-' });
            string[] angaykethuc = ngaykt.Split(new Char[] { '-' });
            string ngaybatdau2 = angaybatdau[2] + "/" + angaybatdau[1] + "/" + angaybatdau[0];
            string ngaykethuc2 = angaykethuc[2] + "/" + angaykethuc[1] + "/" + angaykethuc[0];
            DateTime ngaybd1 = Convert.ToDateTime(ngaybd);
            DateTime ngaykt1 = Convert.ToDateTime(ngaykt);
            var model = db.ChiTietHoaDons.
                Where(p => p.HoaDon.NgayMua >=ngaybd1 && p.HoaDon.NgayMua <=ngaykt1).
                GroupBy(p => p.HoaDon.NguoiDung)
                .Select(g => new ReportInfo
                {
                    Group = g.Key.TenNguoiDung,
                    Count = g.Sum(p => p.MaHoaDon),
                    Total = g.Sum(p => p.HoaDon.TongTien),
                    MinPrice = g.Min(p => p.HoaDon.TongTien),
                    MaxPrice = g.Max(p => p.HoaDon.TongTien),
                    AvgPrice = g.Average(p => p.HoaDon.TongTien)
                });
            ViewBag.ngaybd = ngaybatdau2;
            ViewBag.ngaykt = ngaykethuc2;
            ViewBag.Group = "Khách hàng";
            return View("Index", model);
        }

    }
}