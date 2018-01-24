<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=0.7, maximum-scale=4.0, minimum-scale=0.5, user-scalable=no" />
    <title>index.jsp</title>
    <link rel="stylesheet" media="(min-width: 850px)" href="header_big.css">
    <link rel="stylesheet" media="(max-width: 850px)" href="header_small.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script>
    $(function () {
        $(".menu_open").click(function () {
            $(".t_right").animate({right : 0}, 300);
            $(".bggrey").css("display","block");
        });
        $(".menu_close, .bggrey").click(function () {
            $(".t_right").stop().css({right : "-300px"});
            $(".bggrey").css("display","none");
        });
    });
</script>
<body>
<div class="top_top">
    <div class="t_container">
        <p>상담 +82 10-3119-6195</p>
        <sec:authorize access="!hasRole('ADMIN') and !hasRole('USER')">
		<p><a href='<c:url value="/login"></c:url>'>로그인</a> / <a href="#">회원가입</a></p>
		</sec:authorize>
		<sec:authorize access="hasRole('ADMIN') or hasRole('USER')">
		<p>${ userInfo.v_name }님 안녕하세요
			  <a href='<c:url value="/mypage"></c:url>'>마이페이지</a></p>
	</sec:authorize>
    </div>
</div>
<div class="max_border"></div>
<div class="top_mid">
    <div class="t_container">
        <a href="#"><h1>로고</h1></a>
        <ul class="top_left">
            <li><a href="#">ABOUTUS</a></li>
            <li><a href="#">PROJECT</a></li>
            <li><a href='<c:url value="/port/list"></c:url>'>PORTFOLIO</a></li>
            <li><a href="#">SALE</a></li>
            <li><a href="#">VIEWS</a></li>
        </ul>
        <i class="fa fa-bars menu_open"></i>
    </div>
    <div class="t_right">
        <i class="fa fa-times menu_close"></i>
        <div class="open_header">
            <a href="#">로그인</a>
            <a href="#">회원가입</a>
        </div>
        <div class="min_border"></div>
        <ul class="open_menu">
            <a href="#"><li>회사소개</li></a>
            <a href="#"><li>프로젝트</li></a>
            <a href="#"><li>포트폴리오</li></a>
            <a href="#"><li>판매영상</li></a>
            <a href="#"><li>후기</li></a>
        </ul>
    </div>
</div>
<div class="bggrey"></div>
</body>
</html>
