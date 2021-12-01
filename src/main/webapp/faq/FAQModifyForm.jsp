<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정</title>
<link rel="stylesheet" type="text/css" href="../css/form.css?v=6">
<script type="text/javascript">
	function FAQModify() {
		if(!FAQ_frm.faq_subject.value) {
			alert("제목을 입력하세요");
			FAQ_frm.faq_subject.focus();
		} else if(!FAQ_frm.faq_content.value) {
			alert("내용을 입력하세요");
			FAQ_frm.faq_content.focus();
		} else if(!FAQ_frm.faq_img.value) {
			alert("파일을 선택하세요");
			FAQ_frm.faq_img.focus();
		} else {
			FAQ_frm.submit();
		}
	}
</script>
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
	</header>
	<div class="content">
		<div class="container">
			<div class="subject" align="center">
				<span class="title">FAQ 수정</span>
			</div>
		</div>
		<form action="FAQModify.do?pg=${pg}" id="frm"
			name="FAQ_frm" method="post" enctype="multipart/form-data">
			<table id="modifywriteform">
				<tr align="center">
					<th>글번호</th>
					<td><input type="text" name="faq_seq" size="88" class="input"
						value="${dto.faq_seq}" readonly></td>
				</tr>
				
				<tr align="center">
					<th>제목</th>
					<td><input type="text" name="faq_subject" size="88" class="input"
						value="${dto.faq_subject}" placeholder="제목을 입력해주세요"></td>
				</tr>
				<tr align="center">
					<th>내용</th>
					<td>
						<textarea rows="20" cols="76" name="faq_content"
							class="input" placeholder="내용을 입력해주세요"></textarea>
					</td>					
				</tr>
				<tr align="center">
					<th>이미지</th>
					<td><input type="file" class="input" name="faq_img" id="file" size="40"
						value="${dto.faq_img}"></td>
				</tr>
				<tr align="center">
					<td><input type="hidden" name="faq_id" size="80" class="input"
						value="${dto.faq_id}" placeholder="아이디를 입력해주세요" readonly></td>
				</tr>
				<tr align="center">
					<td colspan="2">
					<input type="button" value="수정 하기" onclick="FAQModify()">
					<input type="reset" value="다시 작성" class="faq">
					</td>
				</tr>
			</table>
		</form>
		<div id="bt_box">
			<input type="button" value="글로 돌아가기" id="button"
				onclick="location.href='FAQView.do?pg=1&faq_seq=${dto.faq_seq}'">
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