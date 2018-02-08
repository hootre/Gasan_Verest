<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세보기</title> 
</head>
<body>
	<c:if test="${ param.action == 'newbas' }">
			<script>alert("장바구니에 등록되었습니다.")</script>	
	</c:if>
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
		<dt>가격</dt>
		<dd>${ item.price}</dd>
		<dt>내용</dt>
		<dd>${ item.content }</dd>
		<dt>조회수</dt>
		<dd>${ item.views }</dd>
		<c:if test="${ !empty item.attachment }">
			<dt>첨부파일</dt>
			<dd>
			<iframe width="640" height="360" src="${ item.attachment }" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>
			</iframe>
			</dd>
		</c:if>
		<c:if test="${ !empty filename }">
			<dt>첨부이미지</dt>
			<dd><a href="<c:url value='/sale/download?filename=${ filename }'/>">${ rfilename }</a></dd>
			<dd><img src="<c:url value='/upload/sale/${ filename }'/>" alt="이미지실패" /></dd>
		</c:if>
	</dl>
	<a href='<c:url value='/'></c:url>'>메인으로 돌아가기</a>
	<a href="<c:url value='/sale/modify?no=${ item.no }'/>">수정하기</a>
	<a href="<c:url value='/sale/remove?no=${ item.no }'/>">삭제하기</a>
	<form action="<c:url value='/bas/new'/>" method="post">
		<input type="hidden" name="sale_no" value="${ item.no }">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit" value="장바구니 등록">
	</form>
	<form action="<c:url value='/order/new'/>" method="post">
		<input type="hidden" name="sale_no" value="${ item.no }">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit" value="구매하기">
	</form>
</body>
</html>
