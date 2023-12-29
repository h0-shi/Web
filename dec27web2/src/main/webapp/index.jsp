<%@page import="com.poseidon.dto.EmployeesDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.poseidon.dao.EmployeesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기가 제목</title>
</head>
<body>
	<h1>여기가 바디래요</h1>
<% 
EmployeesDAO dao = new EmployeesDAO();
List<EmployeesDTO> list = dao.selectEmployees();
%>
	<table border="1">
		<thead>
		<tr>
			<th>EMP_NO</th>
			<th>BIRTH_DAY</th>
			<th>FIRST_NAME</th>
			<th>LAST_NAME</th>
			<th>GENDER</th>
			<th>HIRE_DATE</th>
		</tr>
		</thead>
		<tbody>
		<%for(int i = 0; i < list.size(); i++){ %>
		<tr>
		<td><%=list.get(i).getEmp_no()%></td> 
		<td><%=list.get(i).getBirth_date()%></td> 
		<td><%=list.get(i).getFirst_name()%></td> 
		<td><%=list.get(i).getLast_name()%></td> 
		<td><%=list.get(i).getGender()%></td> 
		<td><%=list.get(i).getHire_date()%></td> 
		</tr>
		<%} %>
		</tbody>
	</table>
</body>

</html>