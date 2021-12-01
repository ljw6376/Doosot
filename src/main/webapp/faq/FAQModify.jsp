<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQModify</title>
<script type="text/javascript">
	window.onload = function() {
		if(${result > 0}) {
			alert("작성하신 글을 수정하였습니다.");
			location.href="FAQList.do?pg=${pg}";
		} else {
			alert("작성하신 글을 수정하지 못하였습니다.");
			history.back();
		}		
	}
</script>

</head>
<body>

</body>
</html>