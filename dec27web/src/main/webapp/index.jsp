<%@page import="com.poseidon.db.EmployeesDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.poseidon.db.EmployeesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>departments</h1>
	
<%
// 여기는 자바 영역입니다~~
EmployeesDAO dao = new EmployeesDAO();
List<EmployeesDTO> list = dao.selectDepartments();
%>

	<table border = "1"> 
		<tr>
			<td>dept_no</td>
			<td>dept_name</td>
		</tr>	
		<%for(int i = 0; i<list.size(); i++){ %>
		<tr>
			<td><%=list.get(i).getDept_no() %></td>
			<td><%=list.get(i).getDept_name() %></td>
		</tr>
		<%} %>
	</table>
	<a href="./employees.jsp">직원 목록 보기</a>

<!-- 주석 단축키는 ctrl+shift+/ -->
</body>
</html>