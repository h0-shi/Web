<%@page import="com.poseidon.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.poseidon.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 만들기</title>
</head>
<style type="text/css">
	/* 주석 */
	body{
		background-color : yellow;
	}
	h1, h2{
		color : red;
		font-weight: bold;
		font-family: "D2coding";
	}
#head3 {
	color:#c0c0c0;
	text-decoration :underline;
}
.head3{
	background-color : gray;
	text-align : center;
}
#board{
	width:100%;
	height:500px;
	background-color : white;
	border-collapse: ollapse;
}
td{
	border-bottom : 1px solid black;
	text-align : right;
}
/*
tr:nth-child(even){
	background-color: gray;
}
*/
.w1{
	width : 50px;
	}
.w2{
	width : 100px;
	}
.w5{
	width : 400px;
	text-align: left;
}
th{

}
tr:hover{
	background-color:blue;
	color:white;
}
</style>

<body>
	<!-- db 가져오기 -->
	<!-- 10개 글만 가져오기 -->
	<!-- 번호, 제목, 글쓴이, 조회수, 날짜 -->
	<% 
	BoardDAO dao = new BoardDAO();
	List<BoardDTO> list = dao.boardList();
	%>
	<h1>게시판</h1>
	<h2>게시판2</h2>
	<h3 class=head3>게시판3</h3>
	<table id="board">
		<tr>
			<th>번호</th>
			<th>제목 </th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%
		for(BoardDTO dto : list){
		%>
		<tr>
			<td class="w1"><%=dto.getBoard_no() %></td>
			<td class="w5"><%=dto.getBoard_title() %></td>
			<td class="w1"><%=dto.getBoard_write() %></td>
			<td class="w2"><%=dto.getBoard_date() %></td>
			<td class="w1"><%=dto.getBoard_count() %></td>
		</tr>
		<%
		} 
		%>
	</table>
</body>
</html>