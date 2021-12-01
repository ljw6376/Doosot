<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 이벤트</title>
<link rel="stylesheet" type="text/css" href="../css/main_page.css?new">
<link rel="stylesheet" type="text/css" href="../css/event.css?v=4">

<script type="text/javascript" src="../script/locaScript.js?v=1"></script>
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

</script>

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
			<span class="title">이벤트 목록</span>
		</div>
		<br><br>
		<p></p>
		<p></p>
		<br>
		<div class="content">
			<table class="event_list">
				<tr>
				<c:forEach var="eventDto" items="${list}">
					<td class="list_content">
						<a href="event_view.do?eve_num=${eventDto.eve_num}&pg=${pg}">
							<figure class="eve_wrap">
								<span>
									<img alt="../event_img/${eventDto.eve_img}" src="../event_img/${eventDto.eve_img}" width="310" height="250">
								</span>
								<figcaption>
									<h3><span>${eventDto.eve_name}</span></h3>
									<p class="date">${eventDto.eve_start} ~ ${eventDto.eve_end}&nbsp;&nbsp;
									<c:if test="${eventDto.eve_end < today}"><span class="event_end">종료</span></c:if>
									<c:if test="${eventDto.eve_end > today}"><span class="event_ing">진행중</span></c:if>		
									</p>			
								</figcaption>
							</figure>
						</a>
					</td>					
				</c:forEach>
				</tr>
		<!-- 페이징 -->
		<tr>
			<td colspan="3" align="center">
			<c:if test="${startPage > 3}">
					<a class="paging" href="event_list.do?pg=${startPage-1}">◀</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${pg==i}">
						<a class="currentPaging" href="event_list.do?pg=${i}">●</a>
					</c:if>
					<c:if test="${pg!=i}">
						<a class="paging" href="event_list.do?pg=${i}">○</a>
					</c:if>
			</c:forEach>
							
			<c:if test="${endPage < totalP}">
					<a href="event_list.do?pg=${endPage+1}" class="paging">▶</a>
			</c:if>				
			</td>
		</tr>
				
			<tbody >
				<tr id="eventList_extra"></tr>
			</tbody>	
			</table>
			<br><br>
			<c:if test="${admin_num == '1' }">
				<div class="btn">
					<input type="button" value="이벤트 등록" class="write_btn" onclick="location.href='../event/event_writeForm.jsp'">
				</div>
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