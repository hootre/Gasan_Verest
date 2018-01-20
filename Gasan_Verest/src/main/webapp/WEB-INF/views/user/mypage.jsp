<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 정보</title>
</head>
<body>
	<h1>사용자 정보</h1>
	<div>
		<h2>이메일</h2>
		<p>${ item.v_email }</p>
		<h2>이름</h2>
		<p>${ item.v_name }</p>
		<h2>권한</h2>
		<p>
		<c:forEach var="list" items="${ item.userTypes }">
				<div>${ list.type }</div>
			</c:forEach>
		</p>
		<a href="<c:url value='/user/modify'/>">수정하기</a>
		<a href="<c:url value='/user/delete'/>">회원 탈퇴</a>
		<a href="<c:url value='/logout'/>">로그아웃</a>
		<a href = "<c:url value = '/'/>">홈으로</a>
	</div>
</body>
</html>