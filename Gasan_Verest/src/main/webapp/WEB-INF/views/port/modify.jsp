<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>PORT MODIFY</title>
    <style type="text/css">
    	<%@ include file="../css/style.css"%>
		<%@ include file="../css/header.css"%>
		<%@ include file="../css/admin.css"%>
		<%@ include file="../css/footer.css"%>
	</style>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>

<jsp:include page="../adminheader.jsp"></jsp:include>
<div class="container">
    <div class="mid">
        <div class="title">
            <h2>포트폴리오 수정하기</h2>
        </div>
        <div class="review_write">
            <form id="fmField" name="fmField" action="<c:url value='/pro/modify'/>" onsubmit="return checkForm();" method="post" enctype="multipart/form-data">
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
                        <td><input class="file" name="attachmentImg" type="file"  multiple="multiple" accept=".gif, .jpg, .png"><span>#미선택시 기존과 동일</span></td>
                    </tr>
                    <tr>
                        <th>분류</th>
                        <td>
                            <select name="p_type" id="p_type">
                                <option value="HER Series" 
                                <c:if test="${ item.p_type eq 'HER Series' }">
									selected="selected"
								</c:if>>
								HER Series</option>
                                <option value="360 VR Works" 
                                <c:if test="${ item.p_type eq '360 VR Works' }">
									selected="selected"
								</c:if>>
								360 VR Works</option>
                                <option value="3D VR Dance" 
                                <c:if test="${ item.p_type eq '3D VR Dance' }">
									selected="selected"
								</c:if>>
								3D VR Dance</option>
                                <option value="360 VR with Spatial Audio" 
                                <c:if test="${ item.p_type eq '360 VR with Spatial Audio' }">
									selected="selected"
								</c:if>>
								360 VR with Spatial Audio</option>
                                <option value="Pocket Girls" 
                                <c:if test="${ item.p_type eq 'Pocket Girls' }">
									selected="selected"
								</c:if>>
								Pocket Girls</option>
                                <option value="인기 360 VR" 
                                <c:if test="${ item.p_type eq '인기 360 VR' }">
									selected="selected"
								</c:if>>
								인기 360 VR</option>
                                <option value="2D M/V&Video works" 
                                <c:if test="${ item.p_type eq '2D M/V&Video works' }">
									selected="selected"
								</c:if>>
								2D M/V&Video works</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td>
                        <input type="password" id="pwd"name="password"  required>
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
</body>
</html>
