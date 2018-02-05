<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>REVIEWS</title>
<style type="text/css">
	<%@ include file="../css/style.css"%>
	<%@ include file="../css/header.css"%>
	<%@ include file="../css/review.css"%>
	<%@ include file="../css/footer.css"%>
</style>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<script type='text/javaScript'>
    // textarea 줄바꿈 제한
    $(function () {
        $('#textarea').keydown(function(){
            var rows = $('#textarea').val().split('\n').length;
            var maxRows = 7;
            if( rows > maxRows){
                alert('7줄 까지만 가능합니다');
                modifiedText = $('#textarea').val().split("\n").slice(0, maxRows);
                $('#textarea').val(modifiedText.join("\n"));
            }
        });
    });

    function checkForm() {
        var userId = document.fmField.title;
        // 아이디 입력 유무 체크
        if(userId.value == '') {
            window.alert("제목을 입력하세요");
            document.fmField.title.focus();
            document.getElementById('title').select();
            return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
        }
        var uerPw = document.getElementById('txt');
        // 암호 입력 유무 체크
        if(document.fmField.txt.value == ''){
            alert('내용을 입력하세요');
            txt.focus();
            return false;
        }
    }
</script>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
		<div class="mid">
			<div class="title">
				<h2>이용 후기</h2>
			</div>
			<sec:authorize access="hasRole('ADMIN') or hasRole('USER') ">
				<div class="review_write">
					<h3>후기 작성하기</h3>
					<form action="<c:url value='/back/new'/>" method="post" id="fmField" name="fmField" onsubmit="return checkForm();">
						<table>
							<tr>
								<th>작성자</th>
								<td>${userInfo.v_name}</td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" id="title"placeholder="제목" maxlength="15"
									name="title" required/></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea id="txt" placeholder="내용"
										style="resize: none;" name="content"  cols="30"
										rows="5" maxlength="50" required></textarea></td>
							</tr>
							<tr>
								<th>별점</th>
								<td><select name="b_like" id="rgood">
										<option value="5">★★★★★ 매우만족</option>
                            			<option value="4">★★★★ 만족</option>
			                            <option value="3">★★★ 보통</option>
			                            <option value="2">★★ 불만족</option>
			                            <option value="1">★ 매우불만족</option>
								</select><input type="submit" class="submit"
									value="작성하기"></td>
							</tr>
						</table>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>
				</div>
			</sec:authorize>
			<sec:authorize access="!hasRole('ADMIN') and !hasRole('USER')">
				 <div class="review_login">
			         <h3>후기를 남기시려면 <a href="<c:url value='/login'/>">로그인</a>을 하십시오</h3>
			     </div>
		    </sec:authorize>
			<c:forEach items="${ list }" var="item">
				<div class="review_card">
					<div class="r_name">
						<h2>${ item.userInfo.v_name}</h2>
					</div>
					<div class="r_content">
						<div class="c_title">
							<h3>${ item.title}</h3>
							<h4>${ item.regdate}</h4>
							<p>
								   <c:choose>
								       <c:when test="${item.b_like== 1}">
								           매우불만족
								       </c:when>
								       <c:when test="${item.b_like== 2}">
								           불만족
								       </c:when>
								       <c:when test="${item.b_like== 3}">
								           보통
								       </c:when>
								       <c:when test="${item.b_like== 4}">
								           만족
								       </c:when>
								       <c:when test="${item.b_like== 5}">
								           매우만족
								       </c:when>
								       <c:otherwise>
								           오류오류
								       </c:otherwise>
								   </c:choose>
							</p>
							<c:forEach var="a" begin="1" end="${ item.b_like}" step="1">
								<i class="fa fa-star" aria-hidden="true"></i>
							</c:forEach>
						</div>
						<div class="c_content">
							${ item.content}
						</div>
					</div>
					<div class="line"></div>
				</div>
			</c:forEach>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>