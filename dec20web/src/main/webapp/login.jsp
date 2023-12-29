<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
</head>
<body>
<%
//여기는 자바입니다.
String id = request.getParameter("id");
String pw = request.getParameter("pw");

String result = "불일치";

if(id.equals("poseidon")&&pw.equals("01234567")){
	result = "일치";
}

%>

	당신이 입력한 id는 : <%=id %><br>
	당신이 입력한 암호는 : <%=pw %><br>
	
	결과 : <%=result %> 입니다.
</body>
</html>