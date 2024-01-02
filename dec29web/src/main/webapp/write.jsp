<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<!-- css 파일 하나를 불러와서 하게(?)  -->
<link rel ="stylesheet" type="text/css" href="./css/write.css">

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
	<h1>글쓰기</h1>
	<!-- form : 글 제목, 글 내용-->
	<!-- get방식이면 method = "get" or 공백/
	post 방식이면 method = "post"  -->
	<form action="./write" method = "post">
		<input type="text" name="title" id="title">
		<textarea name="content" class="content"></textarea>
		<button type="submit" onclick = "return check()">글쓰기</button>
	</form>

</body>
</html>