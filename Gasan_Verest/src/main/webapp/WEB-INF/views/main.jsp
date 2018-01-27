<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="http://maps.googleapis.com/maps/api/js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>

<div class="mid">
        <div class="content_top">
            <iframe width="100%" height="100%" src="https://www.youtube.com/embed/oBJVi-vkpMM?rel=0&amp;autoplay=1&amp;loop=1;playlist=ZH8BYNwmR5Q&controls=0&showinfo=0&mute=1" data-audio="0" allowfullscreen="1" frameborder="0" allow="autoplay; encrypted-media" title="YouTube video player"></iframe>
            <div class="video_grey">
                <div class="f">
                    <h1>Virtual Reality</h1>
                    <p>Verest 360 VR은 360도 관련 다양한 영상 및 콘텐츠를 기획 제작하는 회사입니다.</p><br>
                </div>
            </div>
        </div>
    </div>
    <div class="content_mid">
        <h2 class="c_title">POTFOLIO</h2>
        <div class="slide">
            <button class="prev"></button>
            <button class="next"></button>
            <div class="slick">
                <c:forEach items="${ port }" var="item">
            		<c:if test="${ !empty item.attachmentImg }">
                	<div class="img">
                	<a href="<c:url value="/port/detail?no=${item.no }"/>">
                		<img src="<c:url value="/upload/port/${item.attachmentImg }"/>">
                	</a>
                	</div>
                	</c:if>
				</c:forEach>
            </div>
        </div>
    </div>
   	<div id="map"></div>