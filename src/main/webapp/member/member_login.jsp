<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 로그인</title>
<link rel="stylesheet" type="text/css" href="../css/member_login_css.css?v=1">
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function find_idpw() {
		var popup_width = 600;
		var popup_height = 560;
		var screen_x = (window.screen.width / 2) - (popup_width / 2);
		var screen_y= (window.screen.height / 2) - (popup_height / 2);
		var url = "../member/member_findIdPw.jsp";
		window.open(url,"", "width="+popup_width+",height="+popup_height+
						",left="+screen_x+",top="+screen_y);
	}
	$.login = function() {
		if($("#id").val().length > 0 && $("#pw").val().length > 0){
			$("#login_btn").attr("type","submit");
			$("#login_btn").css("background","orange").css("color","white");
		}else{
			$("#login_btn").attr("type","button");
			$("#login_btn").css("background","#ececec").css("color","dimgray");
		}
	};
	$(function() {
		$("#id").blur(function() { $.login() });
		$("#pw").blur(function() { $.login() });
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
		<div class="login_wrap">	
			<span class="title">로그인</span>
			<form action="member_login.do" method="post" id="frm">
				<table>
					<tr>
						<td>
							<input type="text" id="id" class="input" name="login_id" placeholder="아이디">
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" id="pw" class="input" name="login_pw" placeholder="비밀번호">
							<a href='javascript:void(0);' onclick="find_idpw()">아이디/비밀번호찾기</a>
						</td>
					</tr>
				</table>
				<input type="button" value="로그인" id="login_btn">
			</form>
		</div>
		
		<div class="join_wrap">
			<span><img src="../img/join_img.png"></span>
			<div id="join_sent">
				<h3>아직 두솥 회원이 아니신가요?</h3><br>
				<p>회원이 되시면 한솥 도시락의 다양한 정보와</p>
				<p> 이벤트를 만나보실 수 있습니다.</p>
				<br>
				<a href="member_join.jsp"><img src="../img/join_button.png" alt="회원가입"></a>
			</div>
		</div>
	</div>
	<footer>
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
	</footer>
</body>
</html>