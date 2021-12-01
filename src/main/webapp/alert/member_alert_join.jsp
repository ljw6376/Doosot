<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 회원가입</title>
<script type="text/javascript">
	if(${join_check} == "0"){
		alert("감사합니다. 회원가입이 완료되었습니다.");
		window.location.href="../member/member_login.jsp";
	}else{
		alert("죄송합니다. 회원가입에 실패했습니다. 잠시 후 다시 시도해주세요.");
		window.location.href="../member/member_join.jsp";
	}
</script>
</head>
</html>