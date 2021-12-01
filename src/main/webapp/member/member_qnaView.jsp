<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역 상세보기</title>
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#button").hover(function() {
			$("#button").css("background","orange");
			$("#button a").css("color","white");
		}, function() {
			$("#button").css("background","#ececec").css("color","dimgray");
			$("#button a").css("color","dimgray");
		});
	});
</script>
<link rel="stylesheet" type="text/css" href="../css/member_qnaView_css.css?v=4">
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
				<span class="title">문의내역 상세보기</span>
			</div>
   		</div>
   		<fieldset>
			<form>
				<table>
					<tr class="line">
						<td width="560" class="head">문의제목 | ${view.qna_subject}</td>
						<td class="head">문의날짜 | ${view.qna_date }</td>
					</tr>
					<tr class="line">
						<td colspan="2">
							<div class="body">
								<p>${view.qna_content}</p>
							</div>
						</td>
					</tr>
					<tr class="line">
						<td class="head">답변내용</td>
						<td class="head">답변날짜 | ${view.qna_reDate }</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="body">
								<p>${view.qna_reCont }</p>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</fieldset>
		<div id="button">
			<a href="member_qnaList.do?pg=${pg }">목록보기</a>
		</div>
	</div>
	<footer>
		<div id="footer_head">
			<p>인재채용 | 협력업체등록 | 공지사항 | 고객 센터 | 개인정보처리방침 | 이용약관</p>
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