using System;
using VT_Shop.Models;

namespace VT_Shop.Controllers
{
    public class HoaDonDTO
    {
        public int MaHoaDon { get; set; }
        public int MaNguoiDung { get; set; }
        public DateTime? NgayMua { get; set; }
        public NguoiDung NguoiDung { get; set; }
        public int? TongTien { get; set; }
    }
}