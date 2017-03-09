﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.Models;
using PagedList;

namespace G_Shop.Areas.Admin.Controllers
{
    public class LoaiController : Controller
    {
        GShopEntities db = new GShopEntities();
        // GET: Admin/Loai
        public IPagedList<Loai> ListAllPageging4(int page, int pagesize)
        {
            //var model = new UserDAO().GetNewCaThe().ToPagedList(page,pagesize);
            //return model;
            return db.Loais.OrderByDescending(x => x.MaLoai).ToPagedList(page, pagesize);
        }
        public ActionResult Index(int page = 1, int pagesize = 5)
        {
            var model = ListAllPageging4(page, pagesize);
            return View(model);
        }
        [HttpPost]
        public JsonResult themloai(string tenloai, string mota)
        {
            try
            {
                var loai = new Loai();
                loai.TenLoai = tenloai;
                loai.MoTa = mota;
                db.Loais.Add(loai);
                db.SaveChanges();
                return Json("ok",JsonRequestBehavior.AllowGet);

            }
            catch
            {
                return Json("error", JsonRequestBehavior.AllowGet);
            }
        }
        public JsonResult edit(int maloai)
        {
            var list = db.Loais.Find(maloai);
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult capnhat(int maloai,string tenloai, string mota)
        {
            try
            {
                var model = db.Loais.Find(maloai);
                model.TenLoai = tenloai;
                model.MoTa = mota;
                db.SaveChanges();
                return Json("ok", JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json("error", JsonRequestBehavior.AllowGet);
            }
        }
     
        [HttpPost]
        public ActionResult timkiemloai(FormCollection f, int? page)
        {
            //if (SessionHandler.User != null)
            //{
            //    var user = SessionHandler.User;
            //}
            //else
            //{
            //    return RedirectToAction("Login", "Account");
            //}
            string tukhoa = f["txttimkiem"].ToString();
            ViewBag.tukhoa = tukhoa;
            List<Loai> listloai = db.Loais.Where(n => n.TenLoai.Contains(tukhoa)).ToList();
            // phân trang
            int pagenumber = (page ?? 1);
            int pagesize = 10;
            //if (listnguoidung.Count == 0)
            //{
            //    ViewBag.ThongBao = "Không tìm thấy bản ghi phù hợp";
            return View(listloai.OrderBy(n => n.MaLoai).ToPagedList(pagenumber, pagesize));
            //}
            //ViewBag.ThongBao = "Đã tìm thấy" + "    " + listnguoidung.Count + "kết quả";
            //return View(listnguoidung.OrderBy(n => n.MaNguoiDung).ToPagedList(pagenumber, pagesize));
        }
        [HttpGet]
        public ActionResult timkiemloai(string tukhoa, int? page)
        {
            //if (SessionHandler.User != null)
            //{
            //    var user = SessionHandler.User;
            //}
            //else
            //{
            //    return RedirectToAction("Login", "Account");
            //}
            string tukhoa1 = tukhoa;
            ViewBag.tukhoa = tukhoa1;
            List<Loai> listloai = db.Loais.Where(n => n.TenLoai.Contains(tukhoa)).ToList();
            // phân trang
            int pagenumber = (page ?? 1);
            int pagesize = 10;
            //ViewBag.ThongBao = "Đã tìm thấy" + listnguoidung.Count + "kết quả";
            return View(listloai.OrderBy(n => n.MaLoai).ToPagedList(pagenumber, pagesize));
        }

      
    }
}