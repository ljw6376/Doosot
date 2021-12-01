<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 문의내역</title>
<link rel="stylesheet" type="text/css"
	href="../css/member_qnaList_css.css?v=3">
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
				<span class="title">문의내역</span>
			</div>
		</div>
		<table id="list_head">
			<tr>
				<th width="150" height="60">문의번호</th>
				<th width="350">문의제목</th>
				<th width="150">문의날짜</th>
				<th width="150">답변상태</th>
			</tr>
		</table>
		<fieldset>
			<form>
				<table>
					<c:forEach var="dto" items="${list }">
						<tr>
							<td width="150" height="60">${dto.qna_seq }</td>
							<td width="350">${dto.qna_subject }</td>
							<td width="150">${dto.qna_date }</td>
							<td width="150">
								<c:if test="${dto.qna_reId != null }">
									<input type="button" value="답변 등록 완료"
										onclick="location.href='member_qnaView.do?pg=${pg }&qna_seq=${dto.qna_seq}'">
								</c:if>
								<c:if test="${dto.qna_reId == null }">
									<span id="wait">답변 대기 중</span>
								</c:if>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${total_page==0 }">
						<tr>
							<td rowspan="4"  height="60">
								<p>문의한 내역이 없습니다.</p>
							</td>
						</tr>
					</c:if>
				</table>
			</form>
		</fieldset>
		<div style="text-align: center;" id="paging">
			<!-- 페이징 -->
			<c:if test="${start_page > 3 }">
				<a href="member_qnaList.do?pg=${1 }"><< </a>
			</c:if>
			<c:if test="${start_page > 3 }">
				<a href="member_qnaList.do?pg=${start_page-1 }"> < </a>
			</c:if>

			<c:forEach var="i" begin="${start_page }" end="${end_page }" step="1">
				<c:if test="${pg==i }">
					<a href="member_qnaList.do?pg=${i }" id="now_page">${i } </a>
				</c:if>
				<c:if test="${pg!=i }">
					<a href="member_qnaList.do?pg=${i }">${i } </a>
				</c:if>
			</c:forEach>

			<c:if test="${end_page < total_page }">
				<a href="member_qnaList.do?pg=${end_page+1 }"> > </a>
			</c:if>
			<c:if test="${end_page < total_page }">
				<a href="member_qnaList.do?pg=${total_page }"> >></a>
			</c:if>
		</div>
	</div>
	<footer>
		<div id="footer_head">
			<p>인재채용 | 협력업체등록 | 공지사항 | 고객 센터 | 개인정보처리방침 | 이용약관</p>
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