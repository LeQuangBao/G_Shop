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
            var admin = Session["Admin"] as User;
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
            var model = Session["Admin"] as User;
            return PartialView(model);

        }

        [HttpGet]
        public ActionResult Cay(int LoaiId, int? i, string message = "") {
            if(Session["Admin"] == null)
                return View("Login");
            else {
                var model = new AdminDAO().GetTree_LoaiId(LoaiId, i);
                ViewBag.TenLoai = new AdminDAO().GetTenLoai_LoaiId(LoaiId);
                ViewBag.LoaiId = LoaiId;
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
        public PartialViewResult ThemTree() {
            return PartialView();
        }

        [HttpPost]
        public ActionResult Them(Tree model, HttpPostedFileBase fileVideo) {
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
                dao.ThemTree(model);
                Session["fileUpload"] = null;
            }
            return RedirectToAction("Tree", new { LoaiId = model.LoaiId, message="Thêm cây thành công" });
        }

        [HttpGet]
        public ActionResult SuaCay(int LoaiId, int TreeId) {
            var model = new AdminDAO().GetTree_LoaiId_TreeId(LoaiId, TreeId);
            return View(model);
        }

        [HttpPost]
        public ActionResult SuaCay(Tree Tree, HttpPostedFileBase fileVideo) {
            
            string tinhtrang = Request.Form["tinhtrang"];
            Tree.TinhTrang = tinhtrang;
            new AdminDAO().SuaTree(Tree);
            return RedirectToAction("Tree", new { LoaiId = Tree.LoaiId, message="Sửa cây thành công" });
        }

        public ActionResult SuaHinhAnhTree(int LoaiId, int TreeId) {
            var model = new AdminDAO().GetTree_LoaiId_TreeId(LoaiId, TreeId);
            return View(model);
        }

        public ActionResult HoaDon(int? i) {
            var model = new AdminDAO().GetAllHoaDon(i);
            List<User> Ten = new List<User>();
            if (model.Count > 0)
            {
                foreach(var m in model)
                    Ten.Add(new AdminDAO().GetUser_HoaDonId(m.HoaDonId));
            }
            ViewBag.Ten = Ten;
            ViewBag.tinhtrang = i;
            return View(model);
        }

        public ActionResult CTHD(int MaHD, int i) {
            var model = new AdminDAO().GetCTHD_MaHD(MaHD);
            ViewBag.MaHD = MaHD;
            var hoadon = new AdminDAO().GetHoaDon_MaHD(MaHD);
            var User = new AdminDAO().GetUser_HoaDonId(MaHD);
            ViewBag.Ten = User.Ten;
            ViewBag.SDT = User.SoDienThoai;
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
            List<User> Ten = new List<User>();
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
                    Ten.Add(new AdminDAO().GetUser_HoaDonId(m.HoaDonId));
            }
            ViewBag.Ten = Ten;
            ViewBag.Ngaybd = ngay_bd;
            ViewBag.Ngaykt = ngay_kt;
            return View(model);
        }


        public ActionResult SuaTinhTrang(int HoaDonId, string tinhtrang, int i) {
            new AdminDAO().SuaTinhTrang(HoaDonId, tinhtrang);
            return RedirectToAction("CTHD", "AdminHome", new { MaHD = HoaDonId, i=i });
        }

        public ActionResult CapNhatCTHD(int TreeId, int HoaDonId) {
            int? tongtien = new AdminDAO().CapNhatCTHD(TreeId, HoaDonId);
            string tong = tongtien.Value.ToString("C", CultureInfo.CurrentCulture);
            return Json(new { tong = tong }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult LocTinhTrangHD(int tinhtrang) {
            return RedirectToAction("HoaDon", "AdminHome", new { i = tinhtrang });
        }

        [HttpGet]
        public ActionResult SuaHinh(int LoaiId, int TreeId)
        {
            var model = new AdminDAO().GetTree_LoaiId_TreeId(LoaiId, TreeId);
            return View(model);
        }

        [HttpPost]
        public ActionResult ThemHinh()
        {
            int LoaiId = int.Parse(Request.Form["LoaiId"]);
            int TreeId = int.Parse(Request.Form["TreeId"]);
            Tree model = new VT_Shop.Models.Tree();
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
                model= db.Trees.Where(x => x.LoaiId == LoaiId && x.TreeId == TreeId).First();
                model.HinhAnh = model.HinhAnh+listImages;
                db.SaveChanges();
                Session["fileUpload"] = null;
            }
            return RedirectToAction("SuaHinh", "AdminHome", new { LoaiId = LoaiId, TreeId = TreeId });
        }

        [HttpPost]
        public JsonResult XoaHinh(int LoaiId, int TreeId, string ten)
        {
            var model = db.Trees.Where(x => x.LoaiId == LoaiId && x.TreeId == TreeId).First();
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

        public ActionResult CapNhatDiaChi(int HoaDonId, string diachi)
        {
            var model = db.HoaDons.Find(HoaDonId);
            model.DiaChi = diachi;
            db.SaveChanges();
            return Json("", JsonRequestBehavior.AllowGet);
        }
    }
}