<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
     <style type="text/css">
		<%@ include file="css/header.css"%>
		<%@ include file="css/error.css"%>
	</style>
    <title>ERROR</title>
</head>
<body>
<div class="error_container">
    <div class="box">
        <div class="logo"><a href="<c:url value="/"/>"><img src="<c:url value="/upload/main/logo.png"/>"></a></div>
        <div class="message">
            <h1>서비스 이용에 불편을 드려 죄송합니다</h1>
            <p>에러가 발생했습니다 <br> 원하시는 페이지를 찾을 수 없습니다 <br></p>
            <p>정상적으로 데이터를 읽지 못했습니다 <br> 잠시 후 다시 접속해 주시길 바랍니다.</p>
            <a href="<c:url value="/"/>"><h3>메인으로</h3></a>
        </div>
    </div>
</div>
</body>
</html>