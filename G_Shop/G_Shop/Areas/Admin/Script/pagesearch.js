$PageNo = 0;
$PageCount = 20;
$PageSize = 10;

function fnLoadPageCount() {
    var keyword = document.getElementById("keyword").value;
    $.ajax({
        url: "/Admin/" + "User" + "/PageCount1",
        data: {
            PageSize: $PageSize,
            keyword:keyword
        },
        success: function (response) {
            $PageCount = parseInt(response);
            fnLoadPage();
        }
    });
}
function fnLoadPage() {
    var keyword = document.getElementById("keyword").value;
    $.ajax({
        url: "/Admin/" + $Controller + "/LoadPage1",
        data: { PageNo: $PageNo, PageSize: $PageSize,keyword:keyword },
        success: function (response) {
            $("#page").html(response);
            $("#status").html(($PageNo + 1) + " of " + $PageCount);
        }
    });
}
$(document).ready(function () {
    $('#search').on('click', function () {
        fnLoadPageCount();
        $("ul.pager a:eq(0)").click(function () {
            $PageNo = 0;
            fnLoadPage();
            return false;
        });
        $("ul.pager a:eq(1)").click(function () {
            if ($PageNo > 0) {
                $PageNo--;
                fnLoadPage();
            }
            return false;
        });
        $("ul.pager a:eq(3)").click(function () {
            if ($PageNo < $PageCount - 1) {
                $PageNo++;
                fnLoadPage();
            }
            return false;
        });
        $("ul.pager a:eq(4)").click(function () {
            $PageNo = $PageCount - 1;
            fnLoadPage();
            return false;
        });
    });
});