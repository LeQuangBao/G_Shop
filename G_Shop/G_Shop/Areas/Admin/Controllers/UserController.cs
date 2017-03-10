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
        GShopEntities1 db = new GShopEntities1();
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
        public JsonResult sua(int ma)
        {
            var model = db.NguoiDungs.Find(ma);
            return Json(model, JsonRequestBehavior.AllowGet);

        }
        [HttpPost]
        public JsonResult capnhat(string tendangnhap, string matkhau, string email, string sodienthoai, string vaitro, string ngaysinh, string gioitinh,int ma)
        {
            try
            {
             
                NguoiDung nd = db.NguoiDungs.Find(ma);
                nd.TenDangNhap = tendangnhap;
                nd.MatKhau = matkhau;
                nd.Email = email;
                nd.SoDienThoai = sodienthoai;
                nd.GioiTinh = gioitinh;
                nd.NgaySinh = DateTime.Parse(ngaysinh);
                nd.VaiTro = vaitro;
                db.SaveChanges();
                return Json("ok", JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json("error", JsonRequestBehavior.AllowGet);
            }
               
            //return View("Index", model);
        }
        [HttpPost]
        public JsonResult themnguoidung(string tendangnhap, string matkhau, string email, string sodienthoai, string vaitro,string ngaysinh, string gioitinh)
        {
            try
            {
                NguoiDung nd = new NguoiDung();
                nd.Email = email;
                nd.MatKhau = matkhau;
                nd.TenDangNhap = tendangnhap;
                nd.SoDienThoai = sodienthoai;
                nd.VaiTro = vaitro;
                nd.NgaySinh = Convert.ToDateTime(ngaysinh);
                nd.GioiTinh = gioitinh;
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