<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title>글쓰기</title>
<script type="text/javascript"> 
function readURL(input) { 
	if (input.files && input.files[0]) { 
		var reader = new FileReader(); 
		reader.onload = function (e) { 
			$('#blah').attr('src', e.target.result); 
			} 
		reader.readAsDataURL(input.files[0]); 
		} } 
</script>
</head>
<body>
	<h1>글쓰기</h1>
	<form action="<c:url value='/pro/new'/>" method="post" enctype="multipart/form-data">
		<div>
			<label>작성자 <span>${ email }</span></label>
		</div>
		<div>
			<label>제목 <input type="text" name="title"></label>
		</div>
		<div>
			<label>내용 <textarea name="content"></textarea></label>
		</div>
		<div>
			<label>첨부파일 <input type="text" name="attachment"></label>
		</div>
		<div>
			<label>첨부이미지 <input type="file" onchange="readURL(this);"  name="attachmentImg" accept=".gif, .jpg, .png" multiple="multiple"></label>
			<img id="blah" src="<c:url value="/upload/main/no_image.jpg"/>" alt="your image" />
		</div>
		<input type="hidden" name="writer" value="${ writer }">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit">
		<input type="reset">
		<a href='<c:url value='/'></c:url>'>메인으로 돌아가기</a>
	</form>
</body>
</html>