<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
이 부분이 다른 페이지에 그대로 이식이 되면 중복 코드가 생김.
따라서 이 부분은 삭제되어야 함
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 만들기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title> -->
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style>
body {
	margin: 0;
	padding: 0;
}

.navi {
	width: 100%;
	height: 30px;
	text-align: center;
	background-color: black;
}

.menu {
	/* list의 ● 제거  */
	list-style: none;
	width: auoto;
	height: 30px;
	margin: 0px;
	text-align: center;
}
/* menu의 li */
.menu li {
	width: 100px;
	height: 30px;
	color: white;
	line-height: 30px;
	display: inline-block;
}

.menu li:hover {
	background-color: white;
	color: black;
}

main {
	background-color: gray;
	margin: 0px 5px;
	height: auto;
	width: calc(100% -10px);
}
</style>
<!-- </head>
<body> -->
	<div>
		<nav class="navi">
        <ul class="menu">
            <li onclick = "url('./')'"><i class="xi-apple"></i>홈</li>
            <li onclick = "url('./board')">게시판</li>
            <li onclick = "url('./notice')">문의사항</li>
            <li onclick = "url('./login')">로그인</li>
        </ul>
    </nav>
	</div>
	<script>
		function url(url){location.href="url";}
	</script>
<!-- </body>
</html> -->