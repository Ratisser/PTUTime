<%@ page import="web.*" import="java.sql.*" import="java.util.regex.Pattern"%>
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
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	Statement query = null;
	ResultSet result = null;
	String boardName = request.getParameter("boardName");
	
	conn = Mysql.GetConnection();
	if (conn == null) {
		System.out.println("connection fail");
		return;
	} else {
		System.out.println("connection success");
	}
	
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
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