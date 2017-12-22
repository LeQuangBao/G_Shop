using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace VT_Shop.Areas.Admin.Models
{
    public class CTHD
    {
        public int MaCTHD { get; set; }
        public int MaHD { get; set; }
        public string Ten { get; set; }
        public string SDT { get; set; }
        public int TreeId { get; set; }
        public string TenTree { get; set; }
        public string Hinh { get; set; }
        public Nullable<int> Gia { get; set; }
        public string DiaChi { get; set; }
        public DateTime? NgayGiaoHang { get; set; }
    }
}