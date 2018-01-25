<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>
</head>
<body>
	<h1>글 목록</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>권한</th>
			<th>생성일</th>
		</tr>
		<c:forEach items="${ list }" var="item">
			<tr>
				<td>${ item.v_id }</td>
				<td>${ item.v_name}</td>
				<td>${ item.v_email}</td>
				<td>
				<c:forEach var="list" items="${ item.userTypes }">
				${ list.type }
				</c:forEach>
				</td>
				<td>${ item.v_regdate}</td>
			</tr>
		</c:forEach>
	</table>
	<a href='<c:url value='/admin'></c:url>'>관리자 페이지로 돌아가기</a>
</body>
</html>
