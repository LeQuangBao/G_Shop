using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.DAO;
using G_Shop.Models;
using PagedList;
using PagedList.Mvc;
namespace G_Shop.Controllers
{
    public class HomeController : Controller
    {
        GShopEntities1 db = new GShopEntities1();
        public IEnumerable<CaThe> ListAllPageging1(int page, int pagesize)
        {
            //var model = new UserDAO().GetNewCaThe().ToPagedList(page,pagesize);
            //return model;
            return db.CaThes.OrderByDescending(x => x.MaCaThe).ToPagedList(page, pagesize);
        }
        public ActionResult Index(int page = 1, int pagesize = 3)
        {
            var model = ListAllPageging1(page, pagesize);
            //var model = new UserDAO().GetNewCaThe();
            return View(model);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult _Category()
        {
            var model = new UserDAO().GetAllTenLoai();
            return PartialView(model);
        }
        [HttpGet]
        public ActionResult ThuCung(int MaLoai,int? page)
        {
            List<CaThe> listcathe = db.CaThes.Where(n => n.MaLoai.Equals(MaLoai)).ToList();
            // phân trang
            int pagenumber = (page ?? 1);
            int pagesize = 10;
            //if (listcathe.Count == 0)
            //{
            //    ViewBag.ThongBao = "Không tìm thấy bản ghi phù hợp";
            //    return View(_db.UnitPrices.OrderBy(n => n.Name).ToPagedList(pagenumber, pagesize));
            //}
            ViewBag.ThongBao = "Đã tìm thấy" + listcathe.Count + "kết quả";
            ViewBag.MaLoai = MaLoai;
            //var model = new UserDAO().GetNewCaThe();

            //var model = new UserDAO().GetAllCaThe_MaLoai(MaLoai);
            ViewBag.TenLoai = new UserDAO().GetTenLoai_MaLoai(MaLoai);
            return View(listcathe.OrderBy(n => n.MaCaThe).ToPagedList(pagenumber, pagesize));
        }
        public ActionResult ChiTiet(int MaLoai, int MaCaThe)
        {
            var model = new UserDAO().GetCaThe_MaLoai_MaCaThe(MaLoai,MaCaThe);
            return View(model);
        }
        
        public ActionResult Tim(string ten)
        {
            var model = new UserDAO().TimCaThe(ten);
            return View(model);
        }

    }
}