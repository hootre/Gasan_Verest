<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="http://maps.googleapis.com/maps/api/js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBoyWSy4PHBpSrKbkCSYQj3jI_CG3RXQ3c&callback=initMap">
</script>
<style type="text/css">
<%@ include file="css/style.css"%>
<%@ include file="css/header.css" %>
<%@ include file="css/content.css" %>
<%@ include file="css/footer.css" %>
<%@ include file="css/lightslider.css" %>
<%@ include file="css/question.css" %>
<%@ include file="css/animate.css" %>
</style>
<title>Verest</title>
<script>
<%@ include file="js/lightslider.js"%>
<%@ include file="js/main.js"%>
<%@ include file="js/scrolla.jquery.min.js"%>
</script>
</head>
<script>
$(function () {
    $('.animate').scrolla({
        mobile: false,
        once: false
    });
});
</script>
<body>
	<c:if test="${ param.type == 'delete' }">
		<script>alert("탈퇴완료")</script>
	</c:if>
	<c:if test="${ param.type == 'good' }">
		<script>alert("문의가 성공적으로 작성되었습니다.")</script>
	</c:if>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
	<jsp:include page="main.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>