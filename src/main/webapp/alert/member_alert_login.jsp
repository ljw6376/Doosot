<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 로그인</title>
<script type="text/javascript">
	if(${login_check} == "0"){
		alert("로그인되었습니다.");
		window.location.href="../main/main.jsp";
	}else{
		alert("아이디/비밀번호를 확인해주세요.");
		window.location.href="../member/member_login.jsp";
	}
</script>
</head>
</html>