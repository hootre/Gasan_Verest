<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>REVIEWS</title>
<style type="text/css">
	<%@ include file="../css/header.css"%>
	<%@ include file="../css/review.css"%>
	<%@ include file="../css/footer.css"%>
</style>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
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
</script>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
		<div class="mid">
			<div class="title">
				<h2>이용 후기</h2>
			</div>
			<div class="review_write">
				<h3>후기 작성하기</h3>
				<form action="<c:url value='/back/new'/>" method="post">
					<table>
						<tr>
							<th>제목</th>
							<td><input type="text" placeholder="제목" maxlength="15"
								name="title" /></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea id="textarea" placeholder="내용"
									style="resize: none;" name="content" id="area" cols="30"
									rows="5" maxlength="50"></textarea></td>
						</tr>
						<tr>
							<th>별점</th>
							<td><select name="b_like" id="rgood">
									<option value="1">★ 매우불만족</option>
									<option value="2">★★ 불만족</option>
									<option value="3">★★★ 보통</option>
									<option value="4">★★★★ 만족</option>
									<option value="5">★★★★★ 매우만족</option>
							</select> <input type="text" style="display: none;" class="bla" name="gid"
								value="${gid.gid}" /> <input type="submit" class="submit"
								value="작성하기"></td>
						</tr>
					</table>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>
			</div>
			<c:forEach items="${ list }" var="item">
				<div class="review_card">
					<div class="r_name">
						<h2>${ item.userInfo.v_name}</h2>
					</div>
					<div class="r_content">
						<div class="c_title">
							<h3>${ item.title}</h3>
							<i class="fa fa-star" aria-hidden="true"></i> <i
								class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star" aria-hidden="true"></i>
							<p>${ item.b_like}</p>
							<h4>${ item.regdate}</h4>
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