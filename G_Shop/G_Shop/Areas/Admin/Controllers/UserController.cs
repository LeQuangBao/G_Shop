using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.Models;
using PagedList.Mvc;
using PagedList;

namespace G_Shop.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        GShopEntities3 db = new GShopEntities3();
        // GET: Admin/User
        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
        public IPagedList<NguoiDung> ListAllPageging4(int page, int pagesize) {
            //var model = new UserDAO().GetNewCaThe().ToPagedList(page,pagesize);
            //return model;
            return db.NguoiDungs.OrderByDescending(x=>x.MaNguoiDung).ToPagedList(page, pagesize);
        }
        [HttpPost]
        public ActionResult timkiemnguoidung(FormCollection f, int? page)
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
            List<NguoiDung> listnguoidung = db.NguoiDungs.Where(n => n.TenDangNhap.Contains(tukhoa)).ToList();
            // phân trang
            int pagenumber = (page ?? 1);
            int pagesize = 10;
            //if (listnguoidung.Count == 0)
            //{
            //    ViewBag.ThongBao = "Không tìm thấy bản ghi phù hợp";
                return View(listnguoidung.OrderBy(n => n.MaNguoiDung).ToPagedList(pagenumber, pagesize));
            //}
            //ViewBag.ThongBao = "Đã tìm thấy" + "    " + listnguoidung.Count + "kết quả";
            //return View(listnguoidung.OrderBy(n => n.MaNguoiDung).ToPagedList(pagenumber, pagesize));
        }
        [HttpGet]
        public ActionResult timkiemnguoidung(string tukhoa, int? page)
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
            List<NguoiDung> listnguoidung = db.NguoiDungs.Where(n => n.TenDangNhap.Contains(tukhoa)).ToList();
            // phân trang
            int pagenumber = (page ?? 1);
            int pagesize = 10;
            //ViewBag.ThongBao = "Đã tìm thấy" + listnguoidung.Count + "kết quả";
            return View(listnguoidung.OrderBy(n => n.MaNguoiDung).ToPagedList(pagenumber, pagesize));
        }

        public ActionResult Index(int page = 1, int pagesize = 5)
        {
            //var user = Session["Admin"] as NguoiDung;
            //if(user==null)
            //{
            //    return RedirectToAction("Login", "AdminHome");
            //}
            //else
            //{
                //ViewBag.tennguoidung = user.TenDangNhap;
                var model = ListAllPageging4(page, pagesize);
                return View(model);
           // }
        }
        public ActionResult suanguoidung(int id)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Login","/AdminHome");
            else
            {
                var model = db.NguoiDungs.Find(id);
                return View(model);
            }

        }
        [HttpPost]
        public ActionResult suanguoidung(NguoiDung model)
        {
            try
            {
                string vaitro = Request.Form["vaitro"];
                string gioiTinh = Request.Form["gioitinh"];
                NguoiDung nd = new NguoiDung();
                nd.TenDangNhap = model.TenDangNhap;
                nd.MatKhau = model.MatKhau;
                nd.Email = model.Email;
                nd.SoDienThoai = model.SoDienThoai;
                nd.GioiTinh = gioiTinh;
                nd.NgaySinh = model.NgaySinh;
                nd.VaiTro = vaitro;
                db.SaveChanges();
                ModelState.AddModelError("", "Sửa thành công");
            }
            catch
            {
                ModelState.AddModelError("", "Sửa thất bại");
                return View("suanguoidung",model);
            }
            return View("Admin/User", model);
        }
        [HttpPost]
        public JsonResult themnguoidung(string tendangnhap, string matkhau, string email, string sodienthoai, string vaitro)
        {
            try
            {
                NguoiDung nd = new NguoiDung();
                nd.Email = email;
                nd.MatKhau = matkhau;
                nd.TenDangNhap = tendangnhap;
                nd.SoDienThoai = sodienthoai;
                nd.VaiTro = vaitro;
                db.NguoiDungs.Add(nd);
                db.SaveChanges();
                return Json("ok");
            }
            catch
            {
                return Json("error");
            }
        }
     
    }
}