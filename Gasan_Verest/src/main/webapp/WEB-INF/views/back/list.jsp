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
			<th>평점</th>
			<th>내용</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${ list }" var="item">
			<tr>
				<td>${ item.back_no }</td>
				<td><a href="<c:url value='/back/detail?back_no=${ item.back_no}'/>">${ item.title}</a></td>
				<td>${ item.b_like}</td>
				<td>${ item.content}</td>
				<td>${ item.userInfo.v_name}</td>
				<td>${ item.regdate}</td>
			</tr>
		</c:forEach>
	</table>
	<a href='<c:url value='/back/new'></c:url>'>후기 작성</a>
	<a href='<c:url value='/'></c:url>'>메인으로 돌아가기</a>
</body>
</html>
