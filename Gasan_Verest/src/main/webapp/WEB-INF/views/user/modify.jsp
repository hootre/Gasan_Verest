<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 정보 수정</title>
</head>
<body>
	<h1>수정</h1>
	<form action='<c:url value='/user/modify'/>' method="post">
		<c:if test="${ param.action == 'error-password' }">
			<p>기존 비밀번호를 잘못 입력했습니다.</p>
		</c:if>
		<div>
			<label>이메일 ${ item.v_email }</label>
		</div>
		<div>
			<label>기존 비밀번호 <input type="password" name="oldPassword"></label>
		</div>
		<div>
			<label>새 비밀번호 <input type="password" name="newPassword"></label>
		</div>
		<div>
			<label>이름 <input type="text" name="name" value="${ item.v_name }"></label>
		</div>
		<input type="hidden" name="id" value="${ item.v_id }">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit">
		<input type="reset">
		<a href="<c:url value='/user/mypage'/>">마이페이지로 이동</a>
	</form>
</body>
</html>