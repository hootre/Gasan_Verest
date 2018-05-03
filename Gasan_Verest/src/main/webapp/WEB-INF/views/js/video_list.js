$(function () {
    $("#pro").click(function () {
        $("#pros").css("display", "block");
        $("#ports").css("display", "none");
        $("#sales").css("display", "none");
    });
    $("#port").click(function () {
        $("#pros").css("display", "none");
        $("#ports").css("display", "block");
        $("#sales").css("display", "none");
    });
    $("#sale").click(function () {
        $("#pros").css("display", "none");
        $("#ports").css("display", "none");
        $("#sales").css("display", "block");
    });
});