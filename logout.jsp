<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
		session.removeAttribute("id");
		session.removeAttribute("nickname");
		session.removeAttribute("sessionID");
		session.invalidate();
	%>

	<script>location.href='index.jsp';</script>
</body>
</html>