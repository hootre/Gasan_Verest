<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ADMIN</title>
    <style type="text/css">
		<%@ include file="../css/header.css"%>
		<%@ include file="../css/admin.css"%>
		<%@ include file="../css/footer.css"%>
	</style>
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
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>

<jsp:include page="../adminheader.jsp"></jsp:include>
<div class="container">
    <div class="mid">
        <div class="title">
            <h2>프로젝트 글쓰기</h2>
        </div>
        <div class="review_write">
            <form id="fmField" name="fmField" action="<c:url value='/pro/new'/>" onsubmit="return checkForm();" method="post" enctype="multipart/form-data">
                <table>
                    <tr>
                        <th>제목</th>
                        <td><input type="text"  name="title" placeholder="제목"  maxlength="15" required></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea id="txt"  name="content" placeholder="내용" style="resize: none;"  id="area" cols="30" rows="10" maxlength="50" required></textarea></td>
                    </tr>
                    <tr>
                        <th>유튜브링크</th>
                        <td><input type="text" name="attachment" placeholder="유튜브링크"  required></td>
                    </tr>
                    <tr>
                        <th>첨부이미지</th>
                        <td><input class="file"  name="attachmentImg" type="file"  multiple="multiple" accept=".gif, .jpg, .png" required></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <input type="hidden" name="writer" value="${ writer }"> <input
                                type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <input type="submit" class="submit" value="작성하기">
                            <input class="reset" type="reset">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>