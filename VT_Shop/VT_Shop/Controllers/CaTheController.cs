using VT_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VT_Shop.Controllers
{
    public class CayController : Controller
    {
        VTShopEntities db = new VTShopEntities();

        [HttpGet]
        public JsonResult getCay() {
            var list = (from n in db.Cays
                        select new CayDTO {
                            MaCay = n.MaCay,
                            MaLoai = n.MaLoai,
                            TenCay = n.TenCay,
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
                            MaLoai = n.MaLoai,
                            TenLoai = n.TenLoai,
                            MoTa = n.MoTa,
                            MaGiong = n.MaGiong
                        }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult getGiong() {
            var list = (from n in db.Giongs
                        select new GiongDTO {
                            MaGiong = n.MaGiong,
                            TenGiong = n.TenGiong,
                        }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }

    }
}
