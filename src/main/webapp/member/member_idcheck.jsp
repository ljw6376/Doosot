<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 아이디 중복체크</title>
<style type="text/css">
	html{width: 590px;height: 281px;border: 5px solid orange;border-bottom: 13px solid orange;}
	#header{border-bottom: 1px solid #ececec;}
	#header p{font-size: 30px; font-weight:600;}
	
	table{margin:0 auto; width:500px; height:60px; text-align:center;}
	input[type='text']{width:350px; height:50px;font-size: 15px;border: 1px solid; text-align:center;}
	input[type='button']{width:120px; height:25px; border:none; color:dimgray;}
	input[value="중복확인"]{}
	
	#after_check p{text-align:center;}
</style>
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
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
	
	function no_special_word() {
		var pattern_num = /[0-9]/;	// 숫자 
		var pattern_eng = /[a-zA-Z]/;	// 영어 
		var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;	// 한글
		var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
		if(pattern_num.test(frm.check_id.value) && pattern_eng.test(frm.check_id.value) 
				&& !(pattern_kor.test(frm.check_id.value)) && !(pattern_spc.test(frm.check_id.value))){
			frm.submit();
		}else if(pattern_kor.test(frm.check_id.value) || pattern_spc.test(frm.check_id.value)){
			alert("아이디에 한글/특수문자가 포함될 수 없습니다.")
			frm.check_id.focus();
		}else if(!(pattern_num.test(frm.check_id.value)) && !(pattern_eng.test(frm.check_id.value))){
			alert("아이디는 영어/숫자 조합으로 생성해야합니다.")
			frm.check_id.focus();
		}
	}
	
	var id = getParameters("checkId");
	function use_id() {
		window.opener.document.getElementById("mem_id").value = id;
		window.close();
	}
	$(function() {
		$('input[type="text"]').keydown(function() { // 엔터 금지
		    if (event.keyCode === 13) {
		    	event.preventDefault();
		    }
		});
		$("input[type='text']").blur(function() {
			if($("input[type='text']").val().length > 0){
				$("input[name='checking']").attr("onclick","no_special_word()");
				$("input[name='checking']").css("background","orange").css("color","white");
			}else{
				$("input[name='checking']").removeAttr("onclick");
				$("input[name='checking']").css("background","#ececec").css("color","dimgray");
				
				$("input[name='using']").removeAttr("onclick");
				$("input[name='using']").css("background","#ececec").css("color","dimgray");
				
				$("#after_check p ").html("!,@,# 등의 특수기호는 아이디에 사용하실 수 없습니다.").css("color","black");
			}
		});
		
		$(document).ready(function() {
			if(id){
				$("input[type='text']").attr("value",id);
				
				$("input[name='checking']").removeAttr("onclick");
				$("input[name='checking']").css("background","#ececec").css("color","dimgray");
				
				$("input[name='using']").attr("onclick","use_id()");
				$("input[name='using']").css("background","orange").css("color","white");
				
				$("#after_check p ").html("사용하실 수 있는 아이디입니다.").css("color","blue");
			}
		});
	});
</script>
</head>
<body>
	<div id="header">
		<p>두솥 아이디 중복체크</p>
	</div>
	<br>
	<div id="content">
		<form action="check_id.do" name="frm">
			<table>
				<tr>
					<td rowspan="2">
						<input type="text" name="check_id" placeholder="아이디를 입력하세요.">
					</td>
					<td width="130px">
						<input type="button" name="checking" value="중복확인">
					</td>
				</tr>
				<tr>
					
					<td>
						<input type="button" name="using" value="사용하기">
					</td>
				</tr>
			</table>
			<br>
			<div id="after_check">
				<p>!,@,# 등의 특수기호는 아이디에 사용하실 수 없습니다.</p>
			</div>
			
		</form>
	</div>
</body>
</html>