using System;

namespace VT_Shop.Areas.Admin.Controllers
{
    public class UserDTO
    {
        public int UserId { get; set; }
        public string Email { get; set; }
        public string GioiTinh { get;  set; }
        public string Password { get; set; }
        public DateTime? NgaySinh { get;  set; }
        public string SoDienThoai { get; set; }
        public string UserName { get; set; }
        public string VaiTro { get; set; }
        public string Ten { get; set; }
        public string DiaChi { get;  set; }
    }
}