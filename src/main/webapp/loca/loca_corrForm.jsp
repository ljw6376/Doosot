<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main_page.css?new">
<link rel="stylesheet" type="text/css" href="../css/loca.css?v=5">
<script type="text/javascript" src="../script/locaScript.js?v=5"></script>


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
				<a href="member_manage.do"> 가입자관리 </a>|

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
			<span class="title">점포 수정</span>
		</div>
		<br><br>
		<div class="content">
	      <form action="locaCorr.do?pg=1" id="frm" method="post" name="loca_frm" enctype="multipart/form-data">
	         <table class="loca_wirte_form">
				<tr>
					<td>
						<input type="hidden" name="pg" value="1">
					</td>
				</tr>
	            <tr>
	               <td colspan="2">
	                  <input type="button" value="매장 선택" class="btn" onclick="locaSelect()">
	               </td>
	            </tr>
	            <tr>
	               <td width="120"><span>매장 번호</span></td>
	               <td><input type="text" name="loca_num" id="loca_num" class="input" readonly></td>
	            </tr>
	            <tr>
	               <td width="120"><span>사용여부</span></td>
	               <td>
	               		<label><input type="radio" id="valid_true" name="loca_valid" value="true" class="radio">사용</label>
	               	    <label class="right_rd"><input type="radio" id="valid_false" name="loca_valid" value="false" class="radio" class="right_rd">사용 안함</label>
	               </td>
	            </tr>	            
	            
	            <tr>
	               <td width="120"><span>매장 이름</span></td>
	               <td><input type="text" name="loca_name" id="loca_name" class="input_write">
	               		<input type="button" value="이름 중복확인" name="loca_name_check" class="input_check" onclick="checkName()">
	               </td>
	            </tr>
	            <tr>
	               <td><span>매장 주소</span></td>
	               <td><input type="text" name="loca_addr" id="loca_addr" class="input"></td>
	            </tr>
	            <tr>
	               <td><span>전화번호</span></td>
	               <td><input type="text" name="loca_phone" id="loca_phone" class="input"></td>
	            </tr>
	            <tr>
	               <td><span>지도 이미지</span></td>
	               <td><input type="file" name="loca_img"  class="input" id="file"></td>
	            </tr>
	            <tr>
	               <td colspan="2">
	                  <input type="button" value="매장 수정" class="btn" onclick="checkWrite()">
	               </td>
	            </tr>	            
	            <tr>
	               <td colspan="2">
	                  <input type="button" value="다시 작성" class="btn">
	               </td>
	            </tr>
	         </table>
	      </form>
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