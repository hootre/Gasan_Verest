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
		<dd>${ item.no }</dd>
		<dt>작성자</dt>
		<dd>${ item.userInfo.v_name }</dd>
		<dt>작성일</dt>
		<dd>${ item.regdate }</dd>
		<dt>제목</dt>
		<dd>${ item.title }</dd>
		<dt>내용</dt>
		<dd>${ item.content }</dd>
		<dt>조회수</dt>
		<dd>${ item.views }</dd>
		<dt>분류</dt>
		<dd>${ item.p_type }</dd>
		<c:if test="${ !empty item.attachment }">
			<dt>첨부파일</dt>
			<dd>
			<iframe width="640" height="360" src="${ item.attachment }" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>
			</iframe>
			</dd>
		</c:if>
		<c:if test="${ !empty filename }">
			<dt>첨부이미지</dt>
			<dd><a href="<c:url value='/pro/download?filename=${ filename }'/>">${ rfilename }</a></dd>
			<dd><img src="<c:url value='/upload/port/${ filename }'/>" alt="이미지실패" /></dd>
		</c:if>
	</dl>
	<a href='<c:url value='/'></c:url>'>메인으로 돌아가기</a>
	<a href="<c:url value='/port/modify?no=${ item.no }'/>">수정하기</a>
	<a href="<c:url value='/port/remove?no=${ item.no }'/>">삭제하기</a>
</body>
</html>