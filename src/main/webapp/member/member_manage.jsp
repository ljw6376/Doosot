<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 가입자관리</title>
<link rel="stylesheet" type="text/css" href="../css/member_manage_css.css">
</head>
<body>
	<header>
		<div class="flex">
			<a href="member_logout.do">로그아웃 </a> |
			<a href="member_manage.do"> 가입자관리 </a>|
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
				<span class="title">가입자관리</span>
			</div>
   		</div>
   		<table id="list_head">
			<tr>
				<th width="150" height="60">회원아이디</th>
				<th width="100">회원이름</th>
				<th width="200">전화번호</th>
				<th width="200">주소</th>
				<th width="200">이메일</th>
			</tr>
		</table>
   		<fieldset>
			<form>
				<table>
					<c:forEach var="memberdto" items="${list }">
						<tr>
							<td width="150" height="60">${memberdto.mem_id }</td>
							<td width="100">${memberdto.mem_name }</td>
							<td width="200">${memberdto.mem_phone1 }-${memberdto.mem_phone2 }-${memberdto.mem_phone3 }</td>
							<td width="200">${memberdto.mem_addr }</td>
							<td width="200">${memberdto.mem_email1 }@${memberdto.mem_email2 }</td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</fieldset>
		<br>
		<div style="text-align:center;"><!-- 페이징 -->
			<c:if test="${start_page > 3 }">
				<a href="member_manage.do?pg=${1 }"><< </a>
			</c:if>
			<c:if test="${start_page > 3 }">
				<a href="member_manage.do?pg=${start_page-1 }"> < </a>
			</c:if>
			
			<c:forEach var="i" begin="${start_page }" end="${end_page }" step="1">
				<c:if test="${pg==i }">
					<a href="member_manage.do?pg=${i }" id="now_page">${i } </a>
				</c:if>
				<c:if test="${pg!=i }">
					<a href="member_manage.do?pg=${i }">${i } </a>
				</c:if>
			</c:forEach>
			
			<c:if test="${end_page < total_page }">
				<a href="member_manage.do?pg=${end_page+1 }"> > </a>
			</c:if>
			<c:if test="${end_page < total_page }">
				<a href="member_manage.do?pg=${total_page }"> >></a>
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