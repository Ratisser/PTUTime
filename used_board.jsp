<%@ page import="java.util.regex.Pattern" import="web.*"
	import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resource/css/bootstrap.css">
</head>
<body>
<jsp:include page="header.jsp" />
	<%
		// url 값 전달하기
		// url 맨뒤에 ?&값이름=값&값이름2=값2
		request.setCharacterEncoding("UTF-8");
		Connection conn = null;
		Statement query = null;
		ResultSet result = null;
		ArrayList<Board> boardList = new ArrayList<Board>();
		final int SORT_COUNT = 10;
		int pageNumber = 0;
		int totalPage = 0;
		int totalRow = 0;
		String boardName = request.getParameter("boardName");

		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} else {
			pageNumber = 1;
		}
		
		try {
			conn = Mysql.GetConnection();
			if (conn == null)
			{
				return;
			}
			query = conn.createStatement();
			result = query.executeQuery(Board.SelectRowCount(boardName));
			result.next();
			totalRow = Integer.parseInt(result.getString(1));
			totalPage = (totalRow / 10) + 1;
		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}

		if (conn == null) {
			out.print("Connection faild...");
			System.out.println("conn is null");
			return;
		}

		try {
			result = query.executeQuery(Board.SelectPage(boardName, pageNumber));
			while (result.next()) {
				boardList.add(new Board(result.getString(1), result.getString(2), result.getString(3),
						result.getString(4), result.getInt(5), result.getInt(6)));
			}
		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
	%>
	<div class="container">
	<table class="table table-hover">
		<tr align="center">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>날짜</td>
			<td>hit</td>
		</tr>
		<%
			for (int i = 0; i < SORT_COUNT && i < boardList.size(); i++) {
				Board board = boardList.get(i);
 				out.print("<tr align=\"center\">");
				out.print("<td>" + board.GetIndex() + "</td>");
				out.print("<td>");
				out.print("<a href=\"boardOpen2.jsp?&boardName="+boardName+"&pageNumber=" + pageNumber + "&index=" + board.GetIndex() + "\">");
				out.print(board.GetTitle() + "</a></td>");
				out.print("<td>" + board.GetWriter() + "</td>");
				out.print("<td>" + board.GetRegDate() + "</td>");
				out.print("<td>" + board.GetViewCount() + "</td>");
				out.print("</tr>"); 				
			}
		
		out.print("<tr align=\"center\">");
		out.print("<td colspan=\"5\">");
		
		for ( int i = 1; i <= totalPage; i++ )
		{
			out.print("<a href=\""+boardName+".jsp?&boardName="+boardName+"&pageNumber=" + i + "\">");
			out.print("[" + i + "]");
			out.print("</a>");
		}
		
		out.print("</td>");
		out.print("</tr>");
		conn.close();
		%>

	</table>
	<p align="right">
	<a href="boardWrite3.jsp?&boardName=<%=boardName%>"><button type="button" class="btn btn-primary">글쓰기</button></a>
	</p>
	</div>
	<jsp:include page="space.jsp"/>
			<jsp:include page="footer.jsp" />
</body>
</html>