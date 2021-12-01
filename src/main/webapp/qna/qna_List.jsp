<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 목록</title>
<link rel="stylesheet" type="text/css" href="../css/list.css?v=4">
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
				<span class="title">고객의소리</span>
			</div>
		</div>
		<table id="QnA_list" class="list">
			<caption>문의 내역</caption>
			<tr bgcolor="lightgray" id="list_title">	
				<th width="70">글번호</th>
				<th>제목</th>
				<th width="100">작성자</th>
				<th width="100">작성일</th>
			</tr>
		<c:forEach var="qnadto" items="${list}">
		<tr align="center">
			<td>${qnadto.qna_seq}</td>
			<td>
				<a id="subjectA" href="QnAView.do?pg=${pg}&qna_seq=${qnadto.qna_seq}">${qnadto.qna_subject}</a>
			</td>
			<td>${qnadto.qna_id}</td>
			<td>${qnadto.qna_date}</td>
		</tr>
		</c:forEach>
			<!-- 페이징 -->
			<tr>
				<th colspan="5" align="center">
				<c:if test="${startPage > 3 }">
					[<a class="paging" href="QnAList.do?pg=${startPage-1}">이전</a>]
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${pg==i}">
						[<a class="currentPaging" href="QnAList.do?pg=${i}">${i}</a>]
					</c:if>
					<c:if test="${pg!=i}">
						[<a class="Paging" href="QnAList.do?pg=${i}">${i}</a>]
					</c:if>
				</c:forEach>
				<c:if test="${endPage < totalP}">
					[<a href="QnAList.do?pg=${endPage+1}">다음</a>]
				</c:if>
				</th>
			</tr>
		</table>
		<div id="bt_box">
			<c:if test="${admin_num == null }">
				<input type="button" value="문의하기" id="button"
					onclick="location.href='../qna/qna_WriteForm.jsp'">
			</c:if>
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