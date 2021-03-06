﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.DAO;
using G_Shop.Models;
using PagedList;
using PagedList.Mvc;
namespace G_Shop.Controllers {
    public class HomeController : Controller {
        GShopEntities1 db = new GShopEntities1();
        public IEnumerable<CaThe> ListAllPageging4(int page, int pagesize) {
            return db.CaThes.Where(x => x.TinhTrang == "Sẵn bán").OrderByDescending(x => x.MaCaThe).ToPagedList(page, pagesize);
        }

        public ActionResult Index(int page = 1, int pagesize = 3) {
            var user = Session["user"] as NguoiDung;
            if(user != null)
                ViewBag.tennguoidung = user.TenDangNhap;
            var model = ListAllPageging4(page, pagesize);
            return View(model);
        }
        public IEnumerable<CaThe> ListAllPageging(int MaLoai, int page, int pagesize) {
            return db.CaThes.Where(n => n.MaLoai.Equals(MaLoai)).OrderByDescending(x => x.MaCaThe).ToPagedList(page, pagesize);
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
        public ActionResult ChiTiet(int MaLoai, int MaCaThe) {
            var user = Session["user"] as NguoiDung;
            if(user != null)
                ViewBag.tennguoidung = user.TenDangNhap;
            var model = new UserDAO().GetCaThe_MaLoai_MaCaThe(MaLoai, MaCaThe);
            ViewBag.TuoiCaThe = new UserDAO().TuoiCaThe(MaCaThe);
            return View(model);
        }

        public ActionResult Tim(string ten) {
            var user = Session["user"] as NguoiDung;
            if(user != null)
                ViewBag.tennguoidung = user.TenDangNhap;
            var model = new UserDAO().TimCaThe(ten);
            return View(model);
        }
    }
}