<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객의 소리 답변</title>
<script type="text/javascript">
	window.onload = function(){
		if(${result > 0}) {
			alert("작성하신 답변을 저장하였습니다.");
			location.href="QnAView.do?pg=${pg}&qna_seq=${qna_seq}";
		} else {
			alert("작성하신 답변을 저장하지 못하였습니다.");
			history.back();
		}
	}
</script>
</head>
<body>
</body>
</html>