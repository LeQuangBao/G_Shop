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

        
        public List<Tree> GetTree_LoaiId(int LoaiId, int? i)
        {
            List<Tree> model = new List<Tree>();
            if (i == null || i==0)
                model = db.Trees.Where(x => x.LoaiId == LoaiId).ToList();
            else  //Biến i kiểm tra điều kiện lọc hóa đơn theo tình trạng
            {
                if (i == 1)
                    model = db.Trees.Where(x => x.TinhTrang == "Sẵn bán").ToList();
                if (i == 2)
                    model = db.Trees.Where(x => x.TinhTrang == "Đã bán").ToList();
                if (i == 3)
                    model = db.Trees.Where(x => x.TinhTrang == "Đã mất").ToList();
            }
            return model;
        }
        public string GetTenLoai_LoaiId(int LoaiId)
        {
            var model = db.Loais.Find(LoaiId);
            return model.TenLoai;
        }

        public void ThemTree(Tree model)
        {
            db.Trees.Add(model);
            db.SaveChanges();
        }

        public Tree GetTree_LoaiId_TreeId(int LoaiId, int TreeId)
        {
            return db.Trees.Where(x => x.LoaiId == LoaiId && x.TreeId == TreeId).FirstOrDefault();
        }

        public void SuaTree(Tree Tree)
        {
            Tree model = db.Trees.Find(Tree.TreeId);
            model.TenTree = Tree.TenTree;
            model.MoTa = Tree.MoTa;
            model.GiaBan = Tree.GiaBan;
            model.GiaMua = Tree.GiaMua;
            model.KhuyenMai = Tree.KhuyenMai;
            model.TinhTrang = Tree.TinhTrang;
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
                         join ct in db.Trees
                         on cthd.TreeId equals ct.TreeId
                         join hd in db.HoaDons on cthd.HoaDonId equals hd.HoaDonId
                         where cthd.HoaDonId == MaHD
                         select new
                         {
                             macthd = cthd.MaChiTietHoaDon,
                             mahd = cthd.HoaDonId,
                             TreeId=ct.TreeId,
                             tenct = ct.TenTree,
                             hinh = ct.HinhAnh.Substring(0, ct.HinhAnh.IndexOf("|")),
                             gia = ct.GiaBan
                         }).AsEnumerable().Select(x => new CTHD()
                         {
                             MaCTHD = x.macthd,
                             MaHD = x.mahd,
                             TreeId=x.TreeId,
                             TenTree = x.tenct,
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

        public HoaDon GetHoaDon_MaHD(int HoaDonId)
        {
            return db.HoaDons.Where(x => x.HoaDonId == HoaDonId).First();
        }

        public User GetUser_HoaDonId(int HoaDonId)
        {
            var model = (from ngdung in db.Users
                         join hd in db.HoaDons
                         on ngdung.UserId equals hd.UserId
                         where hd.HoaDonId == HoaDonId
                         select new
                         {
                             Ten = ngdung.Ten,
                             sdt = ngdung.SoDienThoai
                         }).AsEnumerable().Select(x => new User()
                         {
                             Ten = x.Ten,
                             SoDienThoai = x.sdt
                         }).First();
            return model;
        }           
        
        public void SuaTinhTrang(int HoaDonId,string TinhTrang)
        {
            var model = db.HoaDons.Find(HoaDonId);
            model.TinhTrang = TinhTrang;
            db.SaveChanges();
        }              

        public int? CapNhatCTHD(int TreeId, int HoaDonId)
        {
            int? tongtien;
            var cthd = db.ChiTietHoaDons.Where(x=>x.TreeId==TreeId && x.HoaDonId==HoaDonId).First();
            db.ChiTietHoaDons.Remove(cthd);
            var hoadon = db.HoaDons.Find(HoaDonId);
            int? gia = db.Trees.Find(TreeId).GiaBan;
            tongtien = hoadon.TongTien - gia;
            hoadon.TongTien=tongtien;
            var Tree = db.Trees.Find(TreeId);
            Tree.TinhTrang = "Sẵn bán";
            db.SaveChanges();
            return tongtien;
        }

        public List<Tree> GetAllTreeExcept(int TreeId)
        {
            return db.Trees.Where(x=>x.TreeId!=TreeId).ToList();
        }
    }
}