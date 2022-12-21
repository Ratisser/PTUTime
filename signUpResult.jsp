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
	String userNickname = request.getParameter("userNickname");
	String userPW = request.getParameter("userPW");
	String userPW2 = request.getParameter("userPW2");
	String userBirthday = request.getParameter("userBirthday");
	String userDepartment = request.getParameter("userDepartment");
	String userGrade = request.getParameter("userGrade");
	String userName = request.getParameter("userName");
	Connection conn = null;
	Statement query = null;
	ResultSet result = null;
	
	userPW = SHA256.Encrypt(userPW);
	userPW2 = SHA256.Encrypt(userPW2);
	
	System.out.println(userPW);
	System.out.println(userPW2);
	
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
		String str = "INSERT INTO web_account VALUE ('" + userID + "','" + userNickname + "','" + userPW + "','" + userBirthday + "','" + userDepartment + "','" + userGrade + "','" + userName + "')";
		query.executeUpdate(str);
	}
	catch (SQLException ex)
	{
		System.out.println("SQLException: " + ex.getMessage());
		System.out.println("SQLState: " + ex.getSQLState());
		System.out.println("VendorError: " + ex.getErrorCode());
		conn.close();
		out.print("<script>alert('\"회원가입에 실패 하였습니다.\"');location.href='index.jsp';</script>");
	}

	out.print("<script>location.href='index.jsp';</script>");
	
	conn.close();
%>

</body>
</html>