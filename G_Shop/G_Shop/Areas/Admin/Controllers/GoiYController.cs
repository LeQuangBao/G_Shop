using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.Models;
using PagedList.Mvc;
using PagedList;
using G_Shop.Controllers;
using G_Shop.DAO;

namespace G_Shop.Areas.Admin.Controllers {
    public class GoiYController : Controller {
        GShopEntities1 db = new GShopEntities1();
        // GET: Admin/User
        protected override void Dispose(bool disposing) {
            db.Dispose();
            base.Dispose(disposing);
        }
        [HttpGet]
        public ActionResult CaTheLienQuan(int MaCaThe)
        {
            ViewBag.ID = MaCaThe;
            ViewBag.Del = new AdminDAO().GetAllLienQuan(MaCaThe);
            ViewBag.Sum = new AdminDAO().GetAllLienQuan(MaCaThe).Count;
            var model = new AdminDAO().GetAllCaTheExcept(MaCaThe);
            return View(model);
        }

        public ActionResult themGoiY(int C1, int C2) {
            GoiY g = new GoiY();
            g.C1 = C1;
            g.C2 = C2;
            db.GoiYs.Add(g);
            db.SaveChanges();
            return RedirectToAction("CaTheLienQuan", new { MaCaThe = C1 });
        }

        public ActionResult xoaGoiY(int c1,int c2) {
            int id = db.GoiYs.Where(x => x.C1 == c1 && x.C2 == c2).Select(x => x.id).First();
            GoiY g = db.GoiYs.Find(id);
            db.GoiYs.Remove(g);
            db.SaveChanges();
            return RedirectToAction("CaTheLienQuan", new { MaCaThe = c1 });
        }
    }
}