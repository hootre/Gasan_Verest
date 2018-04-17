<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>index</title>
</head>
<body>
<div class="mainmenu">
    <div class="logo"><a href="<c:url value="/"/>"><img src="<c:url value="/upload/main/logo.png"/>"></a></div>
    <div class="login">
 	    <sec:authorize access="!hasRole('ADMIN') and !hasRole('USER')">
        	<a href="<c:url value="/login"/>">Login</a> /
        	<a href="<c:url value="/join"/>">Sing Up</a>
        </sec:authorize>
        <sec:authorize access="hasRole('USER') and !hasRole('ADMIN')">
				<p><span>${ userInfo.v_name }</span><span style="color : #aaa">님 안녕하세요</span></p>
		</sec:authorize>
		<sec:authorize access="hasRole('ADMIN')">
				<p><span>${ userInfo.v_name }</span><span style="color : #aaa">님 안녕하세요</span></p>
		</sec:authorize>
    </div>
    <div class="toggle_menu"><h3>MENU</h3></div>
    <ul class="menu_top">
    	<sec:authorize access="hasRole('USER') and !hasRole('ADMIN')">
			<li class="nav_menu"><a href='<c:url value="/user/mypage"></c:url>'><h4 style="color: #FFC81E;">USER</h4></a></li>
		</sec:authorize>
		<sec:authorize access="hasRole('ADMIN')">
			<li class="nav_menu"><a href='<c:url value='/pro/new'/>'><h4 style="color: #FFC81E;">ADMIN</h4></a></li>
		</sec:authorize>
        <li class="nav_menu"><a href="<c:url value="/pro/list"/>"><h4>PROJECT</h4></a></li>
        <li class="nav_menu"><a href="<c:url value="/port/list"/>"><h4>PORTFOLIO</h4></a></li>
        <li class="nav_menu"><a href="<c:url value="/sale/list"/>"><h4>SALE</h4></a></li>
        <li class="nav_menu"><a href="<c:url value="/back/list"/>"><h4>REVIEW</h4></a></li>
        <sec:authorize access="hasRole('USER') and !hasRole('ADMIN')">
        	<li class="nav_menu"><a href="<c:url value="/logout"/>"><h4>LOGOUT</h4></a></li>
		</sec:authorize>
    </ul>
</div>
</body>
</html>
