<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 아이디 찾기</title>
<script type="text/javascript">
	if(${findId_check} == "0"){
		if(confirm("회원님의 ID는 ${id}입니다. 로그인하시겠습니까?")){
			window.location.href="../member/member_findIdPw.jsp?findId_check=${findId_check}&id=${id}";
		}else{
			window.location.href="../member/member_findIdPw.jsp";
		}
	}else{
		alert("아이디/전화번호를 확인해주세요.");
		window.location.href="../member/member_findIdPw.jsp?findId_check=${findId_check}";
	}
	
</script>
</head>
</html>