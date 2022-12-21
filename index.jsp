<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="web.*, java.sql.*, java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<jsp:include page="header.jsp" />

	<div class="container">
		<img src="/img/main.png" style="width: 100%; height: 60vh;">
	</div>
	<div class="container" style="position: relative; height: 500px;">

		<%
			try {
				final int PRINT_COUNT = 7;
				String[] boardName = { "board", "used_board", "computer_board", "info_board", "datainfo_board" };
				ArrayList<ArrayList<Board>> boardList = new ArrayList<ArrayList<Board>>();
				ArrayList<Board> board = null;
				Connection conn = Mysql.GetConnection();
				ResultSet result = null;
				Statement query = conn.createStatement(); // sql 퀴리를 날리기 위한 객체생성
				for (int i = 0; i < 5; i++) {
					String sql = "select * from " + boardName[i] + " order by `index` desc limit " + PRINT_COUNT;
					result = query.executeQuery(sql);
					board = new ArrayList<Board>();
					while (result.next()) {
						board.add(new Board(result.getString(1), result.getString(2), result.getString(3),
								result.getString(4), result.getInt(5), result.getInt(6)));
					}
					boardList.add(board);
				}
		%>
		<form name="form" method="post">
			<div style="height: 10"></div>
			<input type="button" class="btn btn-primary" name="type"
				value="익명게시판" onclick="view(1)"> <input type="button"
				class="btn btn-primary" name="type" value="중고거래" onclick="view(2)">
			<input type="button" class="btn btn-primary" name="type"
				value="융소게시판" onclick="view(3)"> <input type="button"
				class="btn btn-primary" name="type" value="정통게시판" onclick="view(4)">
			<input type="button" class="btn btn-primary" name="type"
				value="데정게시판" onclick="view(5)">
		</form>


		<div class="container" style="visibility: visible; position: absolute"
			id="board_1">
			<table class="table table-striped table-hover">
				<tr align="center">
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>날짜</td>
					<td>조회수</td>

				</tr>
				<%
					for (int i = 0; i < PRINT_COUNT && i < boardList.get(0).size(); i++) {
							Board boardElement = boardList.get(0).get(i);
							out.print("<tr align=\"center\">");
							out.print("<td>" + boardElement.GetIndex() + "</td>");
							out.print("<td>");
							out.print("<a href=\"boardOpen.jsp?&pageNumber=1&index=" + boardElement.GetIndex() + "\">");
							out.print(boardElement.GetTitle() + "</a></td>");
							out.print("<td>" + boardElement.GetWriter() + "</td>");
							out.print("<td>" + boardElement.GetRegDate() + "</td>");
							out.print("<td>" + boardElement.GetViewCount() + "</td>");
							out.print("</tr>");
						}
				%>



			</table>

		</div>

		<div class="container" style="visibility: hidden; position: absolute"
			id="board_2">
			<table class="table table-striped table-hover">
				<tr align="center">
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>날짜</td>
					<td>조회수</td>

				</tr>
				<%
					for (int i = 0; i < PRINT_COUNT && i < boardList.get(1).size(); i++) {
							Board boardElement = boardList.get(1).get(i);
							out.print("<tr align=\"center\">");
							out.print("<td>" + boardElement.GetIndex() + "</td>");
							out.print("<td>");
							out.print("<a href=\"boardOpen2.jsp?&boardName=used_board&pageNumber=1&index="
									+ boardElement.GetIndex() + "\">");
							out.print(boardElement.GetTitle() + "</a></td>");
							out.print("<td>" + boardElement.GetWriter() + "</td>");
							out.print("<td>" + boardElement.GetRegDate() + "</td>");
							out.print("<td>" + boardElement.GetViewCount() + "</td>");
							out.print("</tr>");
						}
				%>
			</table>
		</div>

		<div class="container" style="visibility: hidden; position: absolute"
			id="board_3">
			<table class="table table-striped table-hover">
				<tr align="center">
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>날짜</td>
					<td>조회수</td>

				</tr>
				<%
					for (int i = 0; i < PRINT_COUNT && i < boardList.get(2).size(); i++) {
							Board boardElement = boardList.get(2).get(i);
							out.print("<tr align=\"center\">");
							out.print("<td>" + boardElement.GetIndex() + "</td>");
							out.print("<td>");
							out.print("<a href=\"boardOpen2.jsp?&boardName=computer_board&pageNumber=1&index="
									+ boardElement.GetIndex() + "\">");
							out.print(boardElement.GetTitle() + "</a></td>");
							out.print("<td>" + boardElement.GetWriter() + "</td>");
							out.print("<td>" + boardElement.GetRegDate() + "</td>");
							out.print("<td>" + boardElement.GetViewCount() + "</td>");
							out.print("</tr>");
						}
				%>
			</table>
		</div>

		<div class="container" style="visibility: hidden; position: absolute"
			id="board_4">
			<table class="table table-striped table-hover">
				<tr align="center">
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>날짜</td>
					<td>조회수</td>

				</tr>
				<%
					for (int i = 0; i < PRINT_COUNT && i < boardList.get(3).size(); i++) {
							Board boardElement = boardList.get(3).get(i);
							out.print("<tr align=\"center\">");
							out.print("<td>" + boardElement.GetIndex() + "</td>");
							out.print("<td>");
							out.print("<a href=\"boardOpen2.jsp?&boardName=info_board&pageNumber=1&index="
									+ boardElement.GetIndex() + "\">");
							out.print(boardElement.GetTitle() + "</a></td>");
							out.print("<td>" + boardElement.GetWriter() + "</td>");
							out.print("<td>" + boardElement.GetRegDate() + "</td>");
							out.print("<td>" + boardElement.GetViewCount() + "</td>");
							out.print("</tr>");
						}
				%>
			</table>
		</div>

		<div class="container" style="visibility: hidden; position: absolute"
			id="board_5">
			<table class="table table-striped table-hover">
				<tr align="center">
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>날짜</td>
					<td>조회수</td>

				</tr>
				<%
					for (int i = 0; i < PRINT_COUNT && i < boardList.get(4).size(); i++) {
							Board boardElement = boardList.get(4).get(i);
							out.print("<tr align=\"center\">");
							out.print("<td>" + boardElement.GetIndex() + "</td>");
							out.print("<td>");
							out.print("<a href=\"boardOpen2.jsp?&boardName=datainfo_board&pageNumber=1&index="
									+ boardElement.GetIndex() + "\">");
							out.print(boardElement.GetTitle() + "</a></td>");
							out.print("<td>" + boardElement.GetWriter() + "</td>");
							out.print("<td>" + boardElement.GetRegDate() + "</td>");
							out.print("<td>" + boardElement.GetViewCount() + "</td>");
							out.print("</tr>");
						}
				%>
			</table>
		</div>

	</div>

	<%
		conn.close();

		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
	%>

	<jsp:include page="footer.jsp" />
		<script type="text/javascript">
		function view(no) {

			switch (no) {
			case 1:
				document.all.board_1.style.visibility = "visible";
				document.all.board_2.style.visibility = "hidden";
				document.all.board_3.style.visibility = "hidden";
				document.all.board_4.style.visibility = "hidden";
				document.all.board_5.style.visibility = "hidden";
				break;
			case 2:
				document.all.board_1.style.visibility = "hidden";
				document.all.board_2.style.visibility = "visible";
				document.all.board_3.style.visibility = "hidden";
				document.all.board_4.style.visibility = "hidden";
				document.all.board_5.style.visibility = "hidden";
				break;
			case 3:
				document.all.board_1.style.visibility = "hidden";
				document.all.board_2.style.visibility = "hidden";
				document.all.board_3.style.visibility = "visible";
				document.all.board_4.style.visibility = "hidden";
				document.all.board_5.style.visibility = "hidden";
				break;
			case 4:
				document.all.board_1.style.visibility = "hidden";
				document.all.board_2.style.visibility = "hidden";
				document.all.board_3.style.visibility = "hidden";
				document.all.board_4.style.visibility = "visible";
				document.all.board_5.style.visibility = "hidden";
				break;
			case 5:
				document.all.board_1.style.visibility = "hidden";
				document.all.board_2.style.visibility = "hidden";
				document.all.board_3.style.visibility = "hidden";
				document.all.board_4.style.visibility = "hidden";
				document.all.board_5.style.visibility = "visible";
				break;
			}

		}
	</script>
</body>
</html>