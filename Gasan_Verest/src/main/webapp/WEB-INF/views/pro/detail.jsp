<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>PORJECT</title>
    <style type="text/css">
		<%@ include file="../css/header.css"%>
		<%@ include file="../css/detail.css"%>
		<%@ include file="../css/footer.css"%>
	</style>
</head>
<body>
<body>

<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
    <div class="mid">
        <div class="content_video">
	        <c:if test="${ !empty item.attachment }">
				<iframe width="100%" height="600px" src="${ item.attachment }" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
			</c:if>
        </div>
        <div class="c_title">
            <h3>${ item.title }</h3>
            <h4>${ item.views }</h4>
        </div>
        <div class="c_content">
           ${ item.content }
			<a href="<c:url value='/pro/modify?no=${ item.no }'/>">수정하기</a>
			<a href="<c:url value='/pro/remove?no=${ item.no }'/>">삭제하기</a>
        </div>
    </div>
	<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>