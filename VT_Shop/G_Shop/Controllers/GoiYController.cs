using G_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace G_Shop.Controllers
{
    public class GoiYController : Controller
    {
        GShopEntities2 db = new GShopEntities2();

        [HttpGet]
        public JsonResult getGoiY() {
            var list = (from n in db.GoiYs
                        select new GoiYDTO {
                            id = n.id,
                            C1 = n.C1,
                            C2 = n.C2
                        }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }

      
    }
}
