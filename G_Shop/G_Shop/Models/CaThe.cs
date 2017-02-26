﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace G_Shop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class CaThe
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CaThe()
        {
            this.ChiTietHoaDons = new HashSet<ChiTietHoaDon>();
        }
    
        public int MaCaThe { get; set; }
        public int MaLoai { get; set; }

        [Display(Name = "Tên:")]
        public string TenCaThe { get; set; }

        [Display(Name = "Mô tả:")]
        public string MoTa { get; set; }

        [Display(Name = "Tuổi:")]
        public Nullable<int> Tuoi { get; set; }

        [Display(Name = "Giá:")]
        public Nullable<int> Gia { get; set; }

        [Display(Name = "Tình trạng:")]
        public string TinhTrang { get; set; }

        [Display(Name = "Hình ảnh:")]
        public string HinhAnh { get; set; }
    
        public virtual Loai Loai { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; }
    }
}
