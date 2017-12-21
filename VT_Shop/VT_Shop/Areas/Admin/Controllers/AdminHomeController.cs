using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VT_Shop.Models;
using VT_Shop.Areas.Admin.Models;
using VT_Shop.DAO;
using System.IO;
using System.Globalization;

namespace VT_Shop.Areas.Admin.Controllers {
    public class AdminHomeController : Controller {
        VTShopEntities db = new VTShopEntities();
        public List<HttpPostedFileBase> fileUpload = new List<HttpPostedFileBase>();
        public List<HttpPostedFileBase> fileUpload2 = new List<HttpPostedFileBase>();
        // GET: Admin/Home
        public ActionResult Index() {
            if(Session["Admin"] == null)
                return View("Login");
            return View();
        }

        [HttpGet]
        public ActionResult Login() {
            var admin = Session["Admin"] as NguoiDung;
            if(admin != null)
                return RedirectToAction("Index", "User");
            return View();
        }

        public ActionResult Logout() {
            Session.Remove("Admin");
            return RedirectToAction("Login", "AdminHome");
        }

        [HttpPost]
        public ActionResult Login(LoginModel model) {
            if(ModelState.IsValid) {
                var dao = new UserDAO();
                int result = dao.Login(model.UserName, model.Password);
                if(result == 1) {
                    var admin = dao.GetUser(model.UserName);
                    if(admin.VaiTro == "Quản trị viên") {
                        Session["Admin"] = admin;
                        return RedirectToAction("Index", "User");
                    } else {
                        ModelState.AddModelError("", "Bạn không có quyền truy cập!");
                    }
                } else
                    ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không đúng. Vui lòng đăng nhập lại!");
            }
            return View();
        }

        [ChildActionOnly]
        public ActionResult Navigation() {
            var model = new AdminDAO().GetAllTenLoai();
            return PartialView(model);
        }

        public ActionResult TopMenu() {
            var model = Session["Admin"] as NguoiDung;
            return PartialView(model);

        }

        [HttpGet]
        public ActionResult Cay(int MaLoai, int? i, string message = "") {
            if(Session["Admin"] == null)
                return View("Login");
            else {
                var model = new AdminDAO().GetCay_MaLoai(MaLoai, i);
                ViewBag.TenLoai = new AdminDAO().GetTenLoai_MaLoai(MaLoai);
                ViewBag.MaLoai = MaLoai;
                ViewBag.tinhtrang = i;
                ViewBag.message = message;
                return View(model);
            }
        }

        public ActionResult SaveUploadedFile() {
            bool isSavedSuccessfully = true;
            string fName = "";
            foreach(string fileName in Request.Files) {
                HttpPostedFileBase file = Request.Files[fileName];
                fName = file.FileName;
                var fileName4 = Path.GetFileName(file.FileName);
                if(file != null && file.ContentLength > 0) {
                    if(Session["fileUpload"] == null) {
                        fileUpload.Add(file);
                    } else {
                        fileUpload = (List<HttpPostedFileBase>)Session["fileUpload"];
                        fileUpload.Add(file);
                    }
                }
            }
            Session["fileUpload"] = fileUpload;
            if(isSavedSuccessfully) {
                return Json(new { Message = fName });
            } else {
                return Json(new { Message = "Error in saving file" });
            }
        }

        [HttpPost]
        public ActionResult DeleteFile(string id) {
            fileUpload = (List<HttpPostedFileBase>)Session["fileUpload"];
            Session.Remove("fileUpload");
            bool isSavedSuccessfully = true;
            string fName = "";
            foreach(var file in fileUpload) {
                if(file.FileName == id) {
                    fileUpload.Remove(file);
                    break;
                }
            }
            Session["fileUpload"] = fileUpload;
            if(isSavedSuccessfully) {
                return Json(new { Message = fName });
            } else {
                return Json(new { Message = "Error in delete file" });
            }
        }

        public ActionResult SaveUploadedFile2()
        {
            bool isSavedSuccessfully = true;
            string fName = "";
            foreach (string fileName in Request.Files)
            {
                HttpPostedFileBase file = Request.Files[fileName];
                fName = file.FileName;
                var fileName4 = Path.GetFileName(file.FileName);
                if (file != null && file.ContentLength > 0)
                {
                    if (Session["fileUpload2"] == null)
                    {
                        fileUpload2.Add(file);
                    }
                    else
                    {
                        fileUpload2 = (List<HttpPostedFileBase>)Session["fileUpload2"];
                        fileUpload2.Add(file);
                    }
                }
            }
            Session["fileUpload2"] = fileUpload2;
            if (isSavedSuccessfully)
            {
                return Json(new { Message = fName });
            }
            else
            {
                return Json(new { Message = "Error in saving file" });
            }
        }

