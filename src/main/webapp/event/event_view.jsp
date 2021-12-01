<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 이벤트 상세보기</title>
<link rel="stylesheet" type="text/css" href="../css/main_page.css?new">
<link rel="stylesheet" type="text/css" href="../css/event.css?v=2">

</head>
<body>
	<!-- 고정 -->
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

	<div class="container">
		<div class="subject" align="center">
			<span class="title">이벤트 상세보기</span>
		</div>
		<br>
		<br>
		<div class="content">
			<table class="event_detail_table">
				<tr>
					<td width="300" height="100" class="view_title"><h2>${dto.eve_name}</h2></td>
					<td rowspan="2" width="700"><img alt="이미지"
						src="../event_img/${dto.eve_img}" width="650" height="600">
					</td>
				</tr>
				<tr>
					<td class="view_date">${dto.eve_start}~ ${dto.eve_end}</td>
				</tr>
			</table>
			
			<div>
				<input type="button" value="목록보기" class="list_btn"
					onclick="location.href='event_list.do?pg=${pg}'">
				<c:if test="${admin_num == '1' }">
					<input type="button" value="글 수정" class="corr_btn"
						onclick="location.href='eventCorrForm.do?pg=${pg}&eve_num=${dto.eve_num}'">
					<input type="button" value="글 삭제" class="del_btn"
						onclick="location.href='eventDelete.do?pg=${pg}&eve_num=${dto.eve_num}'">
				</c:if>
			</div>
		</div>
	</div>

	<footer>
		<div id="footer_head">
			<p>인재채용 | 협력업체등록 | 공지사항 | 고객 센터 | 개인정보처리방침 | 이용약관</p>
			<br>
			<br>
			<hr style="border: 1px solid dimgray;">
		</div>
		<div id="footer_foot">
			<p>대표이사 홍길동 | 사업자등록번호 123-12-12345 | 서울 서초구 서초대로 77길 55,에이프로 스퀘어
				3층(서초동) | T.02-1234-1234 | F.02-9876-9876</p>
			<p>E.doosot@naver.com | 두솥 도시락 고객센터 02-2345-2345 | 전국창업설명회
				02-3456-3456 | 단체주문 4567-4567</p>
			<br>
			<p>COPYRIGHT (주)두솥.ALL RIGHT RESEVED</p>
		</div>
	</footer>
</body>
</html>