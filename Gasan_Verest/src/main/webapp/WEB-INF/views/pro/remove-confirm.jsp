<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>삭제 확인</title>
<script>
<%@ include file="../js/main.js"%>
</script>
</head>
<body>
	<h1>삭제 확인</h1>
	<p>정말로 삭제하시겠습니까?</p>
	<form action="<c:url value='/pro/remove'/>" method="post">
		<c:if test="${ param.action == 'error-password' }">
			<p>비밀번호를 잘못 입력했습니다.</p>
		</c:if>
		<input type="hidden" name="no" value="${ no }">
		<div>
			<label>비밀번호 <input type="password" name="v_password"></label>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit" value="삭제하기">
	</form>
	<a href='<c:url value='/'></c:url>'>메인으로 돌아가기</a>
</body>
</html>