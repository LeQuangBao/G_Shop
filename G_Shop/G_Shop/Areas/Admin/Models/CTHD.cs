using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace G_Shop.Areas.Admin.Models
{
    public class CTHD
    {
        public int MaCTHD { get; set; }
        public int MaHD { get; set; }
        public string TenNguoiDung { get; set; }
        public string SDT { get; set; }

        public string TenCaThe { get; set; }

        [DisplayFormat(DataFormatString = "{0:n0}", ApplyFormatInEditMode = true)]
        public Nullable<int> Gia { get; set; }
    }
}