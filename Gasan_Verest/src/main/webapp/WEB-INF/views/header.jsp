<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>index.jsp</title>
</head>
<body>
<div class="mainmenu">
    <div class="logo"><a href="#"><img src="<c:url value="/upload/main/logo.png"/>"></a></div>
    <div class="login">
 	    <sec:authorize access="!hasRole('ADMIN') and !hasRole('USER')">
        <a href="<c:url value="/login"/>">Login</a> /
        <a href="<c:url value="/join"/>">Sing Up</a>
        </sec:authorize>
        <sec:authorize access="hasRole('USER') and !hasRole('ADMIN')">
		<p>${ userInfo.v_name }님 안녕하세요
			  <a href='<c:url value="/user/mypage"></c:url>'>마이페이지</a></p>
			  <a href="<c:url value='/logout'/>">로그아웃</a>
		</sec:authorize>
		<sec:authorize access="hasRole('ADMIN')">
		<p>${ userInfo.v_name }님 안녕하세요
			  <a href='<c:url value="/admin"></c:url>'>관리자 페이지</a></p>
			  <a href="<c:url value='/logout'/>">로그아웃</a>
		</sec:authorize>
    </div>
    <ul class="menu_top">
        <li class="nav_menu"><a href="#">ABOUT US</a></li>
        <li class="nav_menu"><a href="<c:url value="/pro/list"/>">PROJECT</a></li>
        <li class="nav_menu"><a href="<c:url value="/port/list"/>">PORTFOLIO</a></li>
        <li class="nav_menu"><a href="<c:url value="/sale/list"/>">SALE</a></li>
        <li class="nav_menu"><a href="<c:url value="/back/list"/>">REVIEWS</a></li>
        <li class="nav_menu"><a href="<c:url value='/que/new'/>">QUESTION</a></li>
    </ul>
</div>
</body>
</html>
