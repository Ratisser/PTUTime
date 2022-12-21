<%@ page import="file.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="texe/html; charset=UTF-8">
<title>jsp 파일 업로드</title>
<%
		String boardName = "used_board";
		method last = new method();
		int idx = last.lastIdx(boardName);
		
		String directory = "C:/Users/Ratisser/Desktop/EclipseWorkspace/web/img/";
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,	new DefaultFileRenamePolicy());
		
		Enumeration<?> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasMoreElements()){
			String parameter = (String) fileNames.nextElement();
			String fileName = multipartRequest.getOriginalFileName(parameter);
			String fileRealName = multipartRequest.getFilesystemName(parameter);
			
			if(fileName == null) continue;
			new FileDAO().upload(fileName, fileRealName, idx); // 여기다가 해당 게시판 idx 넣어줌
			//out.write("파일명: " + fileName + "<br>");
			//out.write("실제 파일명: " + fileRealName + "<br>");
			
		}
		
	%>
</head>
<body>
	 <%
	 out.print("<script>location.href='" + boardName +".jsp?&boardName="+boardName+"';</script>");
	 %>
</body>
</html>