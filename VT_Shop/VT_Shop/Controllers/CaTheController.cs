using VT_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VT_Shop.Controllers
{
    public class TreeController : Controller
    {
        VTShopEntities db = new VTShopEntities();

        [HttpGet]
        public JsonResult getTree() {
            var list = (from n in db.Trees
                        select new TreeDTO {
                            TreeId = n.TreeId,
                            LoaiId = n.LoaiId,
                            TenTree = n.TenTree,
                            MoTa = n.MoTa,
                            GiaMua = n.GiaMua,
                            GiaBan = n.GiaBan,
                            KhuyenMai = n.KhuyenMai,
                            TinhTrang = n.TinhTrang,
                            HinhAnh = n.HinhAnh,
                        }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult getLoai() {
            var list = (from n in db.Loais
                        select new LoaiDTO {
                            LoaiId = n.LoaiId,
                            TenLoai = n.TenLoai,
                            MoTa = n.MoTa,
                            GiongId = n.GiongId
                        }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult getGiong() {
            var list = (from n in db.Giongs
                        select new GiongDTO {
                            GiongId = n.GiongId,
                            TenGiong = n.TenGiong,
                        }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }

    }
}
