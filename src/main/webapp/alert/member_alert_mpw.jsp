<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 비밀번호변경</title>
<script type="text/javascript">
	if(${modify_check} == "0"){
		alert("비밀번호가 변경되었습니다.");
	}else if(${modify_check} == "1"){
		alert("비밀번호를 확인해주세요.");
	}else{
		alert("비밀번호변경에 실패했습니다. 잠시후 다시 시도해주세요.");
	}
	window.location.href="../member/member_mypage.jsp";
</script>
</head>
</html>