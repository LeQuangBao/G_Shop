using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.Models;
using PagedList;

namespace G_Shop.Areas.Admin.Controllers
{
    public class GiongController : Controller
    {
        GShopEntities1 db = new GShopEntities1();

        public ActionResult Index(string message = "")
        {
            ViewBag.Message = message;
            return View();
        }
        [HttpPost]
        public JsonResult themgiong(string tengiong, string mota)
        {
            try
            {
                var giong = new Giong();
                giong.TenGiong = tengiong;
                db.Giongs.Add(giong);
                db.SaveChanges();
                return Json("ok", JsonRequestBehavior.AllowGet);

            }
            catch
            {
                return Json("error", JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult edit(int magiong)
        {
            var list = db.Giongs.Find(magiong);
            return View(list);
        }
        [HttpPost]
        public JsonResult capnhat(GiongDTO giong)
        {
            //try
            //{
            var model = db.Giongs.Find(giong.MaGiong);
            model.TenGiong = giong.TenGiong;
            db.SaveChanges();
            return Json("ok", JsonRequestBehavior.AllowGet);
            // }
            // catch
            // {
            // return Json("error", JsonRequestBehavior.AllowGet);
            // }
        }
        public JsonResult get_allgiong()
        {
            var model = (from n in db.Giongs
                         select new GiongDTO
                         {
                             MaGiong = n.MaGiong,
                             TenGiong = n.TenGiong,
                         }).ToList();
            return Json(model, JsonRequestBehavior.AllowGet);
        }
    }
}
