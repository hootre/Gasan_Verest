<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>글 목록</title>
<script>
<%@ include file="../js/main.js"%>
</script>
</head>
<body>
	<h1>글 목록</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${ list }" var="item">
			<tr>
				<td>${ item.qu_no }</td>
				<td><a href="<c:url value='/que/detail?bakc_no=${ item.qu_no}'/>">${ item.title}</a></td>
				<td>${ item.content}</td>
				<td>${ item.userInfo.v_name}</td>
				<td>${ item.regdate}</td>
			</tr>
		</c:forEach>
	</table>
	<a href='<c:url value='/'></c:url>'>메인으로 돌아가기</a>
</body>
</html>
