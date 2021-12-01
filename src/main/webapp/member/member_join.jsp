<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 회원가입</title>
<link rel="stylesheet" type="text/css" href="../css/member_join_css.css?v=2">
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	var pattern_num = /[0-9]/;	// 숫자 
	var pattern_eng = /[a-zA-Z]/;	// 영어 
	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ]/;	// 자음,모음
	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	function only_korean(tag_value) {
		if(pattern_num.test(tag_value) || pattern_eng.test(tag_value) 
				|| pattern_spc.test(tag_value)){
			return 1; // 한글 이외의 글자면
		}else if(pattern_kor.test(tag_value)){
			return 2; // 자음-모음 만 썻다면
		}
	}
	function only_number(tag_value) {
		if(pattern_kor.test(tag_value) || pattern_eng.test(tag_value) || pattern_spc.test(tag_value)){
			return 1; // 숫자가 아니면
		}
	}

	$(function() {
		var popup_width = 600;
		var popup_height = 300;
		var screen_x = (window.screen.width / 2) - (popup_width / 2);
		var screen_y= (window.screen.height / 2) - (popup_height / 2);
		var url = "../member/member_idcheck.jsp";
		// 아이디 입력창 클릭시 팝업 생성
		$("input[name='mem_id']").click(function() {
			window.open(url+"?check_id="+$("input[name='mem_id']").val(),"", "width="+popup_width+",height="+popup_height+
						",left="+screen_x+",top="+screen_y);
		});
		// 아이디가 입력되면 비번 입력가능
		$("input[type='password']").click(function() {
			if($("input[name='mem_id']").val().length > 0){
				$("input[type='password']").removeAttr("readonly");
			}
		});
		// 비번 입력 후 작동
		$("#check_pw").blur(function() {
			if($("input[name='mem_pw']").val() != $("#check_pw").val()){ // 비밀번호랑 일치하지 않을 시
				$("#check_pw").focus();
				$("#pw_alert").html("잘못된 비밀번호").css("color","red");
			}else if($("#check_pw").val().length == 0){ // 빈칸이면
				$("input[name='mem_name']").attr("readonly","readonly");
			}else{ // 일치하면
				$("input[name='mem_name']").removeAttr("readonly");
				$("#pw_alert").html("");
			}
		});
		// 이름 입력 후 작동
		$("input[name='mem_name']").blur(function() {
			var korean = only_korean($("input[name='mem_name']").val()); // 검사함수
			
			if(korean == 1){ // 한글이 아닌 문자일 시
				$("input[name='mem_name']").focus();
				$("#nm_alert").html("한글로만 작성").css("color","red");
			}else if(korean == 2){ // 자음,모음만 입력 될 시
				$("input[name='mem_name']").focus();
				$("#nm_alert").html("잘못된 이름형식").css("color","red");
			}else if($("input[name='mem_name']").val().length == 0){// 빈칸이 되면
				$("select[name='mem_phone1']").attr("disabled","disabled");
				$("input[name='mem_phone2']").attr("readonly","readonly");
				$("input[name='mem_phone3']").attr("readonly","readonly");
			}else{
				$("select[name='mem_phone1']").removeAttr("disabled");
				$("input[name='mem_phone2']").removeAttr("readonly");
				$("#nm_alert").html("");
			}
		});
		// 전화번호2 입력 후 작동
		$("input[name='mem_phone2']").blur(function() {
			var phone2 = only_number($("input[name='mem_phone2']").val()); // 검사함수
			
			if(phone2 == 1){ // 숫자 이외의 문자일시
				$("input[name='mem_phone2']").focus();
				$("#ph_alert").html("숫자만 입력").css("color","red");
			}else if($("input[name='mem_phone2']").val().length < 3){
				$("input[name='mem_phone2']").focus();
				$("#ph_alert").html("최소 3자리 번호").css("color","red");
			}else if($("input[name='mem_phone2']").val().length > 4){
				$("input[name='mem_phone2']").focus();
				$("#ph_alert").html("최대 4자리 번호").css("color","red");
			}else if($("input[name='mem_phone2']").val().length == 0){// 빈칸이 되면
				$("input[name='mem_phone3']").attr("readonly","readonly");
			}else{
				$("input[name='mem_phone3']").removeAttr("readonly");
				$("#ph_alert").html("");
			} 
		});
		// 전화번호3 입력 후 작동
		$("input[name='mem_phone3']").blur(function() {
			var phone3 = only_number($("input[name='mem_phone2']").val()); // 검사 함수
			
			if(phone3 == 1){ // 숫자 이외의 문자일시
				$("input[name='mem_phone3']").focus();
				$("#ph_alert").html("숫자만 입력").css("color","red");
			}else if($("input[name='mem_phone3']").val().length < 4){
				$("input[name='mem_phone2']").focus();
				$("#ph_alert").html("최소 4자리 번호").css("color","red");
			}else if($("input[name='mem_phone3']").val().length > 4){ // 4자리보다 크면
				$("input[name='mem_phone2']").focus();
				$("#ph_alert").html("최대 4자리 번호").css("color","red");
			}else if($("input[name='mem_phone3']").val().length == 0){// 빈칸이 되면
				$("input[name='mem_addr']").attr("readonly","readonly");
			}else{
				$("input[name='mem_addr']").removeAttr("readonly");
				$("#ph_alert").html("");
			}
		});
		// 주소 입력 후 작동
		$("input[name='mem_addr']").blur(function() {
			var addr = only_korean($("input[name='mem_addr']").val());
			if(addr == 1){ // 한글 이외의 문자일시
				$("input[name='mem_addr']").focus();
				$("#addr_alert").html("한글로만 작성").css("color","red");
			}else if(addr == 2){ // 자음,모음만 입력될 시
				$("input[name='mem_addr']").focus();
				$("#addr_alert").html("잘못된 주소형식").css("color","red");
			}else if($("input[name='mem_addr']").val().length == 0){// 빈칸이 되면
				$("input[name='mem_email1']").attr("readonly","readonly");
				$("select[name='mem_email2']").attr("disabled","disabled");
			}else{
				$("input[name='mem_email1']").removeAttr("readonly");
				$("select[name='mem_email2']").removeAttr("disabled");
				$("#addr_alert").html("");
			}
		});
		// 주소 입력 후 작동
		$("select[name='mem_email2']").blur(function() {
			var select = $("select[name='mem_email2'] option").index($("select[name='mem_email2'] option:selected"))
			if(select == 0){
				$("input[name='mem_email2']").focus();
				$("#em_alert").html("메일 선택").css("color","red");
				$("#join").attr("type","button").css("background","#ececec").css("color","dimgray");
			}else{
				$("#em_alert").html("");
				$("#join").attr("type","submit").css("background","orange").css("color","white");
			}
		});
		
		$.join_check = function() { // 하나라도 입력값이 없어진다면 작동
			var phone1IDX = document.getElementById("mem_phone1").selectedIndex; // 선택된 옵션 값
			var email2IDX = document.getElementById("mem_email2").selectedIndex;
			var phone1 = document.getElementById("mem_phone1").options; // 옵션 리스트
			var email2 = document.getElementById("mem_email2").options;
			var phone_idx_num = phone1[phone1IDX].index;
			var email_idx_num = email2[email2IDX].index;
			if($("input[name='mem_id']").val().length > 0 && $("input[name='mem_pw']").val().length > 0 && 
					$("input[id='check_pw']").val().length > 0 && $("input[name='mem_name']").val().length > 0 &&
					phone_idx_num != 0 && $("input[name='mem_phone2']").val().length > 0 &&
					$("input[name='mem_phone3']").val().length > 0 && $("input[name='mem_addr']").val().length > 0 &&
					$("input[name='mem_email1']").val().length > 0 && email_idx_num != 0){
				
				$("#join").attr("type","submit").css("background","orange").css("color","white");
			}else{
				$("#join").attr("type","button").css("background","#ececec").css("color","dimgray");
			}
		};
		
		$("input[name='mem_id']").blur(function() { $.join_check() });
		$("input[name='mem_pw']").blur(function() { $.join_check() });
		$("input[id='check_pw']").blur(function() { $.join_check() });
		$("input[name='mem_name']").blur(function() { $.join_check() });
		$("input[name='mem_phone1']").blur(function() { $.join_check() });
		$("input[name='mem_phone2']").blur(function() { $.join_check() });
		$("input[name='mem_phone3']").blur(function() { $.join_check() });
		$("input[name='mem_addr']").blur(function() { $.join_check() });
		$("input[name='mem_email1']").blur(function() { $.join_check() });
		$("input[name='mem_email2']").blur(function() { $.join_check() });
		
	});
