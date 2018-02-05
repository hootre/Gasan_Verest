<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <style type="text/css">
		<%@ include file="../css/header.css"%>
		<%@ include file="../css/mypage.css"%>
	</style>
	<script   type="text/javascript" charset="utf-8">
		<%@ include file="../js/mypage.js" %>
	</script>
    <title>Login</title>
</head>
<body>
<div class="login_container mypage_page">
    <div class="box">
        <a href="<c:url value="/"/>"><div class="logo"><img src="<c:url value="/upload/main/logo.png"/>" ></div></a>
        <div class="login_form">
       		<c:if test="${ param.action == 'ok-modify' }">
				<script>alert("비밀번호가 변경되었습니다.")</script>
			</c:if>
            <div class="title">마이페이지</div>
            <h3>이름</h3>
            <p>${ item.v_name }</p>
            <h3>아이디</h3>
            <p>${ item.v_email }</p>
            <div class="bottom"><h5 class="edit">비밀번호수정</h5> / <h5 class="secession">회원탈퇴</h5></div>
            <a href="<c:url value='/logout'/>">개쩐다</a>
        </div>
    </div>
</div>
<div class="login_container edit_page">
    <div class="box">
        <a href="<c:url value="/"/>"><div class="logo"><img src="<c:url value="/upload/main/logo.png"/>" ></div></a>
        <form class="login_form" name="fmField1" action="<c:url value='/user/modify'/>" onsubmit="return checkForm1();" method="post">
        	<c:if test="${ param.action == 'error-password' }">
				<script>alert("비밀번호를 다시 확인하여 주십시오.")</script>
			</c:if>
			<c:if test="${ param.action == 'notok-password' }">
				<script>alert("새 비밀번호를 다시 확인하여 주십시오.")</script>
			</c:if>
            <div class="title">비밀번호변경</div>
            <input class="input" id="userPw1" name="oldPassword" type="password" placeholder="현재 비밀번호" required>
            <input class="input" id="userPw2" name="newPassword" type="password" placeholder="새 비밀번호" required>
            <input class="input" id="userPw3" name="okPassword" type="password" placeholder="비밀번호 확인" required>
            <input type="hidden" name="id" value="${ item.v_id }">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <input class="submit" type="submit" value="비밀번호변경">
            <div class="bottom"><h5 class="mypage">뒤로가기</h5></div>
        </form>
    </div>
</div>
<div class="login_container secession_page">
    <div class="box">
        <a href="<c:url value="/"/>"><div class="logo"><img src="<c:url value="/upload/main/logo.png"/>" ></div></a>
        <form class="login_form" name="fmField2" action="<c:url value='/user/delete'/>" onsubmit="return checkForm2();" method="post">
        	<c:if test="${ param.action == 'delete-password' }">
				<script>alert("기존 비밀번호를 다시 확인하여 주십시오.")</script>
			</c:if>
            <div class="title">회원 탈퇴</div>
            <input class="input" id="userPw4" name="password" type="password" placeholder="비밀번호 확인" required>
			<input type="hidden" name="id" value="${ item.v_id }">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <input class="submit" type="submit" value="회원탈퇴">
            <div class="bottom"><h5 class="mypage">뒤로가기</h5></div>
        </form>
    </div>
</div>
</body>
</html>