<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객의 소리 작성</title>
<script type="text/javascript">
	window.onload = function(){
		if(${result > 0}) {
			alert("작성하신 글을 저장하였습니다.");
			location.href="QnAList.do?pg=${pg}";
		} else {
			alert("작성하신 글을 저장하지 못하였습니다.");
			history.back();
		}
	}
</script>
</head>
<body>
</body>
</html>