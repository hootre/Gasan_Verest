<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>회원 가입</title>
    <style type="text/css">
		<%@ include file="../css/join.css"%>
	</style>
</head>
<body>
<div class="login_container">
    <div class="box">
        <div class="logo"><a href="<c:url value="/"/>"><img src="<c:url value="/upload/main/logo.png"/>"></a></div>
        <form class="login_form" action="#" method="post">
            <h1 class="title">회원가입</h1>
            <div class="textbox">이메일 <span>*</span><input type="email" style="ime-mode:inactive" name="email" class="input" placeholder="email" required></div>
            <div class="textbox">비밀번호 <span>*</span><input type="password" name="password" class="input" placeholder="password" required></div>
            <div class="textbox">이름 <span>*</span><input type="text" name="name" class="input" placeholder="이름" required></div>
            <input class="input" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <input class="submit" type="submit" value="회원가입">
            <div class="bottom"><a href="#">메인으로 </a></div>
        </form>
    </div>
</div>
</body>
</html>
