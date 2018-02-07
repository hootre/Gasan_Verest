<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="mid">
        <div class="content_top">
            <iframe width="100%" height="100%" src="https://www.youtube.com/embed/0vaW8O_KXYY?rel=0&amp;autoplay=1&amp;loop=1;playlist=0vaW8O_KXYY&controls=0&showinfo=0&mute=1" data-audio="0" allowfullscreen="1" frameborder="0" allow="autoplay; encrypted-media" title="YouTube video player"></iframe>
            <div class="video_grey">
                <div class="f">
                    <h1>Virtual Reality</h1>
                    <p>Verest 360 VR은 360도 관련 다양한 영상 및 콘텐츠를 기획 제작하는 회사입니다.</p><br>
                </div>
            </div>
        </div>
    </div>
            <div class="nav_top">
    </div>
    <div class="content_mid">
        <h2 class="c_title">HER Series</h2>
        <div class="slide_line"></div>
        <div class="slide">
            <ul class="content-slider lightSlider" style="">
            <c:forEach items="${ port }" var="item">
            	<c:if test="${ item.p_type eq 'HER Series'}">
            		<li>
	                    <a href="<c:url value='/port/detail?no=${ item.no }'/>">
	                    	<img src="<c:url value="/upload/port/${ item.attachmentImg}"/>" alt="NOT IMG" />
	                    	<p>${item.title}</p>
	                    </a>
                	</li>
            	</c:if>
			</c:forEach> 
            </ul>
        </div>
        <h2 class="c_title">360 VR Works</h2>
        <div class="slide_line"></div>
        <div class="slide">
            <ul class="content-slider lightSlider" style="">
            <c:forEach items="${ port }" var="item">
            	<c:if test="${ item.p_type eq '360 VR Works'}">
            		<li>
	                    <a href="<c:url value='/port/detail?no=${ item.no }'/>">
	                    	<img src="<c:url value="/upload/port/${ item.attachmentImg}"/>" alt="NOT IMG" />
	                    	<p>${item.title}</p>
	                    </a>
                	</li>
            	</c:if>
			</c:forEach> 
            </ul>
        </div>
        <h2 class="c_title">3D VR Dance</h2>
        <div class="slide_line"></div>
        <div class="slide">
            <ul class="content-slider lightSlider" style="">
            <c:forEach items="${ port }" var="item">
            	<c:if test="${ item.p_type eq '3D VR Dance'}">
            		<li>
	                    <a href="<c:url value='/port/detail?no=${ item.no }'/>">
	                    	<img src="<c:url value="/upload/port/${ item.attachmentImg}"/>" alt="NOT IMG" />
	                    	<p>${item.title}</p>
	                    </a>
                	</li>
            	</c:if>
			</c:forEach> 
            </ul>
        </div>
        <h2 class="c_title">360 VR with Spatial Audio</h2>
        <div class="slide_line"></div>
        <div class="slide">
            <ul class="content-slider lightSlider" style="">
            <c:forEach items="${ port }" var="item">
            	<c:if test="${ item.p_type eq '360 VR with Spatial Audio'}">
            		<li>
	                    <a href="<c:url value='/port/detail?no=${ item.no }'/>">
	                    	<img src="<c:url value="/upload/port/${ item.attachmentImg}"/>" alt="NOT IMG" />
	                    	<p>${item.title}</p>
	                    </a>
                	</li>
            	</c:if>
			</c:forEach> 
            </ul>
        </div>
    </div>
        <div class="question">
        <div class="box">
            <form class="question_form" action="<c:url value='/que/new'/>" method="post">
                <div class="title"><h2>문의하기</h2></div>
                <input class="input" type="text" name="title" placeholder="제목" required>
                <textarea name="content" class="area" placeholder="메세지" cols="30" rows="8"style="resize: none;" required></textarea>
				<input type="hidden" name="writer" value="${ userInfo.v_id }">
                <input class="input" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <input class="submit" type="submit" value="문의하기">
            </form>
        </div>
    </div>
    <div class="map_nav">
        <div id="map"></div>
        <div class="map_content">
            <h2>찾아오시는 길</h2>
            <h3>주소</h3>
            <p> 서울특별시 성동구 마장동 782-4 <br> </p>
            <h3>영업시간</h3>
            <p>
                월요일	오전 10:00~오후 7:00 <br>
                화요일	오전 10:00~오후 7:00 <br>
                수요일	오전 10:00~오후 7:00 <br>
                목요일	오전 10:00~오후 7:00 <br>
                금요일	오전 10:00~오후 7:00 <br>
                토요일	휴무일 <br>
                일요일	휴무일 <br>
            </p>
        </div>
    </div>
   	<div id="map"></div>