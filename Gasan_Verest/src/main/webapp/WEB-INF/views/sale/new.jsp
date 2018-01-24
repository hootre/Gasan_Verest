<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
</head>
<body>
	<h1>글쓰기</h1>
	<form action="<c:url value='/sale/new'/>" method="post" >
		<div>
			<label>작성자 <span>${ email }</span></label>
		</div>
		<div>
			<label>제목 <input type="text" name="title"></label>
		</div>
		<div>
			<label>가격 <input type="text" name="price"></label>
		</div>
		<div>
			<label>내용 <textarea name="content"></textarea></label>
		</div>
		<div>
			<label>첨부파일 <input type="text" name="attachment"></label>
		</div>
		<input type="hidden" name="writer" value="${ writer }">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit">
		<input type="reset">
		<a href='<c:url value='/'></c:url>'>메인으로 돌아가기</a>
	</form>
</body>
</html>