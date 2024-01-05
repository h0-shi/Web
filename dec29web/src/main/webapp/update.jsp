<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<!-- css 파일 하나를 불러와서 하게(?)  -->

<!--섬머노트 -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!--섬머노트 -->

<link rel="stylesheet" type="text/css" href="./css/write.css">
<script type="text/javascript">
	function check() {
//		내용 입력 안하면 글 작성 못하게 막는 것
		
//		alert('!')
//		var title = document.getElementsByName("title");
//		alert(title[0].value);
		var title = document.getElementById("title");
		if(title.value.length < 5){
			alert("제목은 5글자 이상이여야 합니다.");
			return false;
		}
		var content = document.getElementsByClassName("content");
		if(content[0].value.length < 3){
			alert("내용은 3글자 이상으로 적어주세요.");
			// content에 커서 넣기
			content[0].focus();
			return false;
		}
	}
</script>
</head>
<body>
<%@ include file = "./menu.jsp" %>
<%
	Map<String, Object> detail = (Map<String, Object>) request.getAttribute("detail");
%>
	<h1>글 수정하기</h1>
	<%=detail.get("board_no") %>
	<!-- form : 글 제목, 글 내용-->
	<!-- get방식이면 method = "get" or 공백/
	post 방식이면 method = "post"  -->
	<form action="./update" method = "post" >
	<!-- input에는 꺽쇠 안에서 호출  -->
		<input type="text" name="title" id="title" value="<%=detail.get("board_title") %>">
	<!-- text area에는 꺽쇠 밖에서 호출.  -->
		<textarea id="summernote" name="content" class="content"><%=detail.get("board_content") %></textarea>
		<button type="submit" onclick = "return check()">글쓰기</button>
		<input type="text" name="no" value = "<%=detail.get("board_no")%>">
	</form>
		<script>
	$(document).ready(function() {
		  $('#summernote').summernote({
			  height : 300
		  }
				  );
		});
	</script>

</body>
</html>