using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VT_Shop.Models;
using PagedList.Mvc;
using PagedList;

namespace VT_Shop.Areas.Admin.Controllers {
    public class UserController : Controller {
        VTShopEntities db = new VTShopEntities();
        // GET: Admin/User
        protected override void Dispose(bool disposing) {
            db.Dispose();
            base.Dispose(disposing);
        }


        public ActionResult Index(string message = "") {
            var list = db.Users.ToList();
            ViewBag.tongso = list.Count;
            ViewBag.Message = message;
            return View();

        }
        [HttpGet]
        public JsonResult Get_User() {
            var list = (from n in db.Users
                        select new UserDTO {
                            UserId = n.UserId,
                            Ten = n.Ten,
                            DiaChi = n.DiaChi,
                            UserName = n.UserName,
                            SoDienThoai = n.SoDienThoai,
                            Password = n.Password,
                            Email = n.Email,
                            VaiTro = n.VaiTro,
                            GioiTinh = n.GioiTinh,
                            NgaySinh = n.NgaySinh

                        }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        //[HttpPost]
        public JsonResult Loc_User(string i) {
            List<UserDTO> list = new List<UserDTO>();
            string vai_tro = null;
            if(i == null || i == "0") {
                list = (from n in db.Users
                        select new UserDTO {
                            UserId = n.UserId,
                            Ten = n.Ten,
                            DiaChi = n.DiaChi,
                            UserName = n.UserName,
                            SoDienThoai = n.SoDienThoai,
                            Password = n.Password,
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
                list = (from n in db.Users
                        where n.VaiTro == vai_tro
                        select new UserDTO {
                            UserId = n.UserId,
                            Ten = n.Ten,
                            DiaChi = n.DiaChi,
                            UserName = n.UserName,
                            SoDienThoai = n.SoDienThoai,
                            Password = n.Password,
                            Email = n.Email,
                            VaiTro = n.VaiTro,
                            GioiTinh = n.GioiTinh,
                            NgaySinh = n.NgaySinh

                        }).ToList();
            }
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult capnhat(UserDTO model) {


            User nd = db.Users.Find(model.UserId);
            //nd.UserName = model.UserName;
            nd.Password = model.Password;
            nd.Ten = model.Ten;
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
        public JsonResult themUser(string UserName, string diachi, string Ten, string sodienthoai, string Password, string gioitinh, string ngaysinh, string email, string vaitro) {
            // try
            // {
            User nd = new User();
            nd.Email = email;
            nd.DiaChi = diachi;
            nd.Ten = Ten;
            nd.Password = Password;
            nd.UserName = UserName;
            nd.SoDienThoai = sodienthoai;
            nd.VaiTro = vaitro;
            nd.NgaySinh = Convert.ToDateTime(ngaysinh);
            nd.GioiTinh = gioitinh;
            db.Users.Add(nd);
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