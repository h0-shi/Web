<%@page import="com.poseidon.dao.BoardDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<style type="text/css">
/* 여기가 css 파티. 공부하자 */
table {
	width: 800px;
	border-collapse: collapse;
}
tr{
	height : 30px;
}
td {
	text-align: center;
	border-bottom: #c0c0c0 1px solid;
}

tbody tr:hover {
	background-color: silver;
}

.w1 {
	width: 10%;
}

.w2 {
	width: 15%;
}

.w5 {
	width: 55%;
	text-align: left;
}
</style>
<!-- script 실행 시 ./JS/write 로 이동 -->
<script src="./JS/write.js" charset = "UTF-8"></script>
</head>
<body>
	<h1>index</h1>
	<!-- 게시판 내용 보기 -->
	<!-- 이게 옛날 방식 - 오래걸리고 번거롭다. -->
	<!-- jsp 한 파일에 접속 정보등 모든 정보를 담고 있음 -->
	<!-- 에러 발생 시 페이지의 모든 코드 노출 -->
	<!-- 이건 개위험한데 -->
	<%
	/*
		Class.forName("org.mariadb.jdbc.Driver");
		String url = "jdbc:mariadb://guro.wisejia.com:3307/c23c_07";
		Connection conn = DriverManager.getConnection(url, "c23c_07", "kiri!94859485");

		String sql = "SELECT * FROM board";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		while (rs.next()) {
			Map<String, Object> e = new HashMap<String, Object>();
			e.put("board_no", rs.getInt("board_no"));
			e.put("board_title", rs.getString("board_title"));
			e.put("board_write", rs.getString("board_write"));
			e.put("board_date", rs.getString("board_date"));
			e.put("board_count", rs.getInt("board_count"));
			list.add(e);
		}
		*/
	BoardDAO dao = new BoardDAO();
	List<Map<String, Object>> list = dao.boardList();
	%>
	<!-- 	나온 결과 : -->

	<table border="1">
		<thead>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일자</td>
				<td>조회수
			</tr>
		</thead>
		<tbody>
			<%
			// servlet 서블릿 : 자바 코드 속에 html이 있다...?
			// jsp = java server page : html 코드 속에 java가 있다.
			for (Map<String, Object> map : list) {
			%>
			<tr>
				<td class="w1"><%=map.get("board_no")%></td>
				<td class="w5"><a
					href="./detail.jsp?no= <%=map.get("board_no")%>"> <%=map.get("board_title")%>
					<!-- 와.. 여기서 가져오는거였네 -->
				</a></td>
				<td class="w1"><%=map.get("board_write")%></td>
				<td class="w2"><%=map.get("board_date")%></td>
				<td class="w1"><%=map.get("board_count")%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<button onclick="write1()">글쓰기</button>
	
	<script type="text/javascript">
		function write1() {
			if (confirm("진짜 쓸거야??")) {
				alert("와... 그래.. 그렇게 해");
				location.href = "./write.jsp";
			} else {
				alert("잘 생각해쓰");
			}
		}
	</script>

	연습
	<a href="./test">여기</a>를 눌러주세요.
	<br> 연습
	<a href="./main">여기</a>를 누르면 메인(근데 그런거 없음).

	<!-- 	자바 코드를 여러 줄 쓸 때는 < % % >
	자바의 값 하느를 출력 할 때에는 < %= % > -->

</body>
</html>