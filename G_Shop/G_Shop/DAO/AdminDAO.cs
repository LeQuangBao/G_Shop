using G_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using G_Shop.Areas.Admin.Models;
namespace G_Shop.DAO
{
    public class AdminDAO
    {
        GShopEntities1 db = null;
        public AdminDAO()
        {
            db = new GShopEntities1();
        }
        public List<Loai> GetAllTenLoai()
        {
            return db.Loais.ToList();
        }

        
        public List<CaThe> GetCaThe_MaLoai(int MaLoai)
        {
            return db.CaThes.Where(x=>x.MaLoai==MaLoai).ToList();
        }
        public string GetTenLoai_MaLoai(int MaLoai)
        {
            var model = db.Loais.Find(MaLoai);
            return model.TenLoai;
        }

        public void ThemCaThe(CaThe model)
        {
            db.CaThes.Add(model);
            db.SaveChanges();
        }

        public CaThe GetCaThe_MaLoai_MaCaThe(int MaLoai, int MaCaThe)
        {
            return db.CaThes.Where(x => x.MaLoai == MaLoai && x.MaCaThe == MaCaThe).FirstOrDefault();
        }

        public void SuaCaThe(CaThe cathe)
        {
            var model = db.CaThes.Find(cathe.MaCaThe);
            model.TenCaThe = cathe.TenCaThe;
            model.MoTa = cathe.MoTa;
            model.NgaySinh = cathe.NgaySinh;
            model.GiaBan = cathe.GiaBan;
            model.TinhTrang = cathe.TinhTrang;
            //model.HinhAnh = cathe.HinhAnh;
            db.SaveChanges();
        }

        public List<HoaDon> GetAllHoaDon()
        {
            return db.HoaDons.ToList();
        }

        public List<CTHD> GetCTHD_MaHD(int MaHD)
        {
            var model = (from cthd in db.ChiTietHoaDons
                         join ct in db.CaThes
                         on cthd.MaCaThe equals ct.MaCaThe
                         join hd in db.HoaDons on cthd.MaHoaDon equals hd.MaHoaDon
                         where cthd.MaHoaDon == MaHD
                         select new
                         {
                             macthd = cthd.MaChiTietHoaDon,
                             mahd = cthd.MaHoaDon,
                             macathe=ct.MaCaThe,
                             tenct = ct.TenCaThe,
                             gia = ct.GiaBan
                         }).AsEnumerable().Select(x => new CTHD()
                         {
                             MaCTHD = x.macthd,
                             MaHD = x.mahd,
                             MaCaThe=x.macathe,
                             TenCaThe = x.tenct,
                             Gia = x.gia
                         }).ToList();
            return model;
        }

        public List<HoaDon> HoaDon_Ngay(DateTime ngay_bd, DateTime ngay_kt)
        {
            return db.HoaDons.Where(x=>x.NgayMua>=ngay_bd && x.NgayMua<=ngay_kt).ToList();
        }

        public HoaDon GetHoaDon_MaHD(int MaHoaDon)
        {
            return db.HoaDons.Where(x => x.MaHoaDon == MaHoaDon).First();
        }

        public List<NguoiDung> GetNguoiDung_MaHoaDon(int MaHoaDon)
        {
            var model = (from ngdung in db.NguoiDungs
                         join hd in db.HoaDons
                         on ngdung.MaNguoiDung equals hd.MaNguoiDung
                         where hd.MaHoaDon == MaHoaDon
                         select new
                         {
                             tennguoidung = ngdung.TenDangNhap,
                             sdt = ngdung.SoDienThoai
                         }).AsEnumerable().Select(x => new NguoiDung()
                         {
                             TenDangNhap = x.tennguoidung,
                             SoDienThoai = x.sdt
                         }).ToList();
            return model;
        }           
        
        public void SuaTinhTrang(int MaHoaDon,string TinhTrang)
        {
            var model = db.HoaDons.Find(MaHoaDon);
            model.TinhTrang = TinhTrang;
            db.SaveChanges();
        }              

        public int? CapNhatCTHD(int macathe, int mahoadon)
        {
            int? tongtien;
            var cthd = db.ChiTietHoaDons.Where(x=>x.MaCaThe==macathe && x.MaHoaDon==mahoadon).First();
            db.ChiTietHoaDons.Remove(cthd);
            var hoadon = db.HoaDons.Find(mahoadon);
            int? gia = db.CaThes.Find(macathe).GiaBan;
            tongtien = hoadon.TongTien - gia;
            hoadon.TongTien=tongtien;
            db.SaveChanges();
            return tongtien;
        }

        
    }
}