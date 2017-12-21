using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VT_Shop.DAO;
using VT_Shop.Models;
using PagedList;
using PagedList.Mvc;
namespace VT_Shop.Controllers {
    public class HomeController : Controller {
        VTShopEntities db = new VTShopEntities();
        public IEnumerable<Cay> ListAllPageging4(int page, int pagesize) {
            return db.Cays.Where(x => x.TinhTrang == "Sẵn bán").OrderByDescending(x => x.MaCay).ToPagedList(page, pagesize);
        }

        public ActionResult Index(int page = 1, int pagesize = 3) {
            var user = Session["user"] as NguoiDung;
            if(user != null)
                ViewBag.tennguoidung = user.TenDangNhap;
            var model = ListAllPageging4(page, pagesize);
            return View(model);
        }
        public IEnumerable<Cay> ListAllPageging(int MaLoai, int page, int pagesize) {
            return db.Cays.Where(n => n.MaLoai.Equals(MaLoai)).OrderByDescending(x => x.MaCay).ToPagedList(page, pagesize);
        }
        public ActionResult About() {
            ViewBag.Message = "Your application description page.";
            return View();
        }

        public ActionResult Contact() {
            ViewBag.Message = "Your contact page.";
            return View();
        }
        public ActionResult _Category() {
            var model = new UserDAO().GetAllTenLoai();
            return PartialView(model);
        }
        public ActionResult ThuCung(int MaLoai, int page = 1, int pagesize = 6) {
            var user = Session["user"] as NguoiDung;
            if(user != null)
                ViewBag.tennguoidung = user.TenDangNhap;
            var model = ListAllPageging(MaLoai, page, pagesize);
            ViewBag.TenLoai = new UserDAO().GetTenLoai_MaLoai(MaLoai);
            ViewBag.MaLoai = MaLoai;
            return View(model);
        }
        [HttpGet]
        public ActionResult ChiTiet(int MaLoai, int MaCay) {
            var user = Session["user"] as NguoiDung;
            if(user != null)
                ViewBag.tennguoidung = user.TenDangNhap;
            var model = new UserDAO().GetCay_MaLoai_MaCay(MaLoai, MaCay);
            return View(model);
        }

        public ActionResult Tim(string ten) {
            var user = Session["user"] as NguoiDung;
            if(user != null)
                ViewBag.tennguoidung = user.TenDangNhap;
            var model = new UserDAO().TimCay(ten);
            return View(model);
        }
    }
}