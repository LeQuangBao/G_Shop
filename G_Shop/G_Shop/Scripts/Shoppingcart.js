$(function () {
    $(".add-to-cart").click(function () {
        var id = $(this).attr("data-id");
     
        $.ajax({
            url: "/Cart/Add",
            data: { id: id },
            success: function (response) {
            alert("Thêm sản phẩm thành công.");
              
                //$(".nn-cart #cnt").html(response.Count);
                //$(".nn-cart #amt").html(response.Amount);
            }
             
        });
    });

        //    // Hiệu ứng giỏ hàng
        //    var src = $("#" + id).attr("src");
        //    var css = ".cart-fly {background-image: url('" + src + "');background-size:100% 100%;}";
        //    $("#cart-fly").html(css);

        //    opts = { to: ".nn-cart img", className: "cart-fly" }
        //    $("#" + id).effect("transfer", opts, 1000);
        //});

        $(".remove-from-cart").click(function () {
            var id = $(this).attr("data-id");
            $.ajax({
                url: "/Cart/Remove",
                data: { id: id },
                success: function (response) {
                    //$(".nn-cart #cnt").html(response.Count);
                    //$(".nn-cart #amt").html(response.Amount);
                }
            });
            // Xóa <tr> chứa sản phẩm bị xóa
            $(this).parents("tr").hide(200);
            return false;
            //});
        });
});