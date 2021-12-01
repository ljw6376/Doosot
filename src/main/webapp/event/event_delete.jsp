<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		if(${result > 0}) {
			alert("글을 삭제하였습니다.");
			location.href="event_list.do?pg=${pg}";
		} else {
			alert("글을 삭제하지 못하였습니다.");
			history.back();
		}		
	}
</script>

</head>
<body>

</body>
</html>