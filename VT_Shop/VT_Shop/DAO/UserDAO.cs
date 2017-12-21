using VT_Shop.Models;
using Itenso.TimePeriod;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VT_Shop.DAO {
    public class UserDAO {
        VTShopEntities db = null;
        public UserDAO() {
            db = new VTShopEntities();
        }
        public int Login(string username, string password) {
            var result = db.NguoiDungs.SingleOrDefault(x => x.TenDangNhap == username && x.MatKhau == password);
            if(result == null)
                return 0;
            else
                return 1;
        }
        public NguoiDung GetUser(string username) {
            return db.NguoiDungs.SingleOrDefault(x => x.TenDangNhap == username);
        }

        public NguoiDung GetUser(int id) {
            return db.NguoiDungs.Find(id);
        }

        public bool changePassword(int id, string oldPassword, string newPassword) {
            NguoiDung nguoiDung = db.NguoiDungs.Find(id);
            if(nguoiDung.MatKhau == oldPassword) {
                nguoiDung.MatKhau = newPassword;
                db.SaveChanges();
                return true;
            }
            return false;
        }

        public List<Loai> GetAllTenLoai() {
            return db.Loais.ToList();
        }

        public List<Cay> GetAllCay_MaLoai(int MaLoai) {
            return db.Cays.Where(x => x.MaLoai == MaLoai).ToList();
        }

        public List<Cay> GetNewCay() {
            return db.Cays.OrderByDescending(x => x.MaCay).Take(3).ToList();
        }

        public string GetTenLoai_MaLoai(int MaLoai) {
            var model = db.Loais.Find(MaLoai);
            return model.TenLoai;
        }

        public Cay GetCay_MaLoai_MaCay(int MaLoai, int MaCay) {
            return db.Cays.Where(x => x.MaLoai == MaLoai && x.MaCay == MaCay).FirstOrDefault();
        }

        public List<Cay> TimCay(string ten) {
            return db.Cays.Where(x => x.TenCay.Contains(ten)).ToList();
        }
        

        public void BanCay(int MaCay) {
            Cay Cay = db.Cays.Find(MaCay);
            Cay.TinhTrang = "Đã bán";
            db.SaveChanges();
        }
    }
}