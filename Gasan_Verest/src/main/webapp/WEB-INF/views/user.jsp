<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나와라 사용자들아!</title>
</head>
<body>
	<h1>사용자 목록</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이메일</th>
			<th>이름</th>
			<th>비밀번호</th>
		</tr>
			<tr>
				<td>${ list.v_id }</td>
				<td>${ list.v_email }</td>
				<td>${ list.v_name }</td>
				<td>${ list.v_password }</td>
			</tr>
	</table>
</body>
</html>