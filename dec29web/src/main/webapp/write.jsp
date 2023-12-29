<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<!-- css 파일 하나를 불러와서 하게(?)  -->
<link rel="stylesheet" type="text/css" href="./css/write.css">
</head>
<body>
	<h1>글쓰기</h1>
	<!-- form : 글 제목, 글 내용-->
	<form action="./writeAction.jsp">
		<input type="text" name="title">
		<input type="text" name="writer">
		<textarea name="content"></textarea>
		<button type="submit">글쓰기</button>
	</form>

</body>
</html>