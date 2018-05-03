<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동영상목록</title>
    <style type="text/css">
    	<%@ include file="../css/style.css"%>
		<%@ include file="../css/header.css"%>
		<%@ include file="../css/admin.css"%>
		<%@ include file="../css/video_list.css"%>
		<%@ include file="../css/footer.css"%>
	</style>
	<script>
		<%@ include file="../js/main.js"%>
		<%@ include file="../js/video_list.js"%>
	</script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../adminheader.jsp"></jsp:include>
	<div class="container">
		<div class="btn_box clearfix">
			<a href="#" class="video_btn" id="pro">PRO</a>
			<a href="#" class="video_btn" id="port">PORT</a>
			<a href="#" class="video_btn" id="sale">SALE</a>
		</div>
	    <div class="mid">
	    <div class="video_box" id="pros">
	        <div class="title">
	            <h2>PROJECT 영상관리</h2>
	        </div>
	        <div class="user_list">
	        	<a href="#"  id="seleteDel" name="pro">선택삭제</a>
	            <table>
	                <tr class="list_top">
	                    <th>번호</th>
	                    <th colspan="2">제목</th>
	                    <th>조회수</th>
	                    <th>생성일</th>
	                    <th><input id="allCheck" type="checkbox" onclick="allChk(this);"/></th>
	                </tr>
	                <c:forEach items="${ pro }" var="item">
	                    <tr>
	                        <td>${ item.no }</td>
	                        <td>
	                        <a href="<c:url value='/pro/detail?no=${item.no }'/>" target="_blank">
	                        <img width="128px" height="72px" src="<c:url value="/upload/pro/${ item.attachmentImg}"/>" alt="">
	                        </a></td>
	                        <td><a  id="title" href="<c:url value='/pro/detail?no=${item.no }'/>" target="_blank">${ item.title}</a></td>
	                        <td>${ item.views }</td>
	                        <td>${ item.regdate}</td>
	                        <td><input name="RowCheck" type="checkbox" value="${item.no}"/></td>
	                    </tr>
	                </c:forEach>
	            </table>
	        </div>
	    </div>
	    <div class="video_box" id="ports">
	        <div class="title">
	            <h2>PORTFOLIO 영상관리</h2>
	        </div>
	        <div class="user_list">
	        	<a href="#" id="seleteDel" name="port">선택삭제</a>
	            <table>
	                <tr class="list_top">
	                    <th>번호</th>
	                    <th colspan="2">제목</th>
	                    <th>조회수</th>
	                    <th>생성일</th>
	                    <th><input id="allCheck" type="checkbox" onclick="allChk(this);"/></th>
	                </tr>
	                <c:forEach items="${ port }" var="item">
	                    <tr>
	                        <td>${ item.no }</td>
	                        <td>
	                        <a href="<c:url value='/port/detail?no=${item.no }'/>" target="_blank">
	                        <img width="128px" height="72px" src="<c:url value="/upload/port/${ item.attachmentImg}"/>" alt="">
	                        </a></td>
	                        <td><a  id="title" href="<c:url value='/port/detail?no=${item.no }'/>" target="_blank">${ item.title}</a></td>
	                        <td>${ item.views }</td>
	                        <td>${ item.regdate}</td>
	                        <td><input name="RowCheck" type="checkbox" value="${item.no}"/></td>
	                    </tr>
	                </c:forEach>
	            </table>
	        </div>
	   	</div>
	   	<div class="video_box" id="sales">
	    	<div class="title">
	            <h2>SALE 영상관리</h2>
	        </div>
	        <div class="user_list">
	        	<a href="#" id="seleteDel" name="sale">선택삭제</a>
	            <table>
	                <tr class="list_top">
	                    <th>번호</th>
	                    <th colspan="2">제목</th>
	                    <th>조회수</th>
	                    <th>생성일</th>
	                    <th><input id="allCheck" type="checkbox" onclick="allChk(this);"/></th>
	                </tr>
	                <c:forEach items="${ sale }" var="item">
	                    <tr>
	                        <td>${ item.no }</td>
	                        <td>
	                        <a href="<c:url value='/sale/detail?no=${item.no }'/>" target="_blank">
	                        <img width="128px" height="72px" src="<c:url value="/upload/sale/${ item.attachmentImg}"/>" alt="">
	                        </a></td>
	                        <td><a id="title" href="<c:url value='/sale/detail?no=${item.no }'/>" target="_blank">${ item.title}</a></td>
	                        <td>${ item.views }</td>
	                        <td>${ item.regdate}</td>
	                        <td><input name="RowCheck" type="checkbox" value="${item.no}"/></td>
	                    </tr>
	                </c:forEach>
	            </table>
	        </div>
	    </div>
	    </div>
	    <jsp:include page="../footer.jsp"></jsp:include>
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
	  
	  $("#seleteDel").on('click',function(){
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
		   alert("삭제할 동영상을 체크해 주세요");
		   return;
		  }
		  // 체크된 사용자 아이디를 '-'로 묶은 userid를  document.userForm.delUserid 의 value로 저장 
		  
		  var id = $(this).attr('name');
		  var agree=confirm("삭제 하시겠습니까?");
		     if (agree){
		         location.href="<c:url value='/"+id+"/remove?no="+userid+"'/>";
		     } 
			  
	  });
	  
		  $("#pro").click(function () {
		      $("#pros").css("display", "block");
		      $("#ports").css("display", "none");
		      $("#sales").css("display", "none");
		  });
		  $("#port").click(function () {
		      $("#pros").css("display", "none");
		      $("#ports").css("display", "block");
		      $("#sales").css("display", "none");
		  });
		  $("#sale").click(function () {
		      $("#pros").css("display", "none");
		      $("#ports").css("display", "none");
		      $("#sales").css("display", "block");
		  });
	</script>
</body>
</html>