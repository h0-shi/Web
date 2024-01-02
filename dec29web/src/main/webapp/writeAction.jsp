<%@page import="com.poseidon.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이거 서블릿으로 변경할거래</title>
</head>
<body>
	<!-- 데이터베이스에 값 전달하고 끝 -->
	<%
	// 한글 처리
	//입력되는 캐릭터의 인코딩을 UTF-8로 처리하라는 뜻
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	/*
	1. DAO 호출
	2. write(title, content);
	*/
	BoardDAO dao = new BoardDAO();
	int result = dao.write(title, content);

	if (result == 1) {
//		페이지 이동
		response.sendRedirect("./index.jsp");
	} else {
		response.sendRedirect("./error.jsp");
	}
	
	/*
	1이면 올바른 페이지 이동
	0이면 오류 페이지 이동

	3. 페이지 이동
	*/
	
	/*
		<!-- 페이지 이동하는 방법  -->
	<!-- 액션태그 -->
	<!-- 아래의 두개는 같은것임 -->
 	<jsp:forward page = "./main.jsp"></jsp:forward>
	<jsp:forward page = "./main.jsp"/>
	
	<!-- 자바 스크립트 -->
	<script type = "text/javascript">
		location.href = "./main.jsp";
	</script>
	*/
	%>



	<!-- 페이지 이동 -->
</body>
</html>