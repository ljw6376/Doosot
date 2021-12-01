<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 마이페이지</title>
<link rel="stylesheet" type="text/css" href="../css/member_mypage_css.css?v=4">
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 주문내역 부분
		$("#order_hist").hover(function() {
			$("#order_hist").css("background","orange");
		}, function() {
			$("#order_hist").css("background","#ececec");
		});
		// 문의내역 부분
		$("#qna_hist").hover(function() {
			$("#qna_hist").css("background","orange");
		}, function() {
			$("#qna_hist").css("background","#ececec");
		});
		
		// 비밀번호 변경 관련 부분
		$.change_pw = function() {
			var button = $("input[value='변경하기']");
			if($("input[name='old_pw']").val().length > 0 && $("input[name='new_pw']").val().length > 0 ){
				button.removeAttr("type","button").attr("type","submit");
				button.css("background","orange").css("color","white");
			}else {
				button.removeAttr("type","submit").attr("type","button");
				button.css("background","#ececec").css("color","dimgray");
			}
		};
		$("input[name='old_pw']").blur(function() { $.change_pw()});
		$("input[name='new_pw']").blur(function() { $.change_pw()});
		
		// 예치금 관련 부분
		$("input[name='reload_deposit']").blur(function() { // 예치금 입력란에서 포커스아웃 될때
			var button = $("input[value='충전하기']");
	    	if($("input[name='reload_deposit']").val().length > 0 
	    			&& !isNaN($("input[name='reload_deposit']").val())){ // 입력값이 있고 숫자일때
	    		
	    		reload = $("input[name='reload_deposit']").val();
	    		var reload_deposit = parseInt(reload) + parseInt(${mem_deposit}); // 입력값 + 기존 예치금
		        
	    		$("#after_money").empty(); // 글만 제거
	    		$("#after_money").html("충전 후 금액 : " + reload_deposit + "원"); // 새 글 추가
	
				button.removeAttr("type").attr("type","submit");
				button.attr("onclick","check_money(); return false;");
				button.css("background","orange").css("color","white");
				
			}else{ // 입력값이 없거나 숫자가 아니면
				$("#after_money").empty(); // 글만 제거
				$("#after_money").html("충전 후 금액 : 금액을 입력해주세요."); // 새 글 추가
				
				button.removeAttr("type").attr("type","button");
				button.removeAttr("onclick");
				button.css("background","#ececec").css("color","dimgray");
			}
		});
		// 회원탈퇴 부분
		$("#member_out").hover(function() {
			$("#member_out").css("background","orange");
		}, function() {
			$("#member_out").css("background","#ececec");
		});
	});
	if(${login_id} == null){
		alert("해당 페이지의 세션이 만료되었습니다.");
		window.location.href="../main/main.jsp";
	};
	var reload = 0; // 입력된 예치금
	function check_money() {
		if(confirm(String(reload) + "원을 충전 하시겠습니까?")){
			mn_frm.submit();
		}
	};
	function member_out() { // 회원탈퇴 누르면 나올 팝업창
		var popup_width = 410;
		var popup_height = 379;
		var screen_x = (window.screen.width/2) - (popup_width/2);
		var screen_y = (window.screen.height/2) - (popup_height/2);
		
		var url = "member_out.jsp?out_check=1";
		var status = "width="+popup_width + ",height="+popup_height + ",left="+screen_x + ",top="+screen_y + ",resizable=no";
		window.open(url,"",status);
	};
</script>
</head>
<body>
	<header>
		<div class="flex">
			<a href="member_logout.do">로그아웃 </a>|
			<a href="cartList.do">장바구니</a> |
			<a href="../member/member_mypage.jsp">예치금 : ${mem_deposit }원 </a>|
			<a href="../member/member_mypage.jsp"> 마이페이지 </a>|

			<a href="https://www.instagram.com/hansot_official/"> <img
				src="../img/insta.png" width=14px height=14px
				style="max-width: 100%; height: auto;">
			</a> <a href="https://www.facebook.com/hansotOfficial/?ref=ts&fref=ts">
				<img src="../img/face.png" width=18px height=18px
				style="max-width: 100%; height: auto;">
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
				<span class="title">마이페이지</span>
				<div id="hist_buttons">
					<div class="buttons" id="order_hist">
						<a href="member_orderList.do">주문내역</a>
					</div>
					<div class="buttons" id="qna_hist">
						<a href="member_qnaList.do">문의내역</a>
					</div>
				</div>
			</div>
   		</div>
   		<div id="hello_id">
   			<p>안녕하세요. <span>${login_name }</span>님!</p>
   			<p>${login_name }님의 아이디는</p>
   			<p><span>${login_id }</span>입니다.</p>
   		</div>
   		<div id="fieldsets">
	   		<fieldset>
	   			<span class="fieldset_title">비밀번호 변경하기</span>
	   			<form action="modify_pw.do" id="pw_frm" method="post">
	   				<input type="hidden" value="${login_id }" name="login_id">
	   				<input type="password" class="input" name="old_pw" placeholder="&nbsp현재 비밀번호를 입력해주세요.">
	   				<input type="password" class="input" name="new_pw" placeholder="&nbsp새 비밀번호를 입력해주세요.">
	   				<br>
	   				<!-- <input type="submit" value="변경하기"> -->
	   				<input type="button" value="변경하기">
	   			</form>
	   		</fieldset>
	   		<fieldset>
	   			<span class="fieldset_title">예치금 충전하기</span>
	   			<span id="before_money">현재금액 : ${mem_deposit }원</span>
	   			<form action="reload_deposit.do" id="mn_frm" name="mn_frm" method="post">
	   				<input type="hidden" name="login_id" value="${login_id }"/>
	   				<input type="text" class="input" name="reload_deposit" placeholder="&nbsp충전하실 금액을 입력해주세요.">
	   				<span style="font-size:20px;">&nbsp원</span>
	   				<br>
	   				<p id="sum"><span id="after_money">충전 후 금액 : 금액을 입력해주세요.</span></p><!-- 입력하면 자동으로 더해지는거 만들어야함 -->
	   				<br>
	   				<!-- <input type="submit" value="충전하기" onclick="check_money(); return false;"> -->
	   				<input type="button" value="충전하기">
	   			</form>
	   		</fieldset>
	   		<div class="buttons" id="member_out">
				<a href="javascript:void(0);" onclick="member_out()">회원탈퇴</a>
			</div>
   		</div>
	</div>
	<footer>
		<div id="footer_content">
			<div id="footer_head">
				<p>인재채용 | 협력업체등록 | 공지사항 | 고객 센터 | 개인정보처리방침 | 이용약관</p>
			</div>
			<br><br>
			<hr style="border: 1px solid dimgray;">
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