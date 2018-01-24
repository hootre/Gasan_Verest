<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>
</head>
<body>
	<h1>글 목록</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>가격</th>
			<th>내용</th>
			<th>날짜</th>
			<th>상태</th>
		</tr>
		<c:forEach items="${ list }" var="item">
			<tr>
				<td>${ item.or_no }</td>
				<td><a href="<c:url value='/sale/detail?no=${ item.sale_no}'/>">${ item.sale.title}</a></td>
				<td>${ item.sale.price}</td>
				<c:if test="${ !empty item.sale.attachment }">
					<td>
					<iframe width="640" height="360" src="${ item.sale.attachment }" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>
					</iframe>
					</td>
				</c:if>
				<td>${ item.regdate}</td>
				<td><a href='<c:url value='/order/detail?sale_no=${item.sale_no }'></c:url>'>${ item.state}</a></td>
				<td><a href='<c:url value='/order/remove?or_no=${item.or_no }'></c:url>'>주문취소</a></td>
			</tr>
		</c:forEach>
	</table>
	<a href='<c:url value='/'></c:url>'>메인으로 돌아가기</a>
</body>
</html>