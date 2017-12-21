using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.Models;
using PagedList.Mvc;
using PagedList;

namespace G_Shop.Areas.Admin.Controllers {
    public class UserController : Controller {
        GShopEntities2 db = new GShopEntities2();
        // GET: Admin/User
        protected override void Dispose(bool disposing) {
            db.Dispose();
            base.Dispose(disposing);
        }


        public ActionResult Index(string message = "") {
            var list = db.NguoiDungs.ToList();
            ViewBag.tongso = list.Count;
            ViewBag.Message = message;
            return View();

        }
        [HttpGet]
        public JsonResult Get_nguoidung() {
            var list = (from n in db.NguoiDungs
                        select new NguoiDungDTO {
                            MaNguoiDung = n.MaNguoiDung,
                            TenNguoiDung = n.TenNguoiDung,
                            DiaChi = n.DiaChi,
                            TenDangNhap = n.TenDangNhap,
                            SoDienThoai = n.SoDienThoai,
                            MatKhau = n.MatKhau,
                            Email = n.Email,
                            VaiTro = n.VaiTro,
                            GioiTinh = n.GioiTinh,
                            NgaySinh = n.NgaySinh

                        }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        //[HttpPost]
        public JsonResult Loc_nguoidung(string i) {
            List<NguoiDungDTO> list = new List<NguoiDungDTO>();
            string vai_tro = null;
            if(i == null || i == "0") {
                list = (from n in db.NguoiDungs
                        select new NguoiDungDTO {
                            MaNguoiDung = n.MaNguoiDung,
                            TenNguoiDung = n.TenNguoiDung,
                            DiaChi = n.DiaChi,
                            TenDangNhap = n.TenDangNhap,
                            SoDienThoai = n.SoDienThoai,
                            MatKhau = n.MatKhau,
                            Email = n.Email,
                            VaiTro = n.VaiTro,
                            GioiTinh = n.GioiTinh,
                            NgaySinh = n.NgaySinh

                        }).ToList();
            } else {
                if(i == "1")
                    vai_tro = "Quản trị viên";
                if(i == "2")
                    vai_tro = "Khách hàng";
                list = (from n in db.NguoiDungs
                        where n.VaiTro == vai_tro
                        select new NguoiDungDTO {
                            MaNguoiDung = n.MaNguoiDung,
                            TenNguoiDung = n.TenNguoiDung,
                            DiaChi = n.DiaChi,
                            TenDangNhap = n.TenDangNhap,
                            SoDienThoai = n.SoDienThoai,
                            MatKhau = n.MatKhau,
                            Email = n.Email,
                            VaiTro = n.VaiTro,
                            GioiTinh = n.GioiTinh,
                            NgaySinh = n.NgaySinh

                        }).ToList();
            }
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult capnhat(NguoiDungDTO model) {


            NguoiDung nd = db.NguoiDungs.Find(model.MaNguoiDung);
            //nd.TenDangNhap = model.TenDangNhap;
            nd.MatKhau = model.MatKhau;
            nd.TenNguoiDung = model.TenNguoiDung;
            nd.DiaChi = model.DiaChi;
            nd.Email = model.Email;
            nd.SoDienThoai = model.SoDienThoai;
            nd.GioiTinh = model.GioiTinh;
            //nd.NgaySinh = model.NgaySinh;
            nd.VaiTro = model.VaiTro;
            db.SaveChanges();
            return Json("ok", JsonRequestBehavior.AllowGet);

        }
        [HttpPost]
        public JsonResult themnguoidung(string tendangnhap, string diachi, string tennguoidung, string sodienthoai, string matkhau, string gioitinh, string ngaysinh, string email, string vaitro) {
            // try
            // {
            NguoiDung nd = new NguoiDung();
            nd.Email = email;
            nd.DiaChi = diachi;
            nd.TenNguoiDung = tennguoidung;
            nd.MatKhau = matkhau;
            nd.TenDangNhap = tendangnhap;
            nd.SoDienThoai = sodienthoai;
            nd.VaiTro = vaitro;
            nd.NgaySinh = Convert.ToDateTime(ngaysinh);
            nd.GioiTinh = gioitinh;
            db.NguoiDungs.Add(nd);
            db.SaveChanges();
            return Json("ok");
            // }
            // catch
            // {
            //  return Json("error");
            //}
        }

    }
}