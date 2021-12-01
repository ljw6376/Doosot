<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function(){
		if(${result > 0}){
			alert("주문 완료")
		}else{
			alert("주문 실패")
		}
		location.href = '../menu/menuList.do'
	}
</script>
</head>
<body>

</body>
</html>