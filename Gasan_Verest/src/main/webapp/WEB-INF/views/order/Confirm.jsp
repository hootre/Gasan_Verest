<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>구매하기</title>
	<style type="text/css">
    	<%@ include file="../css/style.css"%>
		<%@ include file="../css/order.css"%>
	</style>
	<script>
	<%@ include file="../js/main.js"%>
	</script>
</head>
<body>
<div class="video_container">
	<iframe id="movie" width="1280" height="720" src="${ item.attachment }" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>
	</iframe>
	<div id="warning">입금 완료시 파일첨부하여 메일로 발송드립니다.</div>
	<div class="header">
		<h1 class="title">${item.title}</h1>
	</div>
	<div class="header_right">
		<h4 id="price">판매가<span><fmt:formatNumber value="${item.price }" pattern="#,###" /></span>원</h4>
		<h4 id="account">카카오뱅크 <span>3333014746801</span> 예금주 <span>전동준</span></h4>
	</div>
</div>

</html>