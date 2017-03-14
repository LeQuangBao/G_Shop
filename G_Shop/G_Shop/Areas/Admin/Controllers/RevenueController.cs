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
        GShopEntities1 db = new GShopEntities1();
        // GET: Admin/Revenue
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ByCathe()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ByCaThe(string ngaybd, string ngaykt)
        {
            var model = db.ChiTietHoaDons.
                Where(p=>p.HoaDon.NgayMua>=Convert.ToDateTime(ngaybd)&&p.HoaDon.NgayMua<=Convert.ToDateTime(ngaykt)).
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
            ViewBag.Group = "Cá thể";
            return View("Index", model);
        }

        public ActionResult ByCategory(string ngaybd, string ngaykt)
        {
            var model = db.ChiTietHoaDons.
                Where(p => p.HoaDon.NgayMua >= Convert.ToDateTime(ngaybd) && p.HoaDon.NgayMua <= Convert.ToDateTime(ngaykt)).
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
            ViewBag.Group = "Loài";
            return View("Index", model);
        }


        public ActionResult ByCustomer(string ngaybd, string ngaykt)
        {
            var model = db.ChiTietHoaDons.
                Where(p => p.HoaDon.NgayMua >= Convert.ToDateTime(ngaybd) && p.HoaDon.NgayMua <= Convert.ToDateTime(ngaykt)).
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
            ViewBag.Group = "Khách hàng";
            return View("Revenue", model);
        }

    }
}