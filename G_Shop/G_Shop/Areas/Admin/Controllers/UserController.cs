using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.Models;

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

        public ActionResult Index()
        {
            //if (Session["Admin"] == null)
            //    return RedirectToAction("Login", "/AdminHome");
            //else
            //{
                var model = new NguoiDung();
                return View("Index", model);
            //}
        }
        public ActionResult LoadPage(int PageNo = 0, int PageSize = 10)
        {
            var model = db.NguoiDungs
                .OrderBy(c => c.MaNguoiDung)
                .Skip(PageNo * PageSize)
                .Take(PageSize).ToList();
            return PartialView("_PartialPage1", model);
        }
        public ActionResult PageCount(int PageSize = 10)
        {
            int pageCount = (int)Math.Ceiling(1.0 * db.NguoiDungs.Count() / PageSize);
            return Content(pageCount.ToString());
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
                int vaitro = Convert.ToInt32(Request.Form["vaitro"]);
                NguoiDung nd = new NguoiDung();
                nd.TenDangNhap = model.TenDangNhap;
                nd.MatKhau = model.MatKhau;
                nd.Email = model.Email;
                nd.SoDienThoai = model.SoDienThoai;
                nd.VaiTro = vaitro;
                db.SaveChanges();
                ModelState.AddModelError("", "Sửa thành công");
            }
            catch
            {
                ModelState.AddModelError("", "Sửa thất bại");
            }
                return View("suanguoidung",model);
            
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
                nd.VaiTro = Convert.ToInt32(vaitro);
                db.NguoiDungs.Add(nd);
                db.SaveChanges();
                return Json("ok");
            }
            catch
            {
                return Json("error");
            }
        }
        public ActionResult LoadPage1(string keyword,int PageNo = 1, int PageSize = 10)
        {
            var model = db.NguoiDungs
                .Where(n=>n.TenDangNhap.Contains(keyword)||n.Email.Contains(keyword)||n.SoDienThoai.Contains(keyword))
                .OrderBy(c => c.MaNguoiDung)
                .Skip(PageNo * PageSize)
                .Take(PageSize).ToList();
            return PartialView("_PartialPage1", model);
        }
        public ActionResult PageCount1(string keyword, int PageSize = 10)
        {
            var model = (from d in db.NguoiDungs
                         .Where(n => n.TenDangNhap.Contains(keyword) || n.Email.Contains(keyword) || n.SoDienThoai.Contains(keyword))
                         select new NguoiDungDTO
                         {
                             TenDangNhap=d.TenDangNhap,
                             MatKhau = d.MatKhau,
                             Email = d.Email,
                             SoDienThoai=d.SoDienThoai,
                             VaiTro=d.VaiTro
                         }).ToList();
            int pageCount = (int)Math.Ceiling(1.0 * model.Count() / PageSize);
            return Content(pageCount.ToString());
        }
    }
}