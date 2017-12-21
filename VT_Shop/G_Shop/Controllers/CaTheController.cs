using VT_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VT_Shop.Controllers
{
    public class CaTheController : Controller
    {
        VTShopEntities db = new VTShopEntities();

        [HttpGet]
        public JsonResult getCaThe() {
            var list = (from n in db.CaThes
                        select new CaTheDTO {
                            MaCaThe = n.MaCaThe,
                            MaLoai = n.MaLoai,
                            TenCaThe = n.TenCaThe,
                            MoTa = n.MoTa,
                            NgaySinh = n.NgaySinh,
                            GiaMua = n.GiaMua,
                            GiaBan = n.GiaBan,
                            KhuyenMai = n.KhuyenMai,
                            TinhTrang = n.TinhTrang,
                            HinhAnh = n.HinhAnh,
                            Video = n.Video
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
