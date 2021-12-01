<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkIdClose() {
		// opener 객체 : 현재 브라우저 기준 부모 브라우저를 관리하는 객체
		opener.loca_frm.loca_name.value = "${loca_name}";
		window.close();  // 열려있는 브라우저 닫기
		opener.loca_frm.loca_addr.focus();
	}
</script>
<style type="text/css">
form {
    width: 90%;
    height: 100px;
    border: 3px solid orange;
    text-align: center;
    padding: 20px;
    margin:auto;
    
}

</style>
</head>
<body>
	<form action="checkName.do" method="post">
		<c:if test="${exist == true}">
			${loca_name}는 사용중입니다.<br><br>
			매장명 <input type="text" name="loca_name">
			<input type="submit" value="중복 체크">
		</c:if>
		
		<c:if test="${exist == false}">
			${loca_name}는 사용 가능합니다.<br><br>
			<input type="button" value="사용" onclick="checkIdClose()">
		</c:if>		
	</form>
</body>
</html>