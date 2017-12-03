
using G_Shop.Models;
using System;

namespace G_Shop.Controllers {
    public partial class CaTheDTO {

        public int MaCaThe { get; set; }
        public int MaLoai { get; set; }
        public string TenCaThe { get; set; }
        public string MoTa { get; set; }
        public DateTime NgaySinh { get; set; }
        public int? GiaMua { get; set; }
        public int? GiaBan { get; set; }
        public int? KhuyenMai { get; set; }
        public string TinhTrang { get; set; }
        public string HinhAnh { get; set; }
        public string Video { get; set; }

    }
}