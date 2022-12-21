<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="header.jsp" />
</head>
<body>
	<%
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(date);
	%>
	<div class="container">
		<form name="signUp" action="signUpResult.jsp" method="post"
			onsubmit="return FormCheck();" accept-charset="utf-8">
			<table class="table table-hover">
				<tr>
					<td>이름</td>
					<td><input type="text" name="userName" onkeyup="ByteCheck(this);"/>

					<input type="hidden" name="idDuplication" value="idUncheck"/>
					</td>
					
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="userNickname" onkeyup="ByteCheck(this);"/></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userID" onkeyup="ByteCheck(this);"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="userPW" /></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="userPW2" /></td>
				</tr>
				<tr>
					<td>생년월일</td>

					<td><input type="date" min="1987-07-01"
						max="<%out.print(today);%>" name="userBirthday"></td>
				</tr>
				<tr>
					<td>학과</td>
					<td><select name="userDepartment">
							<option value="융합소프트웨어">융합소프트웨어학과</option>
							<option value="방송연예">방송연예학과</option>
							<option value="정보통신">정보통신학과</option>
							<option value="경영">경영학과</option>
					</select></td>
				</tr>
				<tr>
					<td>학년</td>
					<td><select name="userGrade">
							<option value="1">1학년</option>
							<option value="2">2학년</option>
							<option value="3">3학년</option>
							<option value="4">4학년</option>
					</select></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" name="submit" value="완료" /> <input
						type="reset" name="reset" value="리셋" /></td>
				</tr>
			</table>
		</form>
	</div>

<jsp:include page="space.jsp"/>
<jsp:include page="footer.jsp" />

</body>
<script type="text/javascript">
	function FormCheck() {
		var userName = document.forms[0].userName.value;
		var userNickname = document.forms[0].userNickname.value;
		var userID = document.forms[0].userID.value;
		var userPW = document.forms[0].userPW.value;
		var userPW2 = document.forms[0].userPW2.value;
		var userBirthday = document.forms[0].userBirthday.value;
		var userDepartment = document.forms[0].userDepartment.value;
		var userGrade = document.forms[0].userGrade.value;

		if (userName == null || userName == "") {
			alert("이름을 입력하세요.");
			document.forms[0].userName.focus();
			return false;
		}

		if (userNickname == null || userNickname == "") {
			alert("닉네임을 입력하세요");
			document.forms[0].userNickname.focus();
			return false;
		}

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

		if (userPW2 != userPW) {
			alert("비밀번호가 일치하지 않습니다!");
			document.forms[0].userPW.focus();
			return false;
		}

		if (userBirthday == null) {
			alert("생년월일을 입력하세요.");
			document.forms[0].userBirthday.focus();
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
	}
</script>
</html>