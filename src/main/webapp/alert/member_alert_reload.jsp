<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 예치금충전</title>
<script type="text/javascript">
	if(${reload_check} == "0"){
		alert("감사합니다. 예치금 충전이 완료되었습니다.");
	}else{
		alert("죄송합니다. 예치금 충전에 실패했습니다. 잠시 후 다시 시도해주세요.");
	}
	window.location.href="../member/member_mypage.jsp";
</script>
</head>
</html>