</script>
</head>
<body>
	<header>
		<div class="flex">
			<a href="../member/member_login.jsp">로그인 </a>|
			<a href="../member/member_join.jsp"> 회원가입 </a>|
			<a href="https://www.instagram.com/hansot_official/">
				<img src="../img/insta.png" width=14px height=14px style="max-width: 100%; height: auto;">
			</a>
			<a href="https://www.facebook.com/hansotOfficial/?ref=ts&fref=ts">
				<img src="../img/face.png" width=18px height=18px style="max-width: 100%; height: auto;">
			</a>
		</div>
		<div class="main_top_list">
			<div class="logo">
				<a href="../main/main.jsp"><img src="../img/DS2.png"></a>
			</div>
			<div class="top_list">
				<ul>
					<li class="mtl"><a href="../brand/brand.jsp">BRAND</a></li>
					<li class="mtl"><a href="menuList.do">MENU</a></li>
					<li class="mtl"><a href="loca_list.do?pg=1">STORE</a></li>
					<li class="mtl"><a href="event_list.do?pg=1">EVENT</a></li>
					<li class="mtl"><a href="FAQList.do?pg=1">QnA</a></li>
				</ul>
			</div>
		</div>
	</header>
	<div class="content">
		<div class="container">	
			<div class="subject" align="center">
				<span class="title">회원가입</span>
			</div>
   		</div>
		<form action="member_join.do" method="post" id="frm">
			<table>
				<tr>
					<td width="120"><span>아이디</span></td>
					<td>
						<input type="text" class="input" name="mem_id" id="mem_id" placeholder="&nbsp아이디를 입력하세요." readonly>
					</td>
				</tr>
				<tr>
					<td width="120"><span>비밀번호</span></td>
					<td><input type="password" class="input" name="mem_pw" placeholder="&nbsp비밀번호를 입력하세요." readonly></td>
				</tr>
				<tr>
					<td width="120"><span>비밀번호확인</span></td>
					<td>
						<input type="password" class="input" id="check_pw" placeholder="&nbsp비밀번호를 재입력해주세요." readonly>
						<span id="pw_alert"></span>
					</td>
				</tr>
				<tr>
					<td width="120"><span>이름</span></td>
					<td>
						<input type="text" class="input" name="mem_name" placeholder="&nbsp이름을 입력하세요." readonly>
						<span id="nm_alert"></span>
					</td>
				</tr>
				<tr>
					<td width="120"><span>전화번호</span></td>
					<td>
						<select class="tel" class="input" name="mem_phone1" id="mem_phone1" disabled="disabled" style="text-align:center;">
							<option>--- 선택 ---</option>
							<option>010</option>
							<option>011</option>
							<option>017</option>
							<option>019</option>
						</select> -
						<input type="text" class="tel" class="input" name="mem_phone2" readonly> -
						<input type="text" class="tel" class="input" name="mem_phone3" readonly>
						<span id="ph_alert"></span>
					</td>
				</tr>
				<tr>
					<td width="120"><span>주소</span></td>
					<td>
						<input type="text" class="input" name="mem_addr" placeholder="&nbsp주소를 입력하세요." readonly>
						<span id="addr_alert"></span>
					</td>
				</tr>
				<tr>
					<td width="120"><span>이메일</span></td>
					<td>
						<input type="text" class="email" class="input" name="mem_email1" readonly> @
						<select class="email" class="input" name="mem_email2" id="mem_email2" disabled="disabled" style="text-align:center;">
							<option>----- 선택 -----</option>
							<option>naver.com</option>
							<option>daum.net</option>
							<option>yahoo.com</option>
							<option>gmail.com</option>
						</select>
						<span id="em_alert"></span>
					</td>
				</tr>
            	<tr>
              		<td colspan="2">
                  		<input type="button" id="join" value="회원가입">
               		</td>
            	</tr>
			</table>
		</form>
		<div class="join_table_img">
			<img src="../img/join_table_img.png">
		</div>
	</div>
	<footer>
		<div>
			<div id="footer_head">
				<p>인재채용 | 협력업체등록 | 공지사항 | 고객 센터 | 개인정보처리방침 | 이용약관</p>
				<br><br>
				<hr style="border: 1px solid dimgray;">
			</div>
			<div id="footer_foot">
				<p>대표이사 홍길동 | 사업자등록번호 123-12-12345 | 서울 서초구 서초대로 77길 55,에이프로 스퀘어 3층(서초동) | T.02-1234-1234 | F.02-9876-9876</p>
				<p>E.doosot@naver.com | 두솥 도시락 고객센터 02-2345-2345 | 전국창업설명회 02-3456-3456 | 단체주문 4567-4567</p>
				<br>
				<p>COPYRIGHT (주)두솥.ALL RIGHT RESEVED</p>
			</div>
		</div>
	</footer>
</body>
</html>