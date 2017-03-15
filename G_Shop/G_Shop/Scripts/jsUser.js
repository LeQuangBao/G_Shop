//Bảo
$(function () {
    $(".custom_datepicker").datepicker({
        changeMonth: true,
        changeYear: true
    });
    $(".custom_datepicker").datepicker("option", "dateFormat", "dd/mm/yy");
    $(".custom_datepicker").datepicker("option", "showAnim", "slideDown");
});
