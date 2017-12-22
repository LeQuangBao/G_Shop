using System;
using VT_Shop.Models;

namespace VT_Shop.Controllers
{
    public class HoaDonDTO
    {
        public int HoaDonId { get; set; }
        public int UserId { get; set; }
        public DateTime? NgayMua { get; set; }
        public User User { get; set; }
        public int? TongTien { get; set; }
    }
}