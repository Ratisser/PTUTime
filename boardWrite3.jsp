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
	String nickname = (String)session.getAttribute("nickname");
	String boardName = "used_board";
	if (nickname == null)
	{
		out.print("<script>alert('로그인이 필요합니다.');location.href='javascript:history.back()';</script>");
	}
%>
	<div class="container">
		<div class="col-lg-12">
			<div class="jumbotron">
				<form name="formWrite" action="boardSave2.jsp" method="post" onsubmit="return FormCheck();" enctype="multipart/form-data">
					<div class="form-group">
						제목 :<input type="text" name="title" placeholder="제목을 입력해 주세요." onkeyup="fnChkByteTitle(this)" class="form-control">
					</div>
					<div class="form-group">
						작성자 : <input type="hidden" name="writer" value="<%=nickname%>"><%=nickname%>
					</div>
					<div class="form-group">
						글내용 :
						<textarea name="content" cols="50" rows="5"
							placeholder="내용을 입력해 주세요." onkeyup="fnChkByteContent(this)"
							class="form-control"></textarea>
					</div>
				<div class="form-group">
						첨부파일 :
						<input type="file" name="file1"><br>
						
						<button type="submit" class="btn btn-primary" onclick="Submit()">등록</button>
						<button type="button" class="btn btn-primary" onclick="Cancel()">취소</button>
				</div>
				</form>
			</div>
		</div>
	</div>
<jsp:include page="space.jsp"/>
	<jsp:include page="footer.jsp" />
</body>
<script type="text/javascript">
function Cancel()
{
	location.href="javascript:history.back()";
	return true;
}

function Submit()
{
	if (FormCheck())
		{
			document.formWrite.submit();
			//document.upload.submit();	

		}
	
	return true;
}

	function FormCheck() {
		var title = document.forms[0].title.value;
		var writer = document.forms[0].writer.value;
		var content = document.forms[0].content.value;

		if (title == null || title == "") {
			alert("제목을 입력하세요");
			document.forms[0].title.focus();
			return false;
		}

		if (writer == null || writer == "") {
			alert("작성자를 입력하세요");
			document.forms[0].writer.focus();
			return false;
		}

		if (content == null || content == "") {
			alert("내용을 입력하세요");
			document.forms[0].content.focus();
			return false;
		}
		
		
		return true;
	}
		function fnChkByteTitle(obj) {
		    var maxByte = 90; //최대 입력 바이트 수
		    var str = obj.value;
		    var str_len = str.length;
		 
		    var rbyte = 0;
		    var rlen = 0;
		    var one_char = "";
		    var str2 = "";
		 
		    for (var i = 0; i < str_len; i++) {
		        one_char = str.charAt(i);
		 
		        if (escape(one_char).length > 4) {
		            rbyte += 2; //한글2Byte
		        } else {
		            rbyte++; //영문 등 나머지 1Byte
		        }
		 
		        if (rbyte <= maxByte) {
		            rlen = i + 1; //return할 문자열 갯수
		        }
		    }
		 
		    if (rbyte > maxByte) {
		        alert("한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
		        str2 = str.substr(0, rlen); //문자열 자르기
		        obj.value = str2;
		        fnChkByte(obj, maxByte);
		    } else {
		        document.getElementById('byteInfo').innerText = rbyte;
		    }
		}
		
		function fnChkByteContent(obj) {
		    var maxByte = 2048; //최대 입력 바이트 수
		    var str = obj.value;
		    var str_len = str.length;
		 
		    var rbyte = 0;
		    var rlen = 0;
		    var one_char = "";
		    var str2 = "";
		 
		    for (var i = 0; i < str_len; i++) {
		        one_char = str.charAt(i);
		 
		        if (escape(one_char).length > 4) {
		            rbyte += 2; //한글2Byte
		        } else {
		            rbyte++; //영문 등 나머지 1Byte
		        }
		 
		        if (rbyte <= maxByte) {
		            rlen = i + 1; //return할 문자열 갯수
		        }
		    }
		 
		    if (rbyte > maxByte) {
		        alert("한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
		        str2 = str.substr(0, rlen); //문자열 자르기
		        obj.value = str2;
		        fnChkByte(obj, maxByte);
		    } else {
		        document.getElementById('byteInfo').innerText = rbyte;
		    }
		}
		
</script>

</html>