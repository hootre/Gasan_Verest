<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
    <title>USER</title>
    <style type="text/css">
		<%@ include file="../css/header.css"%>
		<%@ include file="../css/userlist.css"%>
		<%@ include file="../css/admin.css"%>
		<%@ include file="../css/footer.css"%>
	</style>
	<script>
	<%@ include file="../js/main.js"%>
	</script>
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<jsp:include page="../adminheader.jsp"></jsp:include>
<div class="container">
    <div class="mid">
        <div class="title">
            <h2>회원관리</h2>
        </div>
        <div class="user_list">
        	<a href="#" onclick="fn_userDel()" id="seleteDel">선택삭제</a>
            <table>
                <tr class="list_top">
                    <th>번호</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>권한</th>
                    <th>생성일</th>
                    <th><input id="allCheck" type="checkbox" onclick="allChk(this);"/></th>
                </tr>
                <c:forEach items="${ list }" var="item">
                    <tr>
                        <td>${ item.v_id }</td>
                        <td>${ item.v_name}</td>
                        <td>${ item.v_email}</td>
                        <td>
                            <c:forEach var="list" items="${ item.userTypes }">
                                ${ list.type }
                            </c:forEach>
                        </td>
                        <td>${ item.v_regdate}</td>
                        <td><input name="RowCheck" type="checkbox" value="${item.v_id}"/></td>
                    </tr>
                </c:forEach>
            </table>
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
		   alert("삭제할 회원을 체크해 주세요");
		   return;
		  }
		  // 체크된 사용자 아이디를 '-'로 묶은 userid를  document.userForm.delUserid 의 value로 저장 
		  var agree=confirm("삭제 하시겠습니까?");
		     if (agree){
		         location.href="<c:url value='/user/delete?v_id="+userid+"'/>";
		     } 
		  }
	</script>
</body>
</html>