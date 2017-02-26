using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace G_Shop.Areas.Admin.Models
{
    public class CTHD
    {
        public int MaCTHD { get; set; }
        public int MaHD { get; set; }
        public string TenCaThe { get; set; }
        public Nullable<int> Gia { get; set; }
    }
}