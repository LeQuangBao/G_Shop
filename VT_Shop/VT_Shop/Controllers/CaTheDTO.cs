
using VT_Shop.Models;
using System;

namespace VT_Shop.Controllers {
    public partial class TreeDTO {

        public int TreeId { get; set; }
        public int LoaiId { get; set; }
        public string TenTree { get; set; }
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