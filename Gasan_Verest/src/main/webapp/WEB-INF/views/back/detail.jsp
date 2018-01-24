<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세보기</title>
</head>
<body>
	<h1>글 상세보기</h1>
	<dl>
		<dt>번호</dt>
		<dd>${ item.back_no }</dd>
		<dt>작성자</dt>
		<dd>${ item.writer }</dd>
		<dt>작성일</dt>
		<dd>${ item.regdate }</dd>
		<dt>제목</dt>
		<dd>${ item.title }</dd>
		<dt>내용</dt>
		<dd>${ item.content }</dd>
	</dl>
	<a href='<c:url value='/'></c:url>'>메인으로 돌아가기</a>
	<a href="<c:url value='/back/modify?back_no=${ item.back_no }'/>">수정하기</a>
	<a href="<c:url value='/back/remove?back_no=${ item.back_no }'/>">삭제하기</a>
</body>
</html>