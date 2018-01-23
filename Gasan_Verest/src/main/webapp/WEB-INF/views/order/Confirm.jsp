<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매하기</title>
</head>
<body>
	<c:if test="${ param.action == 'neword' }">
			<script>alert("구매 등록이 완료되었습니다.")</script>	
	</c:if>
	<h1>구매하기</h1>
	<dl>
		<dt>번호</dt>
		<dd>${ item.no }</dd>
		<dt>판매자</dt>
		<dd>${ item.userInfo.v_name }</dd>
		<dt>작성일</dt>
		<dd>${ item.regdate }</dd>
		<dt>제목</dt>
		<dd>${ item.title }</dd>
		<dt>가격</dt>
		<dd>${ item.price}</dd>
		<c:if test="${ !empty item.attachment }">
			<dt>첨부파일</dt>
			<dd>
			<iframe width="640" height="360" src="${ item.attachment }" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>
			</iframe>
			</dd>
		</c:if>
		<dt>계좌번호</dt>
		<dd>카카오뱅크 3333014765852 전동준</dd>
	</dl>
	<a href='<c:url value='/'></c:url>'>메인으로 돌아가기</a>
</body>
</html>