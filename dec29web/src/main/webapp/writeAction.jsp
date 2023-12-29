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
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	%>
	
	타이틀 : <%=title %><br>
	내용 : <%=content %><br>
	<!-- 페이지 이동 -->
</body>
</html>