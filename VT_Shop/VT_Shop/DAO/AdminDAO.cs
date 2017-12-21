using VT_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VT_Shop.Areas.Admin.Models;
namespace VT_Shop.DAO
{
    public class AdminDAO
    {
        VTShopEntities db = null;
        public AdminDAO()
        {
            db = new VTShopEntities();
        }
        public List<Loai> GetAllTenLoai()
        {
            return db.Loais.ToList();
        }

        
        public List<Cay> GetCay_MaLoai(int MaLoai, int? i)
        {
            List<Cay> model = new List<Cay>();
            if (i == null || i==0)
                model = db.Cays.Where(x => x.MaLoai == MaLoai).ToList();
            else  //Biến i kiểm tra điều kiện lọc hóa đơn theo tình trạng
            {
                if (i == 1)
                    model = db.Cays.Where(x => x.TinhTrang == "Sẵn bán").ToList();
                if (i == 2)
                    model = db.Cays.Where(x => x.TinhTrang == "Đã bán").ToList();
                if (i == 3)
                    model = db.Cays.Where(x => x.TinhTrang == "Đã mất").ToList();
            }
            return model;
        }
        public string GetTenLoai_MaLoai(int MaLoai)
        {
            var model = db.Loais.Find(MaLoai);
            return model.TenLoai;
        }

        public void ThemCay(Cay model)
        {
            db.Cays.Add(model);
            db.SaveChanges();
        }

        public Cay GetCay_MaLoai_MaCay(int MaLoai, int MaCay)
        {
            return db.Cays.Where(x => x.MaLoai == MaLoai && x.MaCay == MaCay).FirstOrDefault();
        }

        public void SuaCay(Cay Cay)
        {
            Cay model = db.Cays.Find(Cay.MaCay);
            model.TenCay = Cay.TenCay;
            model.MoTa = Cay.MoTa;
            model.GiaBan = Cay.GiaBan;
            model.GiaMua = Cay.GiaMua;
            model.KhuyenMai = Cay.KhuyenMai;
            model.TinhTrang = Cay.TinhTrang;
            db.SaveChanges();
        }

        public List<HoaDon> GetAllHoaDon(int? i) 
        {
            List<HoaDon> model=new List<HoaDon>();
            if (i == 0 || i==null)
                model = db.HoaDons.OrderByDescending(x => x.NgayMua).ToList();
            else  //Biến i kiểm tra điều kiện lọc hóa đơn theo tình trạng
            {
                if(i==1)
                    model=db.HoaDons.Where(x=>x.TinhTrang=="Mới đặt hàng").OrderByDescending(x => x.NgayMua).ToList();
                if (i == 2)
                    model=db.HoaDons.Where(x => x.TinhTrang == "Đã xác nhận").OrderByDescending(x => x.NgayMua).ToList();
                if (i == 3)
                    model=db.HoaDons.Where(x => x.TinhTrang == "Giao hàng thành công").OrderByDescending(x => x.NgayMua).ToList();
                if (i == 4)
                    model=db.HoaDons.Where(x => x.TinhTrang == "Thất bại").OrderByDescending(x => x.NgayMua).ToList();
            }
            return model; 
        }

        public List<CTHD> GetCTHD_MaHD(int MaHD)
        {
            var model = (from cthd in db.ChiTietHoaDons
                         join ct in db.Cays
                         on cthd.MaCay equals ct.MaCay
                         join hd in db.HoaDons on cthd.MaHoaDon equals hd.MaHoaDon
                         where cthd.MaHoaDon == MaHD
                         select new
                         {
                             macthd = cthd.MaChiTietHoaDon,
                             mahd = cthd.MaHoaDon,
                             maCay=ct.MaCay,
                             tenct = ct.TenCay,
                             hinh = ct.HinhAnh.Substring(0, ct.HinhAnh.IndexOf("|")),
                             gia = ct.GiaBan
                         }).AsEnumerable().Select(x => new CTHD()
                         {
                             MaCTHD = x.macthd,
                             MaHD = x.mahd,
                             MaCay=x.maCay,
                             TenCay = x.tenct,
                             Hinh = x.hinh,
                             Gia = x.gia
                         }).ToList();
            return model;
        }

        public List<HoaDon> HoaDon_Ngay(DateTime ngay_bd, DateTime ngay_kt,int i)
        {
            List<HoaDon> model = new List<HoaDon>();
            if (i == 0)
                model=db.HoaDons.Where(x=>x.NgayMua>=ngay_bd && x.NgayMua<=ngay_kt).OrderByDescending(x=>x.NgayMua).ToList();
            if (i == 1)
                model = db.HoaDons.Where(x => x.NgayMua >= ngay_bd && x.NgayMua <= ngay_kt && x.TinhTrang == "Mới đặt hàng").OrderByDescending(x => x.NgayMua).ToList();
            if (i == 2)
                model = db.HoaDons.Where(x => x.NgayMua >= ngay_bd && x.NgayMua <= ngay_kt && x.TinhTrang == "Đã xác nhận").OrderByDescending(x => x.NgayMua).ToList();
            if (i == 3)
                model = db.HoaDons.Where(x => x.NgayMua >= ngay_bd && x.NgayMua <= ngay_kt && x.TinhTrang == "Giao hàng thành công").OrderByDescending(x => x.NgayMua).ToList();
            if (i == 4)
                model = db.HoaDons.Where(x => x.NgayMua >= ngay_bd && x.NgayMua <= ngay_kt && x.TinhTrang == "Thất bại").OrderByDescending(x => x.NgayMua).ToList();
            return model;
        }

        public HoaDon GetHoaDon_MaHD(int MaHoaDon)
        {
            return db.HoaDons.Where(x => x.MaHoaDon == MaHoaDon).First();
        }

        public NguoiDung GetNguoiDung_MaHoaDon(int MaHoaDon)
        {
            var model = (from ngdung in db.NguoiDungs
                         join hd in db.HoaDons
                         on ngdung.MaNguoiDung equals hd.MaNguoiDung
                         where hd.MaHoaDon == MaHoaDon
                         select new
                         {
                             tennguoidung = ngdung.TenNguoiDung,
                             sdt = ngdung.SoDienThoai
                         }).AsEnumerable().Select(x => new NguoiDung()
                         {
                             TenNguoiDung = x.tennguoidung,
                             SoDienThoai = x.sdt
                         }).First();
            return model;
        }           
        
        public void SuaTinhTrang(int MaHoaDon,string TinhTrang)
        {
            var model = db.HoaDons.Find(MaHoaDon);
            model.TinhTrang = TinhTrang;
            db.SaveChanges();
        }              

        public int? CapNhatCTHD(int maCay, int mahoadon)
        {
            int? tongtien;
            var cthd = db.ChiTietHoaDons.Where(x=>x.MaCay==maCay && x.MaHoaDon==mahoadon).First();
            db.ChiTietHoaDons.Remove(cthd);
            var hoadon = db.HoaDons.Find(mahoadon);
            int? gia = db.Cays.Find(maCay).GiaBan;
            tongtien = hoadon.TongTien - gia;
            hoadon.TongTien=tongtien;
            var Cay = db.Cays.Find(maCay);
            Cay.TinhTrang = "Sẵn bán";
            db.SaveChanges();
            return tongtien;
        }

        public List<Cay> GetAllCayExcept(int MaCay)
        {
            return db.Cays.Where(x=>x.MaCay!=MaCay).ToList();
        }
    }
}