<%@ page import="file.FileDTO" %>
<%@ page import="file.FileDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="texe/html; charset=UTF-8">
<title>jsp 파일 업로드</title>
</head>
<body>
	<%
/* 		ArrayList<FileDTO> fileList = new FileDAO().getList();
	
		for(FileDTO file : fileList) {
			if (file.getUploadIdx() == board.GetIndex())
			{
			out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file=" +
				java.net.URLEncoder.encode(file.getFileRealName(), "UTF-8") + "\">" +
					file.getFileName() + "(다운로드 횟수: " + file.getDownloadCount() + ")</a><br>");
			}
		} */
	%>
</body>
</html>