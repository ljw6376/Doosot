<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(${checked} == "1"){
		alert("이미 존재하는 아이디 입니다.");
		window.location.href = "../member/member_idcheck.jsp"
	}else{
		window.location.href = "../member/member_idcheck.jsp?checkId=${id}"
	}
</script>
</head>
</html>