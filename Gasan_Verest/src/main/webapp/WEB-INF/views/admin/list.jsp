<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>USER</title>
    <style type="text/css">
		<%@ include file="../css/header.css"%>
		<%@ include file="../css/userlist.css"%>
		<%@ include file="../css/footer.css"%>
	</style>
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
            <table>
                <tr class="list_top">
                    <th>번호</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>권한</th>
                    <th>생성일</th>
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
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>