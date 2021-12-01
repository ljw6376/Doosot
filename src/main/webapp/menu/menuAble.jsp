<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥</title>
<script type="text/javascript">
window.onload = function(){
	if(${result} > 0){
		alert("활성화 완료");
		location.href = "menuList.do?menu_category=" + "${category }";
	}else if(${result} == 0){
		alert("활성화 실패");
		history.back();
	}
}
</script>
</head>
<body>

</body>
</html>