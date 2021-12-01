<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 새 비밀번호로 변경</title>
<script type="text/javascript">
	if(${findPw_check} == "0"){
		if(confirm("비밀번호가 변경되었습니다. 로그인하시겠습니까?")){
			window.location.href="../member/member_findIdPw.jsp?findPw_check=${findPw_check}";
		}else{
			window.location.href="../member/member_findIdPw.jsp";
		}
	}else{
		alert("아이디를 확인해주세요.");
		window.location.href="../member/member_findIdPw.jsp?findPw_check=${findPw_check}";
	}
	
</script>
</head>
</html>