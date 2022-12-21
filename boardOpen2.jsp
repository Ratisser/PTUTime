<%@ page import="web.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="file.FileDTO"%>
<%@ page import="file.FileDAO"%>
<%@ page import="java.util.ArrayList"%>
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
		request.setCharacterEncoding("UTF-8");
		Connection conn = null;
		Statement query = null;
		ResultSet result = null;
		Board board = null;
		String currentFileName = null;
		String index = request.getParameter("index");
		String pageNumber = request.getParameter("pageNumber");
		String boardName = request.getParameter("boardName");
		String w = null;
		String s = null;
		conn = Mysql.GetConnection();
		if (conn == null) {
			System.out.println("connection fail");
			return;
		} else {
			System.out.println("connection success");
		}

		try {
			query = conn.createStatement();
			query.executeQuery("use gmt_db");
			query.executeUpdate("UPDATE " + boardName + " SET `viewCount`=`viewCount`+1 WHERE `index`=" + index);
			result = query.executeQuery("SELECT * FROM " + boardName + " WHERE `index`=" + index);
			if (result.next())
			{
				board = new Board(result.getString(1), result.getString(2), result.getString(3),
						result.getString(4), result.getInt(5), result.getInt(6));

			}

		} catch (SQLException ex) {
			System.out.print(ex.getMessage());
			System.out.print(ex.getSQLState());
			System.out.print(ex.getErrorCode());
		}

		if (board != null) {
	%>
	<div class="container">
		<table class="table table-bordered table-striped">
			<tr>
				<th>번호</th>
				<td><%=board.GetIndex()%></td>
				<th>작성자</th>
				<td><%=board.GetWriter()%></td>
				<th>날짜</th>
				<td><%=board.GetRegDate()%></td>
				<th>조회수</th>
				<td><%=board.GetViewCount()%></td>
			</tr>
			<tr>
				<th colspan="2">제목</th>
				<td colspan="6"><%=board.GetTitle()%></td>
			</tr>


			<%
				if (boardName.equals("used_board")) {
			%>
			<tr>
				<th colspan="2">첨부파일</th>
				<td colspan="6">
					<%
						ArrayList<FileDTO> fileList = new FileDAO().getList();

								for (FileDTO file : fileList) {
									if (file.getUploadIdx() == board.GetIndex()) {
										out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file="
												+ java.net.URLEncoder.encode(file.getFileRealName(), "UTF-8") + "\">"
												+ file.getFileName() + "(다운로드 횟수: " + file.getDownloadCount() + ")</a><br>");
										currentFileName = file.getFileRealName();
									}
								}
					%>

				</td>
			</tr>
			<%
				}
			%>

			<tr>
				<th colspan="2">내용</th>
				<td colspan="6">
					<%
						if (currentFileName != null) {
								if (boardName.equals("used_board")) {
									if (currentFileName.endsWith(".gif") || currentFileName.endsWith(".jpg")
											|| currentFileName.endsWith(".jpeg") || currentFileName.endsWith(".png")
											|| currentFileName.endsWith(".bmp") || currentFileName.endsWith(".GIF")
											|| currentFileName.endsWith(".JPG") || currentFileName.endsWith(".JPEG")
											|| currentFileName.endsWith(".PNG") || currentFileName.endsWith(".BMP")) {
					%> <img src="/img/<%=currentFileName%>" style="max-width: 50vw"><br />
					<br /> <%
 	}
 			}
 		}
 %> <%=board.GetContent().replaceAll("\r\n", "<br/>")%>
				</td>
			</tr>
		</table>

		<a href="javascript:history.back()"><button type="button"
				class="btn btn-primary">목록으로</button></a>

		<%
			w = board.GetWriter();
				s = (String) session.getAttribute("nickname");
				if (w.equals(s)) {
					out.print("<a href=\"boardDelete.jsp?&index=" + index + "&boardName=" + boardName
							+ "\"><button type=\"button\" class=\"btn btn-primary\">삭제하기</button></a>");
				}
			}
			conn.close();
		%>
	</div>
	<jsp:include page="space.jsp"/>
	<jsp:include page="footer.jsp" />
</body>
</html>