        [HttpPost]
        public ActionResult DeleteFile2(string id)
        {
            fileUpload2 = (List<HttpPostedFileBase>)Session["fileUpload2"];
            Session.Remove("fileUpload2");
            bool isSavedSuccessfully = true;
            string fName = "";
            foreach (var file in fileUpload2)
            {
                if (file.FileName == id)
                {
                    fileUpload.Remove(file);
                    break;
                }
            }
            Session["fileUpload2"] = fileUpload2;
            if (isSavedSuccessfully)
            {
                return Json(new { Message = fName });
            }
            else
            {
                return Json(new { Message = "Error in delete file" });
            }
        }
        [HttpGet]
        public PartialViewResult ThemCay() {
            return PartialView();
        }

        [HttpPost]
        public ActionResult Them(Cay model, HttpPostedFileBase fileVideo) {
            if(Session["fileUpload"] != null) {
                string _fileName;
                string listImages = "";
                fileUpload = (List<HttpPostedFileBase>)Session["fileUpload"];
                foreach(var item in fileUpload) {
                    string pic = Path.GetFileName(item.FileName).Substring(0, Path.GetFileName(item.FileName).IndexOf("."));
                    _fileName = pic + ".jpg";
                    var path = Path.Combine(Server.MapPath("~/assets/client/images/"), _fileName);
                    item.SaveAs(path);
                    listImages += _fileName + "|";
                }
                model.HinhAnh = listImages;
                model.TinhTrang = "Sẵn bán";
                var dao = new AdminDAO();
                dao.ThemCay(model);
                Session["fileUpload"] = null;
            }
            return RedirectToAction("Cay", new { MaLoai = model.MaLoai, message="Thêm cá thể thành công" });
        }

        [HttpGet]
        public ActionResult SuaCay(int MaLoai, int MaCay) {
            var model = new AdminDAO().GetCay_MaLoai_MaCay(MaLoai, MaCay);
            return View(model);
        }

        [HttpPost]
        public ActionResult SuaCay(Cay Cay, HttpPostedFileBase fileVideo) {
            
            string tinhtrang = Request.Form["tinhtrang"];
            Cay.TinhTrang = tinhtrang;
            new AdminDAO().SuaCay(Cay);
            return RedirectToAction("Cay", new { MaLoai = Cay.MaLoai, message="Sửa cá thể thành công" });
        }

        public ActionResult SuaHinhAnhCay(int MaLoai, int MaCay) {
            var model = new AdminDAO().GetCay_MaLoai_MaCay(MaLoai, MaCay);
            return View(model);
        }
        public ActionResult SuaVideoCay(int MaLoai, int MaCay) {
            var model = new AdminDAO().GetCay_MaLoai_MaCay(MaLoai, MaCay);
            return View(model);
        }

        public ActionResult HoaDon(int? i) {
            var model = new AdminDAO().GetAllHoaDon(i);
            List<NguoiDung> TenNguoiDung = new List<NguoiDung>();
            if (model.Count > 0)
            {
                foreach(var m in model)
                    TenNguoiDung.Add(new AdminDAO().GetNguoiDung_MaHoaDon(m.MaHoaDon));
            }
            ViewBag.TenNguoiDung = TenNguoiDung;
            ViewBag.tinhtrang = i;
            return View(model);
        }

        public ActionResult CTHD(int MaHD, int i) {
            var model = new AdminDAO().GetCTHD_MaHD(MaHD);
            ViewBag.MaHD = MaHD;
            var hoadon = new AdminDAO().GetHoaDon_MaHD(MaHD);
            var nguoidung = new AdminDAO().GetNguoiDung_MaHoaDon(MaHD);
            ViewBag.TenNguoiDung = nguoidung.TenNguoiDung;
            ViewBag.SDT = nguoidung.SoDienThoai;
            ViewBag.NgayLap = hoadon.NgayMua;
            ViewBag.TongTien = hoadon.TongTien;
            ViewBag.TinhTrang = hoadon.TinhTrang;
            ViewBag.NgayGiaoHang = hoadon.NgayGiaoHang;
            ViewBag.GioGiaoHang = hoadon.GioGiaoHang;
            ViewBag.DiaChi = hoadon.DiaChi;
            ViewBag.i = i;
            return View(model);
        }

