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
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>첨부파일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${ list }" var="item">
			<tr>
				<td>${ item.no }</td>
				<td><a href="<c:url value='/detail?no=${ item.no }'/>">${ item.title }</a></td>
				<td>${ item.content }</td>
				<td>${ item.writer }</td>
				<td>${ item.regdate }</td>
				<td>${ item.attachment }</td>
				<td>${ item.views }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>