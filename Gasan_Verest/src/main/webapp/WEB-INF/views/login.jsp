<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�α��� ������</title>
</head>
<body>
	<form action="<c:url value="/login-processing"/>" method="post">
		<c:if test="${ param.action == 'error' }">
			<p>�̸��� Ȥ�� ��й�ȣ�� �߸� �Է��Ͽ����ϴ�.</p>
		</c:if>
		<c:if test="${ param.action == 'logout' }">
			<p>�α׾ƿ� �Ͽ����ϴ�.</p>
		</c:if>
		<input type="email" name="v_email" placeholder="�̸��� �Է�" required>
		<input type="password" name="v_password" placeholder="��й�ȣ �Է�" required>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="submit" value="�α���">
	</form>
	<a href="<c:url value='/join'/>">ȸ������</a>
</body>
</html>