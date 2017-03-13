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
                GroupBy(p => p.CaThe.Loai)
                .Select(g => new ReportInfo
                {
                    Group = g.Key.TenLoai,
                    Count = g.Sum(p => p.CaThe.Loai.MaLoai),
                    Total = g.Sum(p => p.CaThe. * p.Quantity),
                    MinPrice = g.Min(p => p.UnitPrice),
                    MaxPrice = g.Max(p => p.UnitPrice),
                    AvgPrice = g.Average(p => p.UnitPrice)
                });
            ViewBag.Group = "Category";
            return View("Revenue", model);
        }

        public ActionResult BySupplier()
        {
            var model = db.OrderDetails.
                GroupBy(p => p.Product.Supplier)
                .Select(g => new ReportInfo
                {
                    Group = g.Key.Name,
                    Count = g.Sum(p => p.Quantity),
                    Total = g.Sum(p => p.UnitPrice * p.Quantity),
                    MinPrice = g.Min(p => p.UnitPrice),
                    MaxPrice = g.Max(p => p.UnitPrice),
                    AvgPrice = g.Average(p => p.UnitPrice)
                });
            ViewBag.Group = "Supplier";
            return View("Revenue", model);
        }

        public ActionResult ByCustomer()
        {
            var model = db.OrderDetails.
                GroupBy(p => p.Order.Customer)
                .Select(g => new ReportInfo
                {
                    Group = g.Key.Fullname,
                    Count = g.Sum(p => p.Quantity),
                    Total = g.Sum(p => p.UnitPrice * p.Quantity),
                    MinPrice = g.Min(p => p.UnitPrice),
                    MaxPrice = g.Max(p => p.UnitPrice),
                    AvgPrice = g.Average(p => p.UnitPrice)
                });
            ViewBag.Group = "Customer";
            return View("Revenue", model);
        }

    }
}