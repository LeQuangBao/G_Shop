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

    }
}