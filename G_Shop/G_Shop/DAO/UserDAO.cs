using G_Shop.Models;
using Itenso.TimePeriod;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace G_Shop.DAO
{
    public class UserDAO
    {
        GShopEntities1 db = null;
        public UserDAO()
        {
            db = new GShopEntities1();
        }
        public int Login(string username, string password)
        {
            var result = db.NguoiDungs.SingleOrDefault(x => x.TenDangNhap == username && x.MatKhau == password);
            if (result == null)
                return 0;
            else
                return 1;
        }
        public NguoiDung GetUser(string username)
        {
            return db.NguoiDungs.SingleOrDefault(x => x.TenDangNhap == username);
        }

        public List<Loai> GetAllTenLoai()
        {
            return db.Loais.ToList();
        }

        public List<CaThe> GetAllCaThe_MaLoai(int MaLoai)
        {
            return db.CaThes.Where(x => x.MaLoai == MaLoai).ToList();
        }

        public List<CaThe> GetNewCaThe()
        {
            return db.CaThes.OrderByDescending(x => x.MaCaThe).Take(3).ToList();
        }

        public string GetTenLoai_MaLoai(int MaLoai)
        {
            var model = db.Loais.Find(MaLoai);
            return model.TenLoai;
        }

        public CaThe GetCaThe_MaLoai_MaCaThe(int MaLoai, int MaCaThe)
        {
            return db.CaThes.Where(x => x.MaLoai == MaLoai && x.MaCaThe == MaCaThe).FirstOrDefault();
        }

        public List<CaThe> TimCaThe(string ten)
        {
            return db.CaThes.Where(x => x.TenCaThe.Contains(ten)).ToList();
        }

        public string TuoiCaThe(int MaCaThe)
        {
            string tuoi;
            var model = db.CaThes.Find(MaCaThe);
            DateDiff ngaytuoi = new DateDiff(model.NgaySinh, DateTime.Now);
            if (ngaytuoi.Years == 0)
                if (ngaytuoi.Months == 0)
                    tuoi = ngaytuoi.Days.ToString() + " ngày";
                else
                    tuoi=ngaytuoi.Months.ToString()+" tháng "+ ngaytuoi.Days.ToString() + " ngày";
            else
                tuoi=ngaytuoi.Years.ToString()+ " tuổi"+ngaytuoi.Months.ToString() + " tháng " + ngaytuoi.Days.ToString() + " ngày";
            return tuoi;
        }
    }
}