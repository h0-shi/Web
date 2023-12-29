<%@page import="com.poseidon.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
</head>
<body>
<!-- 이 페이지는 삭제기능만 수행 후 페이지로 돌아갑니다.  -->
	<%
	String no = request.getParameter("no");
	
	BoardDAO dao = new BoardDAO();
	dao.delete(no);
	
	// 페이지 이동 => 작업을 수행하고 할 일
	response.sendRedirect("./index.jsp");
	
	
	%>
	<!-- 리다이렉트가 있어서 이 아래는 수행되지 않음  -->
	글자
	글자
</body>
</html>