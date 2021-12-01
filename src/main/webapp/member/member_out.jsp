<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 회원탈퇴</title>
<style type="text/css">
	html{width: 400px; height:360px; border: 5px solid orange; border-bottom:13px solid orange;}
	#header{border-bottom: 1px solid #ececec;}
	#header p{font-size: 30px; font-weight:600;}
	
	#content span{font-size:20px; color:orange;}
	input[type="password"]{
		height:50px; 
		width:337px; 
		border:1px solid #ececec; 
		text-align:center;
	}
	input[type="button"],input[type="submit"]{
		margin:20px 0 15px 23px;
		width:300px;
		height:30px; 
		color:dimgray; 
		border:none;
	}
</style>
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var out_check = getParameters("out_check");
		if(out_check == "0"){
			opener.location.href="../main/main.jsp"
			window.close();
		}
	}
	function getParameters(paramName) {
		var params = location.search.substr(location.search.indexOf("?") + 1);
		var returnValue = "";
		params = params.split("&");
		for (var i = 0; i < params.length; i++) {
			temp = params[i].split("=");
			if ([temp[0]] == paramName) {
				returnValue = temp[1];
			}
		}
		return returnValue;
	}
	$(function() {
		var pw = $("form input[type='password']");
		pw.blur(function() { // 입력창에서 포커스아웃 시
			var button = $("input[value='탈퇴하기']");
			if(pw.val().length > 0){ // 뭔가 있으면
				button.removeAttr("type").attr("type","submit"); // 활성화
				button.css("background-color","orange").css("color","white");
			}else{	// 비어있으면
				button.removeAttr("type").attr("type","button"); // 비활성화
				button.css("background-color","#ececec").css("color","dimgray");
			}
		});
	});
</script>
</head>
<body>
	<div id="header">
		<p>두솥 회원탈퇴</p>
	</div>
	<br>
	<div id="content">
		<p><span>${login_name }</span>님,
		 정말 탈퇴하시려구요? 너무 아쉬워요...</p>
		<br>
		<fieldset>
			<form action="member_out.do" method="post">
				<input type="hidden" name="login_id" value="${login_id }">
				<input type="password" name="pw" placeholder="비밀번호를 입력해주세요.">
				<input type="button" value="탈퇴하기">
			</form>
		</fieldset>
		<br>
	</div>
	<br>
</body>
</html>