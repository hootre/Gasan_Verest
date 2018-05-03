<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Sale</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

    <style type="text/css">
		<%@ include file="../css/header.css"%>
		<%@ include file="../css/salelist.css"%>
		<%@ include file="../css/footer.css"%>
	</style>
	<script>
		<%@ include file="../js/salelist.js"%>
		<%@ include file="../js/list.js"%>
	</script>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
    <div class="mid">
        <div class="title">
            <h2>영상구매</h2>
        </div>
        <div class="content">
			<c:forEach items="${ list }" var="item">
	            <div class="list">
	                <a href="<c:url value='/sale/detail?no=${ item.no}'/>"><img src="<c:url value="/upload/sale/${ item.attachmentImg}"/>" alt=""></a>
	                <p class="list_content">${ item.title}<br> </span><fmt:formatNumber value="${item.price }" pattern="#,###" />원</p>
	                <a href="<c:url value='/bas/new?sale_no=${item.no }'/>" class="sale_cart">
	                    <p title="장바구니 추가"><i class="fa fa-shopping-cart"></i></p>
	                </a>
	                <a href="<c:url value='/order/new?sale_no=${item.no }'/>" onClick="window.open(this.href, '', 'width=1280, height=790'); return false;" class="sale_down">
	                    <p title="구매하기"><i class="fa fa-download"></i></p>
	                </a>
	            </div>
            </c:forEach>
        </div>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>