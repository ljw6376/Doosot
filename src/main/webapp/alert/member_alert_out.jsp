<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 회원탈퇴</title>
<script type="text/javascript">
	if(${out_check} == "0"){
		alert("회원탈퇴 되었습니다. 다음에 또 만나요~");
	}else if(${out_check} == "1"){
		alert("비밀번호를 확인해주세요.");
	}else{
		alert("회원탈퇴에 실패했습니다. 잠시후 다시 시도해주세요.");
	}
	window.location.href="../member/member_out.jsp?out_check=${out_check}";
</script>
</head>
</html>