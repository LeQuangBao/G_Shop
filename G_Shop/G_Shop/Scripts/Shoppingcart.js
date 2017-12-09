$(function () {
    $(".add-to-cart").click(function () {
        var id = $(this).attr("data-id");
        if (!$(this).hasClass("active")) {

            //$(this).after('<h2 style="display:inline"><label class="label label-success"><i class="glyphicon glyphicon-ok"><i/></span></h2>')
            $(this).addClass("btn btn-success active");
            $(this).after('<label class="btn btn-lg btn-success alertSuccess"><i class="glyphicon glyphicon-ok"><i/></span>');
        }
        
        $.ajax({
            url: "/Cart/Add",
            data: { id: id },
            success: function (response) {
                //alert("Thêm sản phẩm thành công.");
            }

        });
    });

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