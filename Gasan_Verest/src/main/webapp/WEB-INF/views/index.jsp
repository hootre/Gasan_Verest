<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="http://maps.googleapis.com/maps/api/js"></script>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<style type="text/css">
<%@ include file="css/style.css"%>
<%@ include file="css/header.css" %>
<%@ include file="css/content.css" %>
<%@ include file="css/footer.css" %>
<%@ include file="css/lightslider.css" %>
</style>
<title>Verest</title>
</head>
<script>
<%@ include file="js/main.js"%>
<%@ include file="js/lightslider.js"%>
</script>
<body>
	<c:if test="${ param.type == 'delete' }">
		<script>alert("탈퇴완료")</script>
	</c:if>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
	<jsp:include page="main.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>