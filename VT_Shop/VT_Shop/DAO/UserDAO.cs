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
            var result = db.Users.SingleOrDefault(x => x.UserName == username && x.Password == password);
            if(result == null)
                return 0;
            else
                return 1;
        }
        public User GetUser(string username) {
            return db.Users.SingleOrDefault(x => x.UserName == username);
        }

        public User GetUser(int id) {
            return db.Users.Find(id);
        }

        public bool changePassword(int id, string oldPassword, string newPassword) {
            User User = db.Users.Find(id);
            if(User.Password == oldPassword) {
                User.Password = newPassword;
                db.SaveChanges();
                return true;
            }
            return false;
        }

        public List<Loai> GetAllTenLoai() {
            return db.Loais.ToList();
        }

        public List<Tree> GetAllTree_LoaiId(int LoaiId) {
            return db.Trees.Where(x => x.LoaiId == LoaiId).ToList();
        }

        public List<Tree> GetNewTree() {
            return db.Trees.OrderByDescending(x => x.TreeId).Take(3).ToList();
        }

        public string GetTenLoai_LoaiId(int LoaiId) {
            var model = db.Loais.Find(LoaiId);
            return model.TenLoai;
        }

        public Tree GetTree_LoaiId_TreeId(int LoaiId, int TreeId) {
            return db.Trees.Where(x => x.LoaiId == LoaiId && x.TreeId == TreeId).FirstOrDefault();
        }

        public List<Tree> TimTree(string ten) {
            return db.Trees.Where(x => x.TenTree.Contains(ten)).ToList();
        }
        

        public void BanTree(int TreeId) {
            Tree Tree = db.Trees.Find(TreeId);
            Tree.TinhTrang = "Đã bán";
            db.SaveChanges();
        }
    }
}