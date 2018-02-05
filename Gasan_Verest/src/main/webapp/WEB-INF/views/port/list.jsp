<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PORTFOLIO</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
    <style type="text/css">
		<%@ include file="../css/header.css"%>
		<%@ include file="../css/project.css"%>
		<%@ include file="../css/footer.css"%>
	</style>
</head>
<script>
    $(function () {
        $(".grey").mouseover(function () {
            $(this).css("background", "rgba(0, 0, 0, .6");
            $(this).css("color", "rgba(255, 255, 255, 1");
            $(this).children("h3").css("opacity", "1");
        });
        $(".grey").mouseout(function () {
            $(this).css("background", "rgba(0, 0, 0, 0");
            $(this).css("color", "rgba(255, 255, 255, 0");
            $(this).children("h3").css("opacity", "0");
        });
    });

</script>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
    <div class="mid">
        <div class="title">
            <h2>PROJECT</h2>
        </div>
        <div class="content">
	        <c:forEach items="${ list }" var="item">
	        		<div class="img">
		                <img src="<c:url value="/upload/port/${ item.attachmentImg}"/>">
		                <a href="<c:url value='/port/detail?no=${ item.no }'/>">
			                <div class="grey">
			                    <h3>${ item.title }<br />
			                    ${ item.p_type}</h3>
			                </div>
		                </a>
	            </div>
	        </c:forEach>
   	 	</div>
   	  </div>
   	  
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>
