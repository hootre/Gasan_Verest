<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<style type="text/css">
<%@ include file="../css/login.css"%>
</style>
<title>로그인 페이지</title>
</head>
<body>
<div class="login_container">
    <div class="box">
        <a href="<c:url value="/"/>"><div class="logo"><img src="<c:url value="/upload/main/logo.png"/>" ></div></a>
        <form class="login_form" action="<c:url value="/login-processing"/>" method="post">
        <c:if test="${ param.action == 'error' }">
			<script>
				alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
			</script>
		</c:if>
            <div class="title">로그인</div>
            <input class="input" type="email" name="v_email" placeholder="email" style="ime-mode:inactive" required>
            <input class="input" type="password" name="v_password" placeholder="password" required>
            <input class="input" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <input class="submit" type="submit" value="로그인">
            <div class="bottom"><a href="<c:url value='/'/>">메인으로 </a><a href="<c:url value='/join'/>">회원가입</a></div>
        </form>
    </div>
</div>
</html>