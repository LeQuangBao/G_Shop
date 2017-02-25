using G_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace G_Shop.DAO
{
    public class AdminDAO
    {
        GShopEntities db = null;
        public AdminDAO()
        {
            db = new GShopEntities();
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

        public void Them(CaThe model)
        {
            db.CaThes.Add(model);
            db.SaveChanges();
        }
    }
}