<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<title>PORTFOLIO</title>
	<style type="text/css">
    	<%@ include file="../css/style.css"%>
		<%@ include file="../css/header.css"%>
		<%@ include file="../css/detail.css"%>
		<%@ include file="../css/lightslider.css"%>
		<%@ include file="../css/animate.css"%>
		<%@ include file="../css/footer.css"%>
	</style>
	<script>
		<%@ include file="../js/main.js"%>
		<%@ include file="../js/lightslider.js"%>
	</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
    <div class="mid">
        <div class="content_video">
	        <c:if test="${ !empty item.attachment }">
				<iframe width="100%" height="100%" src="${ item.attachment }?rel=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
			</c:if>
        </div>
        <div class="c_title">
            <h1>${ item.title }</h1>
            <h4 id="views">Views ${ item.views }</h4>
        </div>
        <div class="c_content">
       		<div class="adminBtn">
       		<sec:authorize access="hasRole('ADMIN')">
				<a href="<c:url value='/port/modify?no=${ item.no }'/>">수정하기</a>
				<a id="delete" href="<c:url value='/port/remove?no=${ item.no }'/>">삭제하기</a>
			</sec:authorize>
			</div>
			<h4>게시일 : ${item.regdate }</h4>
           <p>${ item.content }</p>
        </div>
        <div class="c_bottom">
            <h1>PORTFOLIO</h1>
	        <div class="slide">
	            <ul class="content-slider lightSlider" style="">
	            <c:forEach items="${ list }" var="item" varStatus="status">
	            		<li class="animate" data-animate="fadeInRight" data-duration="0.5s" data-delay="0.${ status.count }s">
		                    <a href="<c:url value='/port/detail?no=${ item.no }'/>">
		                    	<img src="<c:url value="/upload/port/${ item.attachmentImg}"/>" alt="NOT IMG" />
		                    	 <span class="list_title" id="title">${item.title}</span>
		                    </a>
	                	</li>
				</c:forEach> 
	            </ul>
	        </div>
    	</div>
    </div>
	<jsp:include page="../footer.jsp"></jsp:include>
</div>
<script>
	$(function(){
		$("#delete").on('click', function(){
			if (confirm('삭제하시겠습니까?')) {
				alert('삭제완료');
			}else{
				event.preventDefault();
			}
		});
	});
</script>
</body>
</html>