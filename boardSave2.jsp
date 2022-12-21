<%@ page import="web.*" import="java.sql.*" import="java.util.regex.Pattern"%>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%
String boardName = "used_board";
method last = new method();
int idx = 0;

String directory = "C:/Users/Ratisser/Desktop/EclipseWorkspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/web/img/";
int maxSize = 1024 * 1024 * 100;
String encoding = "UTF-8";

MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,	new DefaultFileRenamePolicy());



	Connection conn = null;
	Statement query = null;
	ResultSet result = null;
	
	conn = Mysql.GetConnection();
	if (conn == null) {
		System.out.println("connection fail");
		return;
	} else {
		System.out.println("connection success");
	}
	
	String title = multipartRequest.getParameter("title");
	String writer = multipartRequest.getParameter("writer");
	String content = multipartRequest.getParameter("content");
	
	// 유효성 검사
	if(title == null || title == "")
	{
		System.out.println("The title is null");
	}
	else if(writer == null || writer == "")
	{
		System.out.println("The writer is null");
	}
	else if(content == null || content == "")
	{
		System.out.println("The content is null");
	}
	else
	{
		title = title.replaceAll("'","&#39;");
		title = title.replaceAll("<","&lt;");
		title = title.replaceAll(">","&gt;");
		if(title.length() > 45){
			title = title.substring(0,45);
		}
		
		writer = writer.replaceAll("'","&#39;");
		writer = writer.replaceAll("<","&lt;");
		writer = writer.replaceAll(">","&gt;");
		if(writer.length() > 18){
			writer = writer.substring(0,18);
		}
		
		content = content.replaceAll("'","&#39;");
		content = content.replaceAll("<","&lt;");
		content = content.replaceAll(">","&gt;");
		if(content.length() > 1000){
			content = content.substring(0,1000);
		}


		try{
			query = conn.createStatement();
			query.executeQuery("use gmt_db");

			{ 
				String str = "insert into " + boardName + " value ('" + title + "','" + writer + "', sysdate(),'" + content + "', '0', null)";
				query.executeUpdate(str);
				
				Enumeration<?> fileNames = multipartRequest.getFileNames();

				while(fileNames.hasMoreElements()){
					String parameter = (String) fileNames.nextElement();
					String fileName = multipartRequest.getOriginalFileName(parameter);
					String fileRealName = multipartRequest.getFilesystemName(parameter);
					idx = last.lastIdx(boardName);
					if(fileName == null) continue;
					new FileDAO().upload(fileName, fileRealName, idx); // 여기다가 해당 게시판 idx 넣어줌
					//out.write("파일명: " + fileName + "<br>");
					//out.write("실제 파일명: " + fileRealName + "<br>");
					
				}
			}
			
			
			}catch (SQLException ex)
			{
				System.out.println("SQLException: " + ex.getMessage());
				System.out.println("SQLState: " + ex.getSQLState());
				System.out.println("VendorError: " + ex.getErrorCode());
			}
		finally
		{
			conn.close();
			out.print("<script>location.href='" + boardName +".jsp?&boardName="+boardName+"';</script>");
		}
	}

%>


</body>
</html>