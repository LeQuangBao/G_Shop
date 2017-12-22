using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VT_Shop.Models;
using PagedList;

namespace VT_Shop.Areas.Admin.Controllers
{
    public class LoaiController : Controller
    {
        VTShopEntities db = new VTShopEntities();
  
        public ActionResult Index(string message = "")
        {
            ViewBag.Message = message;
            return View();
        }
        [HttpPost]
        public JsonResult themloai(string tenloai, string mota)
        {
            try
            {
                var loai = new Loai();
                loai.TenLoai = tenloai;
                loai.MoTa =mota ;
                db.Loais.Add(loai);
                db.SaveChanges();
                return Json("ok",JsonRequestBehavior.AllowGet);

            }
            catch
            {
                return Json("error", JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult edit(int LoaiId)
        {
            var list = db.Loais.Find(LoaiId);
            return View(list);
        }
        [HttpPost]
        public JsonResult capnhat(LoaiDTO loai)
        {
            //try
            //{
                var model = db.Loais.Find(loai.LoaiId);
                model.TenLoai = loai.TenLoai;
                model.MoTa = loai.MoTa;
                db.SaveChanges();
            return Json("ok", JsonRequestBehavior.AllowGet);
           // }
           // catch
           // {
               // return Json("error", JsonRequestBehavior.AllowGet);
           // }
        }
        public JsonResult get_allLoai()
        {
            var model = (from n in db.Loais
                         select new LoaiDTO
                         {
                             LoaiId=n.LoaiId,
                             TenLoai=n.TenLoai,
                             MoTa=n.MoTa
                         }).ToList();
            return Json(model, JsonRequestBehavior.AllowGet);
        }
    }
}