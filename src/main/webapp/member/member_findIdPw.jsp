<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 아이디/비밀번호 찾기</title>
<style type="text/css">
	html{width: 590px;height: 541px;border: 5px solid orange;border-bottom: 13px solid orange;}
	#header{border-bottom: 1px solid #ececec;}
	#header p{font-size: 30px; font-weight:600;}
	
	fieldset{border:none; min-height: 178px;}
	#id{border-bottom: 1px solid #ececec;}
	.title{margin-left:30px; font-size:20px;}
	table{margin:0 auto; width:500px; height:60px; text-align:center;}
	.input{width:348px; height:50px;font-size: 15px;border: 1px solid; text-align:center;}
	.tel{
		height: 50px;
		width:104px;
		border: 1px solid;
	}
	input[type='button']{width:120px; height:40px; border:none; color:dimgray;}
	input[type='submit']{width:120px; height:40px; border:none; color:dimgray;}

</style>
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var id = getParameters("id");
		var findId_check = getParameters("findId_check");
		var findPw_check = getParameters("findPw_check");
		if(findId_check == "0"){
			window.opener.document.getElementById("id").value = id;
			window.opener.document.getElementById("pw").focus();
			window.close();
		}else if(findPw_check == "0"){
			window.opener.document.getElementById("id").focus();
			window.close();
		}
	}
	function getParameters(param) {
		var params = location.search.substr(location.search.indexOf("?") + 1);
		var returnValue = "";
		params = params.split("&");
		for (var i = 0; i < params.length; i++) {
			temp = params[i].split("=");
			if ([temp[0]] == param) {
				returnValue = temp[1];
			}
		}
		return returnValue;
	}
	
	$.id_func = function() {
		var x = document.getElementById("phone1").selectedIndex;
		var y = document.getElementById("phone1").options;
		var idx = y[x].index;
		if($("input[name='name']").val().length > 0 && idx != 0 &&
		   $("input[name='phone2']").val().length > 0 &&
		   $("input[name='phone3']").val().length > 0){
			$("input[value='아이디 찾기']").attr("type","submit");
			$("input[value='아이디 찾기']").css("background","orange").css("color","white");
		}else{
			$("input[value='아이디 찾기']").attr("type","button");
			$("input[value='아이디 찾기']").css("background","#ececec").css("color","dimgray");
		}
	};
	$.pw_func = function() {
		if($("input[name='find_id']").val().length > 0 && $("input[name='find_pw']").val().length > 0){
			$("input[value='비밀번호 변경']").attr("type","submit");
			$("input[value='비밀번호 변경']").css("background","orange").css("color","white");
		}else{
			$("input[value='비밀번호 변경']").attr("type","button");
			$("input[value='비밀번호 변경']").css("background","#ececec").css("color","dimgray");
		}
	};
	$(function() {
		$("input[name='name']").blur(function() { $.id_func(); });
		$("select[name='phone1']").blur(function() { $.id_func(); });
		$("input[name='phone2']").blur(function() { $.id_func(); });
		$("input[name='phone3']").blur(function() { $.id_func(); });
		
		$("input[name='find_id']").blur(function() { $.pw_func(); });
		$("input[name='find_pw']").blur(function() { $.pw_func(); });
		
	});
</script>
</head>
<body>
	<div id="header">
		<p>두솥 아이디/비밀번호 찾기</p>
	</div>
	<br>
	<div id="content">
		<fieldset id="id">
			<span class="title">아이디 찾기</span>
			<form action="member_findId.do" name="id_frm">
				<table>
					<tr>
						<td>
							<input type="text" class="input" name="name" placeholder="이름을 입력하세요.">
						</td>
						<td width="130px" rowspan="2">
							<input type="button" name="checking" value="아이디 찾기">
						</td>
					</tr>
					<tr>
						<td>
							<select class="tel" id="phone1" name="phone1" style="text-align:center;">
								<option>--- 선택 ---</option>
								<option>010</option>
								<option>011</option>
								<option>017</option>
								<option>019</option>
							</select> -
							<input type="text" class="tel" name="phone2"> -
							<input type="text" class="tel" name="phone3">
							<span id="ph_alert"></span>
						</td>
					</tr>
				</table>
				<br>
			</form>
		</fieldset>
		<br><br>
		<fieldset>
			<span class="title">새로운 비밀번호 설정</span>
			<form action="member_findPw.do" name="pw_frm">
				<table>
					<tr>
						<td>
							<input type="text" class="input" name="find_id" placeholder="아이디를 입력하세요.">
						</td>
						<td width="130px" rowspan="2">
							<input type="button" name="checking" value="비밀번호 변경">
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" class="input" name="find_pw" placeholder="새로운 비밀번호를 입력하세요.">
						</td>
					</tr>
				</table>
			</form>
		</fieldset>
	</div>
</body>
</html>