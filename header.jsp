<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="resource/css/bootstrap.css">
<!-- <link rel="stylesheet" href="resource/css/UI.css"> -->
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"><a href="index.jsp"><img src="/img/logo.png" style="width:214px; height:50px;"></a> <a
		class="navbar-brand" ></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
			<a class="nav-link" href="used_board.jsp?&boardName=used_board" style="padding-right: 10px">중고장터<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="board.jsp?&boardName=board" style="padding-right: 10px">익명게시판 </a></li>
			<li class="nav-item"><a class="nav-link" href="haksa.jsp" style="padding-right: 10px">학사 일정 </a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false" style="padding-right: 10px">학과게시판</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="computer_board.jsp?&boardName=computer_board">융합소프트웨어 학과</a>
					<a class="dropdown-item" href="car_board.jsp?&boardName=car_board">스마트자동차 학과</a>
					<a class="dropdown-item" href="info_board.jsp?&boardName=info_board">정보통신 학과</a>
					<a class="dropdown-item" href="datainfo_board.jsp?&boardName=datainfo_board">데이터정보 학과</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="gyo_board.jsp?&boardName=gyo_board">교양 과목</a>
				</div>
				</li>
				<li class="nav-item"><a class="nav-link" href="chat.jsp" style="padding-right: 10px">채팅방</a></li>
				
		</ul>
				<div align="right" style="padding-top: 7px">
				<%
					String id = (String)session.getAttribute("id");
					String nickname = (String)session.getAttribute("nickname");
					String sessionID = (String)session.getAttribute("sessionID");
					if (id != null && sessionID.equals((String)session.getId())) {
						out.println(nickname + " 님 환영합니다!");
				%>
				<a href="logout.jsp"><button type="button"
						class="btn btn-primary">로그아웃</button></a>
				<%
					} else {
				%>
				<a href="signIn.jsp"><button type="button"
						class="btn btn-primary">로그인</button></a> <a href="signUp.jsp"><button
						type="button" class="btn btn-primary">회원가입</button></a>
				<%
					}
				%>
			</div> 

	</div>
	</nav>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resource/js/bootstrap.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>