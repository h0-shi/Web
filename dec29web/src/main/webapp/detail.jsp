<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.poseidon.dao.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>톺아보기</title>
</head>
<body>
<%@ include file = "./menu.jsp" %>
	<h1>톺아본다</h1>
	<%
//	String no = request.getParameter("no");

	//DAO 호출
//	BoardDAO dao = new BoardDAO();
//	Map<String, Object> detail = dao.detail(no);
    Map<String, Object> detail = (Map<String, Object>) request.getAttribute("detail");
	//네트워크 상의 모든 data는 String으로 다닌다.
	%>
	<!-- 삭제 이미지를 누르면 삭제되는 기능을 넣어보자  -->
	<!-- a링크  -->
	

 	<img onclick= "update()" alt = "수정" src="./IMG/update.png" 
		title = "버튼을 누르면 글을 수정합니다.">
	<img onclick="del(<%=detail.get("board_no")%>)" alt="삭제" src="./IMG/delete.png"
		title="버튼을 누르면 삭제합니둥">
	<br> 제목 :	<%=detail.get("board_title")%>
	<br> 작성자 : <%=detail.get("board_write")%>
	<br> 작성일 : <%=detail.get("board_date")%><br> 조회수 :<%=detail.get("board_count")%>
	<hr>
	<%=detail.get("board_content")%>
	<br>
	<button onclick="location.href='./index.jsp'">돌아가기</button>
	<!-- what 함수 사용  -->
	<button onclick="what()">눌러봐요</button>
	<script type="text/javascript">

		
		function what() {
			for (var i = 0; i < 1; i++) {
				alert("Hey");
			}
		}
		
		function del(no) {
			if (confirm("정말 삭제할거가?")) {
				location.href = "./delete?no="+no;
				// .jsp 빼면 서블릿이다~
			} else {
				alert("그래 잘 생각했어");
			}
		}
		
		function update(){
			var check = confirm("수정하시겠어요?");
			if(check){
				alert("글을 수정합니다.")
				location.href="./update?no=<%=detail.get("board_no")%>";
				//위 문장은 서버단에서
				// 그 후 html/css/js단에서 처리
				// 실행순서
				//1. 자바 코드 먼저 실행 = 서버단
				//2. html/css/js 실행 = 클라이언트단에서 처리
			}
			
		}
		
		
	</script>



</body>
</html>