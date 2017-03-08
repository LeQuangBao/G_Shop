using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using G_Shop.Models;
    public class ShoppingCart
    {

    /// <summary>
    /// Truy xuất giỏ hàng từ Session
    /// </summary>
    public static ShoppingCart Cart
    {
        get
        {
            var cart = HttpContext.Current.Session["Cart"] as ShoppingCart;
            if (cart == null)
            {
                cart = new ShoppingCart();
                HttpContext.Current.Session["Cart"] = cart;
            }
            return cart;
        }
    }

    /// <summary>
    /// Danh sách mặt hàng đã chọn
    /// </summary>
    public List<CaThe> Items = new List<CaThe>();

    /// <summary>
    /// Lấy số lượng hàng hóa trong giỏ
    /// </summary>
    //public int Count
    //{
    //    get
    //    {
    //        if (Items.Count > 0)
    //        {
    //            return Items.Count(p=>p.M);
    //        }
    //        return 0;
    //    }
    //}

    ///// <summary>
    ///// Tính tổng số tiền của giỏ hàng
    ///// </summary>
    //public double Amount
    //{
    //    get
    //    {
    //        if (Items.Count > 0)
    //        {
    //            return Items.Sum(p => p.Quantity * p.UnitPrice * (1 - p.Discount));
    //        }
    //        return 0;
    //    }
    //}

    /// <summary>
    /// Chọn hàng (bỏ hàng vào giỏ)
    /// </summary>
    /// <param name="Id">Mã mặt hàng được chọn</param>
    public void Add(int Id, int quantity = 1)
    {
        try
        {
            var p = Items.Single(i => i.MaCaThe == Id);
        }
        catch // Chưa có trong giỏ -> Lấy từ DB
        {
            using (var db = new GShopEntities3())
            {
                var p = db.CaThes.Find(Id);
                Items.Add(p);
            }
        }
    }

    /// <summary>
    /// Xóa hàng khỏi giỏ
    /// </summary>
    /// <param name="Id">Mã mặt hàng bị xóa</param>
    public void Remove(int Id)
    {
        var p = Items.Single(i => i.MaCaThe == Id);
        Items.Remove(p);
    }

    /// <summary>
    /// Xóa sạch giỏ hàng
    /// </summary>
    public void Clear()
    {
        Items.Clear();
    }
}
