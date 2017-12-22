using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VT_Shop.Models;
using PagedList;

namespace VT_Shop.Areas.Admin.Controllers
{
    public class GiongController : Controller
    {
        VTShopEntities db = new VTShopEntities();

        public ActionResult Index(string message = "")
        {
            ViewBag.Message = message;
            return View();
        }
        [HttpPost]
        public JsonResult themgiong(string tenGiong)
        {
            try
            {
                var giong = new Giong();
                giong.TenGiong = tenGiong;
                db.SaveChanges();
                return Json("ok", JsonRequestBehavior.AllowGet);

            }
            catch
            {
                return Json("error", JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult edit(int GiongId)
        {
            var list = db.Giongs.Find(GiongId);
            return View(list);
        }
        [HttpPost]
        public JsonResult capnhat(GiongDTO Giong)
        {
            //try
            //{
            var model = db.Giongs.Find(Giong.GiongId);
            model.TenGiong = Giong.TenGiong;
            db.SaveChanges();
            return Json("ok", JsonRequestBehavior.AllowGet);
            // }
            // catch
            // {
            // return Json("error", JsonRequestBehavior.AllowGet);
            // }
        }
        public JsonResult get_allGiong()
        {
            var model = (from n in db.Giongs
                         select new GiongDTO
                         {
                             GiongId = n.GiongId,
                             TenGiong = n.TenGiong,
                         }).ToList();
            return Json(model, JsonRequestBehavior.AllowGet);
        }
    }
}