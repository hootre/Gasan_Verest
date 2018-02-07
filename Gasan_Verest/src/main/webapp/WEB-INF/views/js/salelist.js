$(function () {
    $(".list").mouseover(function () {
        $(this).children(".list_content").css("display","none");
        $(this).children(".sale_cart").css("display","block");
        $(this).children(".sale_down").css("display","block");
    });
    $(".list").mouseout(function () {
        $(this).children(".sale_cart").css("display","none");
        $(this).children(".sale_down").css("display","none");
        $(this).children(".list_content").css("display","block");
    });
});