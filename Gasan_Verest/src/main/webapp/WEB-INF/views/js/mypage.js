function checkForm1() {
    var temp = document.fmField1.userPw1.value.replace(/ /gi,'');
    var temp2;
    if(temp == ""){
        alert('현재 비밀번호를 입력하세요');
        userPw1.focus();
        return false;
    }

    temp = document.fmField1.userPw2.value.replace(/ /gi,'');
    if(temp == ""){
        alert('새 비밀번호를 입력하세요');
        userPw2.focus();
        return false;
    }

    temp = document.fmField1.userPw3.value.replace(/ /gi,'');
    if(temp == ""){
        alert('비밀번호 확인을 입력하세요');
        userPw3.focus();
        return false;
    }
    temp = document.fmField1.userPw2.value;
    temp2 = document.fmField1.userPw3.value;

    if(temp != temp2){
        alert('새 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
        userPw3.focus();
        return false;
    }
}

function checkForm2() {
    var temp = document.fmField2.userPw4.value.replace(/ /gi,'');
    if(temp == ""){
        alert('비밀번호를 입력하세요');
        userPw4.focus();
        return false;
    }
}

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