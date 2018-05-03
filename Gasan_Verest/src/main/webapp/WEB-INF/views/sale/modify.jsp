<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
    <title>SALE MODIFY</title>
    <style type="text/css">
    	<%@ include file="../css/style.css"%>
		<%@ include file="../css/header.css"%>
		<%@ include file="../css/admin.css"%>
		<%@ include file="../css/footer.css"%>
	</style>
	<script>
<%@ include file="../js/main.js"%>
</script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
    <div class="mid">
        <div class="title">
            <h2>프로젝트 수정하기</h2>
        </div>
        <div class="review_write">
            <form id="fmField" name="fmField" action="<c:url value='/sale/modify'/>" onsubmit="return checkForm();" method="post" enctype="multipart/form-data">
                <table>
                	<tr>
                        <th>번호</th>
                        <td>${item.no }</td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>${item.userInfo.v_name }</td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td><input type="text"  value="${item.title }" name="title" placeholder="제목"  maxlength="15" required></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea id="txt" name="content" placeholder="내용" style="resize: none;"  id="area" cols="30" rows="10" maxlength="50" required>${item.content }</textarea></td>
                    </tr>
                    <tr>
                        <th>유튜브링크</th>
                        <td><input type="text" value="${item.attachment }" name="attachment" placeholder="유튜브링크"  required></td>
                    </tr>
                    <tr>
                        <th>첨부이미지</th>
                        <td>
                        <input class="file" name="attachmentImg"  type="file"  onchange="readURL(this)"  multiple="multiple" accept=".gif, .jpg, .png">
                        <c:if test="${!empty item.attachmentImg}">
	                        <img id="blah" src="<c:url value="/upload/sale/${item.attachmentImg}"/>" alt="NOT IMG" />
                        </c:if>
                        <c:if test="${empty item.attachmentImg}">
	                        <img id="blah" src="<c:url value="/upload/main/no_image.jpg"/>" alt="NOT IMG" />
                        </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>가격</th>
                        <td>
	                        <input class="price" name="price" type="number" min="1000" required>
	                        <input type="hidden" name="writer" value="${ writer }"> 
	                        <input type="hidden" name="no" value="${ item.no }">
	                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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
<script type="text/javascript"> 
function readURL(input) { 
	if (input.files && input.files[0]) { 
		var reader = new FileReader(); 
		reader.onload = function (e) { 
			$('#blah').attr('src', e.target.result); 
			} 
		reader.readAsDataURL(input.files[0]); 
		} 
	} 
</script>
</body>
</html>