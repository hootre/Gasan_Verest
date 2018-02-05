$(function () {
    $(".mypage").click(function () {
        $(".edit_page .input").val("");
        $(".secession_page .input").val("");
        $(".mypage_page").css("display", "block");
        $(".edit_page").css("display", "none");
        $(".secession_page").css("display", "none");
    });
    $(".edit").click(function () {
        $(".edit_page .input").val("");
        $(".secession_page .input").val("");
        $(".mypage_page").css("display", "none");
        $(".edit_page").css("display", "block");
        $(".secession_page").css("display", "none");
    });
    $(".secession").click(function () {
        $(".edit_page .input").val("");
        $(".secession_page .input").val("");
        $(".mypage_page").css("display", "none");
        $(".edit_page").css("display", "none");
        $(".secession_page").css("display", "block");
    });
});