<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
<style type="text/css">
<%@ include file="css/style.css"%>
<%@ include file="css/header.css" %>
<%@ include file="css/content.css" %>
<%@ include file="css/footer.css" %>
</style>
<title>Verest</title>
</head>
<script>
    function initMap() {
        var uluru = {lat: 37.5664685, lng: 127.04425040000001};
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 16,
            center: uluru
        });
        var marker = new google.maps.Marker({
            position: uluru,
            map: map
        });
    }
    $(function () {
        $(".slide").mouseover(function () {
           $(".slick-arrow").css("background", "rgba(255, 255, 255, 0.8)");
           $(".prev").toggleClass('opa');
           $(".next").toggleClass('opa');
        });
        $(".slide").mouseout(function () {
            $(".slick-arrow").css("background", "rgba(255, 255, 255, 0)");
            $(".prev").toggleClass('opa');
            $(".next").toggleClass('opa');
        });
        $(".slick").slick({
            infinite: true,
            slidesToShow: 3,
            slidesToScroll: 1,
            arrows: true,
            fade: false,
            prevArrow: '.prev',
            nextArrow: '.next'
        });
    })
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