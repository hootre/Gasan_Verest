<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>PORTFOLIO</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
    <style type="text/css">
    	<%@ include file="../css/style.css"%>
		<%@ include file="../css/header.css"%>
		<%@ include file="../css/portfolio.css"%>
		<%@ include file="../css/footer.css"%>
	</style>
	<script>
		<%@ include file="../js/list.js"%>
	</script>
</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
   	 <div class="mid">
        <div class="title">
            <h2>PORT</h2>
        </div>
        <ul class="category">
            <li title="all" style="color: #fff;">ALL</li>
            <li title="cate1">HER Series</li>
            <li title="cate2">360 VR Works</li>
            <li title="cate3">3D VR Dance</li>
            <li title="cate4">360 VR with Spatial Audio</li>
            <li title="cate5">Pocket Girls</li>
            <li title="cate6">인기 360 VR</li>
            <li title="cate7">2D M/V&Video works</li>
        </ul>
        <div class="content">
             <c:forEach items="${ list }" var="item">
		                <a href="<c:url value='/port/detail?no=${ item.no }'/>">
			                <div class="list <c:choose>
									<c:when test="${ item.p_type eq 'HER Series'}">
								        cate1
								    </c:when>
									<c:when test="${ item.p_type eq '360 VR Works'}">
								        cate2
								    </c:when>
									<c:when test="${ item.p_type eq '3D VR Dance'}">
								          cate3
								    </c:when>
									<c:when test="${ item.p_type eq '360 VR with Spatial Audio'}">
								          cate4
								    </c:when>
									<c:when test="${ item.p_type eq 'Pocket Girls'}">
								           cate5
								    </c:when>
								    <c:when test="${ item.p_type eq '인기 360 VR'}">
								           cate6
								    </c:when>
								    <c:when test="${ item.p_type eq '2D M/V&Video works'}">
								           cate7
								    </c:when>
									<c:otherwise>
								          
								    </c:otherwise>
								</c:choose>">
	                			<div class="imgbox">
		                			<img src="<c:url value="/upload/port/${ item.attachmentImg}"/>"  alt="">
		                			<div class="top_title clearfix">
			                			<span id="regdate">${item.regdate}</span>
			                			<span id="views">VIEWS ${item.views}</span>
			                		</div>	
			                	</div>
		                		<p id="title">${item.title }</p>
	            			</div>
	            		</a>
	        </c:forEach>
        </div>
    </div>
<jsp:include page="../footer.jsp"></jsp:include>
</div>
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
</body>
</html>
