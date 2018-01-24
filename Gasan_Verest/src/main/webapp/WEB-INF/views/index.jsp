<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
<%@ include file="css/style.css"%>
<%@ include file="css/header.css" %>
<%@ include file="css/content.css" %>
<%@ include file="css/footer.css" %>
</style>
<title>Verest</title>
</head>
<script>
    $(function () {
        $(".menu_open").click(function () {
            $(".t_right").animate({right : 0}, 300);
            $(".bggrey").css("display","block");
        });
        $(".menu_close, .bggrey").click(function () {
            $(".t_right").stop().css({right : "-300px"});
            $(".bggrey").css("display","none");
        });
        $(window).scroll(function() {
            var $el = $('.top_mid');

            if($(this).scrollTop() >= 200) $el.addClass('shown');
            else $el.removeClass('shown');
        });
        $(".slick").slick({
            infinite: true,
            slidesToShow: 3,
            slidesToScroll: 1,
            arrows: true,
            fade: false,
            prevArrow: '.prev',
            nextArrow: '.next',
        });
        $(".slick2").slick({
            infinite: true,
            slidesToShow: 3,
            slidesToScroll: 1,
            arrows: true,
            fade: false,
            prevArrow: '.prev2',
            nextArrow: '.next2',
        });
    });
</script>
<body>
	<c:if test="${ param.type == 'delete' }">
		<script>alert("탈퇴완료")</script>
	</c:if>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="main.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>