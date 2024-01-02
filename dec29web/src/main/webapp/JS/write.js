/**
 * 자바스크립트 파일입니다. 
 */

function write1() {
	if (confirm("진짜 쓸거야??")) {
		alert("와... 그래.. 그렇게 해");
		location.href = "./write.jsp";
	} else {
		alert("잘 생각해쓰");
	}
}