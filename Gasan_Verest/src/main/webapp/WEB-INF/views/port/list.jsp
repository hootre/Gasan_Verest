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
			<th>첨부이미지</th>
			<th>조회수</th>
			<th>분류</th>
		</tr>
		<c:forEach items="${ list }" var="item">
			<tr>
				<td>${ item.no }</td>
				<td><a href="<c:url value='/port/detail?no=${ item.no }'/>">${ item.title }</a></td>
				<td>${ item.content }</td>	
				<td>${ item.userInfo.v_name  }</td>
				<td>${ item.regdate }</td>
				<td>${ item.attachment}</td>
				<td>${ item.attachmentImg}</td>
				<td>${ item.views}</td>
				<td>${ item.p_type}</td>
			</tr>
		</c:forEach>
	</table>
	<a href='<c:url value='/port/new'></c:url>'>글쓰기</a>
	<a href='<c:url value='/'></c:url>'>메인으로 돌아가기</a>
</body>
</html>
