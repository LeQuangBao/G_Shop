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
        public IEnumerable<Tree> ListAllPageging4(int page, int pagesize) {
            return db.Trees.Where(x => x.TinhTrang == "Sẵn bán").OrderByDescending(x => x.TreeId).ToPagedList(page, pagesize);
        }

        public ActionResult Index(int page = 1, int pagesize = 3) {
            var user = Session["user"] as User;
            if(user != null)
                ViewBag.Ten = user.UserName;
            var model = ListAllPageging4(page, pagesize);
            return View(model);
        }
        public IEnumerable<Tree> ListAllPageging(int LoaiId, int page, int pagesize) {
            return db.Trees.Where(n => n.LoaiId.Equals(LoaiId)).OrderByDescending(x => x.TreeId).ToPagedList(page, pagesize);
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
        public ActionResult Tree(int LoaiId, int page = 1, int pagesize = 6) {
            var user = Session["user"] as User;
            if(user != null)
                ViewBag.Ten = user.UserName;
            var model = ListAllPageging(LoaiId, page, pagesize);
            ViewBag.TenLoai = new UserDAO().GetTenLoai_LoaiId(LoaiId);
            ViewBag.LoaiId = LoaiId;
            return View(model);
        }
        [HttpGet]
        public ActionResult ChiTiet(int LoaiId, int TreeId) {
            var user = Session["user"] as User;
            if(user != null)
                ViewBag.Ten = user.UserName;
            var model = new UserDAO().GetTree_LoaiId_TreeId(LoaiId, TreeId);
            return View(model);
        }

        public ActionResult Tim(string ten) {
            var user = Session["user"] as User;
            if(user != null)
                ViewBag.Ten = user.UserName;
            var model = new UserDAO().TimTree(ten);
            return View(model);
        }
    }
}