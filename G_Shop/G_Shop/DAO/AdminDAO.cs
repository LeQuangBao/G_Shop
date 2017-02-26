﻿using G_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using G_Shop.Areas.Admin.Models;
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
            model.Tuoi = cathe.Tuoi;
            model.Gia = cathe.Gia;
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
                         where cthd.MaHoaDon == MaHD
                         select new
                         {
                             macthd = cthd.MaChiTietHoaDon,
                             mahd = cthd.MaHoaDon,
                             tenct = ct.TenCaThe,
                             gia = ct.Gia
                         }).AsEnumerable().Select(x => new CTHD()
                         {
                             MaCTHD = x.macthd,
                             MaHD = x.mahd,
                             TenCaThe = x.tenct,
                             Gia = x.gia
                         }).ToList();
            return model;
        }
    }
}