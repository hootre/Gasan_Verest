<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>adminHeader</title>
</head>
<body>
<div class="mainmenu">
    <div class="logo"><a href="<c:url value="/"/>"><img src="<c:url value="/resources/img/logo.png"/>"></a></div>
    <div class="login">
 	    <sec:authorize access="!hasRole('ADMIN') and !hasRole('USER')">
        	<a href="<c:url value="/login"/>">Login</a> /
        	<a href="<c:url value="/join"/>">Sing Up</a>
        </sec:authorize>
		<sec:authorize access="hasRole('ADMIN')">
				<p><span>${ userInfo.v_name }</span>님 안녕하세요<br /></p>
		</sec:authorize>
    </div>
    <div class="toggle_menu"><h3>MENU</h3></div>
    <ul class="menu_top">
    	<li id="n5" class="nav_menu"><a href="<c:url value = '/video/list'/>"><h4>동영상관리</h4></a></li>
    	<li id="n4" class="nav_menu"><a href="<c:url value = '/list'/>"><h4>회원관리</h4></a></li>
    	<li id="n6" class="nav_menu"><a href="<c:url value = '/que/list'/>"><h4>문의관리</h4></a></li>
        <li id="n1"class="nav_menu"><a href="<c:url value='/pro/new'/>"><h4>프로젝트 글쓰기</h4></a></li>
        <li id="n2" class="nav_menu"><a href="<c:url value='/port/new'/>"><h4>포트폴리오 글쓰기</h4></a></li>
        <li id="n3" class="nav_menu"><a href="<c:url value='/sale/new'/>"><h4>판매영상 글쓰기</h4></a></li>
        
    </ul>
</div>
    <script>
	$(function(){
	    var link = document.location.href; 
	    var strurl = link.split('/');
	    if (strurl[4] == 'pro') {
	    	var element = document.getElementById('n1');
	    	element.classList.add('ative');
		}else if(strurl[4] == 'port'){
			var element = document.getElementById('n2');
	    	element.classList.add('ative');
		}else if(strurl[4] == 'sale'){
			var element = document.getElementById('n3');
	    	element.classList.add('ative');
		}else if(strurl[4] == 'list'){
			var element = document.getElementById('n4');
	    	element.classList.add('ative');
		}else if(strurl[4] == 'video'){
			var element = document.getElementById('n5');
	    	element.classList.add('ative');
		}else if(strurl[4] == 'que'){
			var element = document.getElementById('n6');
	    	element.classList.add('ative');
		}
	});
	</script>
</body>
</html>