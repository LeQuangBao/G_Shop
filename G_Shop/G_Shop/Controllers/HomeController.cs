using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using G_Shop.DAO;
namespace G_Shop.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var model = new UserDAO().GetNewCaThe();
            return View(model);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult _Category()
        {
            var model = new UserDAO().GetAllTenLoai();
            return PartialView(model);
        }
        
        public ActionResult ThuCung(int MaLoai)
        {
            var model = new UserDAO().GetAllCaThe_MaLoai(MaLoai);
            ViewBag.TenLoai = new UserDAO().GetTenLoai_MaLoai(MaLoai);
            return View(model);
        }

        public ActionResult ChiTiet(int MaLoai, int MaCaThe)
        {
            var model = new UserDAO().GetCaThe_MaLoai_MaCaThe(MaLoai,MaCaThe);
            return View(model);
        }
        
        public ActionResult Tim(string ten)
        {
            var model = new UserDAO().TimCaThe(ten);
            return View(model);
        }

    }
}