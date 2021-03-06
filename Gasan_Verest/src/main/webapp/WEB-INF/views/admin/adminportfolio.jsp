<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
    <title>ADMIN</title>
    <style type="text/css">
		<%@ include file="../css/header.css"%>
		<%@ include file="../css/admin.css"%>
		<%@ include file="../css/footer.css"%>
	</style>
	<script>
<%@ include file="../js/main.js"%>
</script>
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
            <h2>포트폴리오 글쓰기</h2>
        </div>
        <div class="review_write">
            <form id="fmField"  name="fmField" action="<c:url value='/port/new'/>" method="post" enctype="multipart/form-data">
                <table>
                	<tr>
                        <th>작성자</th>
                        <td>${userInfo.v_name }관리자</td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td><input type="text"  name="title" placeholder="제목" required></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea id="txt"  name="content" placeholder="내용" style="resize: none;"  id="area" cols="30" rows="10" required></textarea></td>
                    </tr>
                    <tr>
                        <th>유튜브링크</th>
                        <td><input type="text" name="attachment" placeholder="유튜브링크"  required></td>
                    </tr>
                    <tr>
                        <th>첨부이미지</th>
                        <td>
                        <input class="file"  name="attachmentImg" type="file" onchange="readURL(this)"  multiple="multiple" accept=".gif, .jpg, .png" required>
                        <img id="blah" src="<c:url value="/upload/main/no_image.jpg"/>" alt="NOT IMG" /></td>
                    </tr>
                    <tr>
                        <th>분류</th>
                        <td>
                            <select name="p_type" id="p_type">
                                <option value="HER Series">HER Series</option>
                                <option value="360 VR Works">360 VR Works</option>
                                <option value="3D VR Dance">3D VR Dance</option>
                                <option value="360 VR with Spatial Audio">360 VR with Spatial Audio</option>
                                <option value="Pocket Girls">Pocket Girls</option>
                                <option value="인기 360 VR">인기 360 VR</option>
                                <option value="2D M/V&Video works">2D M/V&Video works</option>
                            </select>
                            <input type="hidden" name="writer" value="${ userInfo.v_id }"> <input
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