<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="top_top">
    <div class="t_container">
        <p>상담 +82 10-3119-6195</p>
    <sec:authorize access="!hasRole('ADMIN') and !hasRole('USER')">
		<p><a href='<c:url value="/login"></c:url>'>로그인</a> / <a href="<c:url value="/join"></c:url>">회원가입</a></p>
	</sec:authorize>
	<sec:authorize access="hasRole('ADMIN') or hasRole('USER')">
		<p>이메일: <span>${ userInfo.v_email }</span>/ 이름: <span>${ userInfo.v_name }</span>
			  <a href='<c:url value="/mypage"></c:url>'>마이페이지</a></p>
	</sec:authorize>
        
    </div>
</div>
<div class="top_border"></div>
<div class="top_mid">
    <div class="t_container">
        <a href="#"><h1>로고</h1></a>
        <ul class="top_left">
            <li>ABOUT US</li>
            <li>PROJECT</li>
            <li><a href='<c:url value="/port/list"></c:url>'>PORTFOLIO</a></li>
            <li>SALE</li>
        </ul>
    </div>
</div>