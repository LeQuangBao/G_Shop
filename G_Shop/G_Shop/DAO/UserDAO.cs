using G_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace G_Shop.DAO
{
    public class UserDAO
    {
        GShopEntities db = null;
        public UserDAO()
        {
            db = new GShopEntities();
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
    }
}