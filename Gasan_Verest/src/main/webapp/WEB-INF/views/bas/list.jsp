<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<title>글 목록</title>
	<style type="text/css">
    	<%@ include file="../css/style.css"%>
    	<%@ include file="../css/baslist.css"%>
	</style>
	<script>
		<%@ include file="../js/main.js"%>
	</script>
</head>
<body>
	<a href="<c:url value="/"/>" id="logo"><img src="<c:url value="/resources/img/logo.png"/>" ></a>
	<div class="list_box">
		<h1 id="title">장바구니</h1>
		<a href="javascript:history.back()" id="backbtn">뒤로가기</a>
		<a href="#" onclick="fn_userDel()" id="seleteDel">선택삭제</a>
		<input class="input" type="hidden" name="basket_no">
		<div class="content_box">
			<div class="list_top clearfix menu">
				<div class="top_content">
					<span class="imgbox">
					<input id="allCheck" type="checkbox" onclick="allChk(this);"/>
					제목</span>
					<span class="price">가격</span>
					<span class="regdate">날짜</span>
				</div>
			</div>
			<c:forEach items="${ list }" var="item">
	            <div class="list_top clearfix">
					<div class="top_content">
						<input name="RowCheck" type="checkbox" value="${item.basket_no}"/>
						<a class="imgbox"href="<c:url value='/order/new?sale_no=${item.sale_no }'/>" onClick="window.open(this.href, '', 'width=1280, height=790'); return false;">
						<span class="img"><img width="128px" height="72px" src="<c:url value="/upload/sale/${ item.sale.attachmentImg}"/>" alt=""></span>
						<span class="title">${item.sale.title }</span>
						</a>
						<span class="price"><fmt:formatNumber value="${item.sale.price }" pattern="#,###" />원</span>
						<span class="regdate">${item.regdate }</span>
					</div>
	            </div>
            </c:forEach>
		</div>
	</div>
	<script>
	  function allChk(obj){
	      var chkObj = document.getElementsByName("RowCheck");
	      var rowCnt = chkObj.length - 1;
	      var check = obj.checked;
	      if (check) {﻿
	          for (var i=0; i<=rowCnt; i++){
	           if(chkObj[i].type == "checkbox")
	               chkObj[i].checked = true; 
	          }
	      } else {
	          for (var i=0; i<=rowCnt; i++) {
	           if(chkObj[i].type == "checkbox"){
	               chkObj[i].checked = false; 
	           }
	          }
	      }
	  } 
	  
	  function fn_userDel(){

		  var userid = "";
		  var memberChk = document.getElementsByName("RowCheck");
		  var chked = false;
		  var indexid = false;
		  for(i=0; i < memberChk.length; i++){
		   if(memberChk[i].checked){
		    if(indexid){
		      userid = userid + '-';
		    }
		    userid = userid + memberChk[i].value;
		    indexid = true;
		   }
		  }
		  if(!indexid){
		   alert("삭제할 장바구니를 체크해 주세요");
		   return;
		  }
		  // 체크된 사용자 아이디를 '-'로 묶은 userid를  document.userForm.delUserid 의 value로 저장 
		  var agree=confirm("삭제 하시겠습니까?");
		     if (agree){
		         location.href="<c:url value='/bas/remove?no="+userid+"'/>";
		     } 
		  }
	  
	</script>
</body>
</html>