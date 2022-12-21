<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="web.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String userID = request.getParameter("userID");
	String userPW = request.getParameter("userPW");
	Connection conn = null;
	Statement query = null;
	ResultSet result = null;
	
	userPW = SHA256.Encrypt(userPW);
	
	conn = Mysql.GetConnection();
	
	if(conn == null)
	{
		System.out.println("커넥션에러");
		System.out.println("위치 : signUpResult.jsp");
	}
	
	try
	{
		query = conn.createStatement();
		query.executeQuery("use gmt_db");
		result = query.executeQuery("SELECT `userPW`, `userNickname` FROM web_account WHERE `userID`='"+ userID + "'");
		result.next();
		if( userPW.equals(result.getString(1)) == true )
		{
			System.out.println("로그인 성공");
			session = request.getSession();
			session.setAttribute("sessionID", session.getId());
			session.setAttribute("id", userID);
			session.setAttribute("nickname", result.getString(2));
			out.print("<script>location.href='index.jsp';</script>");
		}
		else
		{
			System.out.println("로그인 실패");
			System.out.println("접속 IP : " + request.getRemoteAddr());
			out.print("<script>alert('아이디와 비밀번호를 확인 해 주십시오.');location.href='javascript:history.back()';</script>");
		}
		
	}
	catch (SQLException ex)
	{
		System.out.println("로그인 실패");
		System.out.println("접속 IP : " + request.getRemoteAddr());
		System.out.println("SQLException: " + ex.getMessage());
		System.out.println("SQLState: " + ex.getSQLState());
		System.out.println("VendorError: " + ex.getErrorCode());
		conn.close();
		out.print("<script>alert('아이디와 비밀번호를 확인 해 주십시오.');location.href='javascript:history.back()';</script>");
	}
%>
</body>
</html>