<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>수정하기</title>
<script>
<%@ include file="../js/main.js"%>
</script>
</head>
<body>
	<h1>수정하기</h1>
	<form action="<c:url value='/sale/modify'/>" method="post" enctype="multipart/form-data">
		<c:if test="${ param.action == 'error-password' }">
			<p>비밀번호가 일치하지 않습니다.</p>
		</c:if>
		<div>
			<label>번호 ${ item.no }</label>
		</div>
		<div>
			<label>작성자 ${ item.userInfo.v_name }</label>
		</div>
		<div>
			<label>제목 <input type="text" name="title" value="${ item.title }"></label>
		</div>
		<div>
			<label>가격 <input type="text" name="price" value="${ item.price }"></label>
		</div>
		<div>
			<label>내용 <textarea name="content">${ item.content }</textarea></label>
		</div>
		<div>
			<label>첨부파일 <input type="text" value="${item.attachment}"name="attachment"></label>
		</div>
		<div>
			<label>첨부이미지 <input type="file" name="attachmentImg" multiple="multiple" accept=".gif, .jpg, .png"></label>
			<img id="blah" src="<c:url value="/upload/sale/${item.attachmentImg}"/>" alt="your image" />
		</div>
		<div>
			<label>비밀번호 <input type="password" name="password"></label>
		</div>
		<input type="hidden" name="no" value="${ item.no }">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit">
		<input type="reset">
		<a href='<c:url value='/'></c:url>'>메인으로 돌아가기</a>
	</form>
</body>
</html>