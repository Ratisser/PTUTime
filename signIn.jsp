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
	<form action="signInResult.jsp" method="post"
		onsubmit="return FormCheck()" name="signin">
		<div class="container" style="max-width: 480px">
			<div class="col-lg-12">
				<div class="jumbotron">
					<div class="form-group">
						<label>Name:</label> <input type="text" class="form-control"
							name="userID" onkeyup="ByteCheck(this)">
					</div>
					<div class="form-group">
						<label>Password:</label> <input type="password"
							class="form-control" name="userPW" onkeyup="ByteCheck(this)">
					</div>
					<div class="from-group">
						<p align="center">
							<button type="button" class="btn btn-primary" onclick="Submit()">로그인</button>
							<button type="button" class="btn btn-primary" onclick="Cancel()">취소</button>
						</p>
					</div>
				</div>
			</div>
		</div>
		<input type="submit" style="visibility: hidden"></input>
	</form>
	<jsp:include page="space.jsp"/>
	<jsp:include page="footer.jsp" />
</body>
<script type="text/javascript">
	function Cancel()
	{
		location.href="index.jsp";
		return true;
	}
	
	function Submit()
	{
		if (FormCheck())
			{
			document.signin.submit();
			}
		
		return true;
	}
	
	function FormCheck() {
		var userID = document.forms[0].userID.value;
		var userPW = document.forms[0].userPW.value;

		if (userID == null || userID == "") {
			alert("ID를 입력하세요.");
			document.forms[0].userID.focus();
			return false;
		}

		if (userPW == null || userPW == "") {
			alert("비밀번호을 입력하세요.");
			document.forms[0].userPW.focus();
			return false;
		}

		return true;
	}
	
	function ByteCheck(obj) {
		var maxByte = 24; //최대 입력 바이트 수
		var str = obj.value;
		var strLenth = str.length;

		var readByte = 0;
		var readLenth = 0;
		var oneChar = "";
		var str2 = "";

		for (var i = 0; i < strLenth; i++) {
			oneChar = str.charAt(i);

			if (escape(oneChar).length > 4) {
				readByte += 2; //한글2Byte
			} else {
				readByte++; //영문 등 나머지 1Byte
			}

			if (readByte <= maxByte) {
				readLenth = i + 1; //return할 문자열 갯수
			}
		}
		
	    if (readByte > maxByte) {
	        alert("한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
	        str2 = str.substr(0, readLenth); //문자열 자르기
	        obj.value = str2;
	        ByteCheck(obj, maxByte);
	    } else {
	        document.getElementById('byteInfo').innerText = readByte;
	    }
	}

</script>
</html>