        [HttpPost]

        public ActionResult HoaDon_Ngay() {
            List<HoaDon> model = new List<HoaDon>();
            List<NguoiDung> TenNguoiDung = new List<NguoiDung>();
            string ngay_bd = Request.Form["ngay_bd"];
            string ngay_kt = Request.Form["ngay_kt"];
            string i = Request.Form["tinhtrang"];
            if(i == null)
                model = new AdminDAO().HoaDon_Ngay(DateTime.Parse(ngay_bd), DateTime.Parse(ngay_kt), int.Parse("0"));
            else {
                model = new AdminDAO().HoaDon_Ngay(DateTime.Parse(ngay_bd), DateTime.Parse(ngay_kt), int.Parse(i));
                ViewBag.tinhtrang = i;
            }
            if (model.Count > 0)
            {
                foreach (var m in model)
                    TenNguoiDung.Add(new AdminDAO().GetNguoiDung_MaHoaDon(m.MaHoaDon));
            }
            ViewBag.TenNguoiDung = TenNguoiDung;
            ViewBag.Ngaybd = ngay_bd;
            ViewBag.Ngaykt = ngay_kt;
            return View(model);
        }


        public ActionResult SuaTinhTrang(int mahoadon, string tinhtrang, int i) {
            new AdminDAO().SuaTinhTrang(mahoadon, tinhtrang);
            return RedirectToAction("CTHD", "AdminHome", new { MaHD = mahoadon, i=i });
        }

        public ActionResult CapNhatCTHD(int maCay, int mahoadon) {
            int? tongtien = new AdminDAO().CapNhatCTHD(maCay, mahoadon);
            string tong = tongtien.Value.ToString("C", CultureInfo.CurrentCulture);
            return Json(new { tong = tong }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult LocTinhTrangHD(int tinhtrang) {
            return RedirectToAction("HoaDon", "AdminHome", new { i = tinhtrang });
        }

        [HttpGet]
        public ActionResult SuaHinh(int MaLoai, int MaCay)
        {
            var model = new AdminDAO().GetCay_MaLoai_MaCay(MaLoai, MaCay);
            return View(model);
        }

        [HttpPost]
        public ActionResult ThemHinh()
        {
            int maloai = int.Parse(Request.Form["maloai"]);
            int maCay = int.Parse(Request.Form["maCay"]);
            Cay model = new VT_Shop.Models.Cay();
            if (Session["fileUpload2"] != null)
            {
                string _fileName;
                string listImages = "";
                fileUpload = (List<HttpPostedFileBase>)Session["fileUpload2"];
                foreach (var item in fileUpload)
                {
                    string pic = Path.GetFileName(item.FileName).Substring(0, Path.GetFileName(item.FileName).IndexOf("."));
                    _fileName = pic + ".jpg";
                    var path = Path.Combine(Server.MapPath("~/assets/client/images/"), _fileName);
                    item.SaveAs(path);
                    listImages += _fileName + "|";
                }
                model= db.Cays.Where(x => x.MaLoai == maloai && x.MaCay == maCay).First();
                model.HinhAnh = model.HinhAnh+listImages;
                db.SaveChanges();
                Session["fileUpload"] = null;
            }
            return RedirectToAction("SuaHinh", "AdminHome", new { MaLoai = maloai, MaCay = maCay });
        }

        [HttpPost]
        public JsonResult XoaHinh(int MaLoai, int MaCay, string ten)
        {
            var model = db.Cays.Where(x => x.MaLoai == MaLoai && x.MaCay == MaCay).First();
            string ten2 = ten + '|';
            model.HinhAnh=model.HinhAnh.Replace(ten2, "");
            db.SaveChanges();
            var delImg = Request.MapPath("~/assets/client/images/" + ten);
            if (System.IO.File.Exists(delImg))
            {
                System.IO.File.Delete(delImg);
            }
            return Json("");
        }

        public ActionResult CapNhatDiaChi(int mahoadon, string diachi)
        {
            var model = db.HoaDons.Find(mahoadon);
            model.DiaChi = diachi;
            db.SaveChanges();
            return Json("", JsonRequestBehavior.AllowGet);
        }
    }
}