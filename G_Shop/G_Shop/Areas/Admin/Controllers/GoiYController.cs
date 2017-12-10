using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.Models;
using PagedList.Mvc;
using PagedList;
using G_Shop.Controllers;

namespace G_Shop.Areas.Admin.Controllers {
    public class GoiYController : Controller {
        GShopEntities2 db = new GShopEntities2();
        // GET: Admin/User
        protected override void Dispose(bool disposing) {
            db.Dispose();
            base.Dispose(disposing);
        }


        [HttpPost]
        public JsonResult themGoiY(int C1, int C2) {
            GoiY g = new GoiY();
            g.C1 = C1;
            g.C2 = C2;
            db.GoiYs.Add(g);
            db.SaveChanges();
            return Json("ok", JsonRequestBehavior.AllowGet);
        }

        [HttpDelete]
        public JsonResult xoaGoiY(int id) {
            GoiY g = db.GoiYs.Find(id);
            db.GoiYs.Remove(g);
            db.SaveChanges();
            return Json("ok", JsonRequestBehavior.AllowGet);
        }
    }
}