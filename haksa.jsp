<%@ page import="web.Crawler" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resource/css/UI.css">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container" style="max-width: 800px; style:relative;">
<%
	out.print(Crawler.GetDocument("https://www.ptu.ac.kr/front/haksaschedulelist.do?sitegubun=1"));
%>
<!-- <iframe style="width:100%; height:3000px; overflow-x:hidden; overflow-y:scroll;" scrolling="no" frameborder="0" src="https://www.ptu.ac.kr/front/haksaschedulelist.do?sitegubun=1"></iframe> -->
</div>

<jsp:include page="footer.jsp" />
</body>
</html>