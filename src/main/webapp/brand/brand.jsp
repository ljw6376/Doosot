<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥</title>
<link rel="stylesheet" type="text/css" href="../css/main_page.css">
<link rel="stylesheet" type="text/css" href="../css/brand.css?v=4">
</head>
<body>
	<header>
		<div class="flex">
			<c:if test="${empty login_id }">
				<a href="../member/member_login.jsp">로그인 </a>|
				<a href="../member/member_join.jsp"> 회원가입 </a>|
			</c:if>
			<c:if test="${not empty login_id }">
				<a href="member_logout.do">로그아웃 </a>|
				<c:if test="${admin_num == null }">
					<a href="cartList.do">장바구니 </a>|
					<a href="../member/member_mypage.jsp">예치금 : ${mem_deposit }원 </a>|
					<a href="../member/member_mypage.jsp"> 마이페이지 </a>|
					<!-- <a href="menu_order_page.do"> 주문하기 </a>| -->
				</c:if>
				<c:if test="${admin_num == '1' }">
					<a href="member_manage.do"> 가입자관리 </a>|
				</c:if>
			</c:if>
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
		<div class="main_photo"></div>
	</header>
	<div id="content">
		<div id="content_1">
			<div id="con_1">
	            <h3>브랜드 철학</h3>
	            <span id="con_span_1">든든한 솥밥을 위해<br>지키고, 키워가는 것들</span>
	            <span id="con_span_2">두솥은 ‘따끈한 도시락으로 지역사회에 공헌한다’ 라는 기업이념 아래, 고객이익을 
	            최우선으로 하며 엄선된 좋은 식재료만 사용하는 대한민국 외식종합기업 시장을 
	            리드하는 글로벌 종합외식기업입니다.</span>
            </div>
		</div>
		<div id="content_2">
			<div id="con_2">
				<div id="con_2_text">
					<h1>따뜻한 솥밥</h1>
					<div>
						<p>
							<span>그 옛날, 마을잔치가 열리면 우리의 어머니들은 
							모두 솥을 걸었습니다.</span>
							<span>그 솥밥을 나눠 먹으며, 우리는 친구가 되었고, 
							추억을 나눠 가졌지요.</span>
							<span>따끈한 한 끼를 중심으로 친구가 되고, 
							연인이 되고, 가족의 마음에</span>
							<span>온기가 넘치는 한 솥.</span>
							<span>저희는 그 따끈한 한 끼의 힘을 믿습니다.</span>
						</p>
						<p>
							<span>언제나 가격 이상의 가치를 누리실 수 있도록 
							접객 서비스와 청결까지</span>
							<span>늘 고민하며 갓 지은 솥밥과 같은 한 끼를 
							대접하겠습니다.</span>
						</p>
					</div>
				</div>
				<div id="con_2_img">
					<img alt="그림" src="../brand_img/brand_img_01.jpg">
				</div>
			</div>
		</div>
		<div id="content_3">
			<div id="con_3">
				<img alt="그림" src="../brand_img/brand_img_02.jpg">
				<div id="con_3_text">
					<h1>정직한 솥밥</h1>
					<div>
						<p>
							<span>두솥은 손해를 감수하고서라도 
							원칙과 신념을 지킵니다. 언제나</span>
							<span>고객에게 드릴 수 있는 가치를 
							최우선으로 삼기에 고객이 믿고</span>
							<span>사랑하는 기업으로 성장할 수 있었지요.</span>
							<span>그것이 두솥 도시락의 가격이 늘 착한 이유입니다.</span>
						</p>
						<p>
							<span>또한 건전하고 투명한 기업 운영을 
							통해 가맹점주에게 변함없이 사랑</span>
							<span>받는 기업이기도 합니다. 고객에게, 
							가맹점주에게 무한한 신뢰와</span>
							<span>지속적인 사랑을 받는 것이 
							따뜻한 대한민국을 만들고,</span>
							<span>인류사회발전에 조금이라도 기여하는 
							일이라고 믿기 때문입니다.</span>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div id="content_4">
			<div id="con_4">
				<div id="con_4_text">
					<h1>건강한 솥밥</h1>
					<div>
						<p>
							<span>두솥은 식재료 앞에서는 한없이 까탈스럽습니다.</span>
							<span>신선하지 않아도, 합리적인 가격이 
							아니어도 한솥이 될 수 없습니다.</span>
							<span>건강하지 않으면 결코 두솥이 될 수 없습니다.</span>
						</p>
						<p>
							<span>외식기업은 그 어떤 기업보다도 
							더 고객님을 소중하게 생각해야 한다는</span>
							<span>것이 두솥의 신념입니다.</span>
							<span>두솥의 도시락이 건강해야, 
							고객 또한 건강해질 수 있다는 믿음,</span>
							<span>그것이 한결 같은 두솥의 초심입니다.</span>
						</p>
					</div>
				</div>
				<div id="con_4_img">
					<img alt="그림" src="../brand_img/brand_img_03.jpg">
				</div>
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