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
	String index = request.getParameter("index");
	
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
	

		try{
			query = conn.createStatement();
			query.executeQuery("use gmt_db");
				String str = "delete from " + boardName + " where `index` = '" + index + "'";
				query.executeUpdate(str);
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
	
%>


</body>
</html>