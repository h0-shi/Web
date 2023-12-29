<%@page import="com.poseidon.team.Team"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 뽑기</title>
</head>
<body>
	<table border = "1">
<!-- 팀 뽑기를 만들어주세요  -->
<%Team teamClass = new Team();
List<String> team = teamClass.getTeam();
%>
		<tr>
		<td>팀명</td>
		<td>팀원 1</td>
		<td>팀원 2</td>
		<td>팀원 3</td>
		<td>팀원 4</td>
		<td>팀원 5</td>
		<td>팀원 6</td>
		</tr>
		<%for(int i = 0; i < 5; i++) {%>
		<%if(i != 4){ %>
		<tr>
			<td><%=i+1+"팀" %></td>
			<td><%=team.get(i*5)%></td>
			<td><%=team.get(i*5+1)%></td>
			<td><%=team.get(i*5+2)%></td>
			<td><%=team.get(i*5+3)%></td>
			<td><%=team.get(i*5+4)%></td>
			<td></td>
		</tr>
		<%}else{ %>
		<tr>
			<td><%=i+1+"팀" %></td>
			<td><%=team.get(i*5)%></td>
			<td><%=team.get(i*5+1)%></td>
			<td><%=team.get(i*5+2)%></td>
			<td><%=team.get(i*5+3)%></td>
			<td><%=team.get(i*5+4)%></td>
			<td><%=team.get(i*5+5)%></td>
		</tr>
		<%}
		} %>
		
		<a href = "./board.jsp">게시판</a>

	</table>
</body>
</html>