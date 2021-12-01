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
<script type="text/javascript">
	function checkName() {
		var sId = loca_frm.loca_name.value;
		
		if(sId == "") {
			alert("매장 이름을 입력하세요.");
		} else {
			window.open("../loca/checkName.do?loca_name=" + sId, "", "width=450 height=160 left=500 top=200")
		}
	}
	
	function checkWrite() {
		if(!loca_frm.loca_name.value) {
			alert("매장 이름을 입력하세요");
			loca_frm.loca_name.focus();
		} else if(!loca_frm.loca_addr.value) {
			alert("매장 주소를 입력하세요");
			loca_frm.loca_addr.focus();
		} else if(!loca_frm.loca_phone.value) {
			alert("매장 전화번호를 입력하세요");
			loca_frm.loca_phone.focus();
		} else if(!loca_frm.loca_img.value) {
			alert("매장 지도이미지를 입력하세요");
			loca_frm.loca_img.focus();
		}else {
			loca_frm.submit();
		}
	}
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
				<a href="member_manage.do"> 가입자관리 </a>|
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

	<div class="container">
		<div class="subject" align="center">
			<span class="title">점포 등록</span>
		</div>
		<br><br>
		<div class="content">
	      <form action="locaWrite.do" id="frm" name="loca_frm" method="post" enctype="multipart/form-data">
	         <table class="loca_wirte_form">
	            <tr>
	               <td width="120"><span>매장 이름</span></td>
	               <td><input type="text" name="loca_name" class="input_write">
	               		<input type="button" value="이름 중복확인" name="loca_name_check" class="input_check" onclick="checkName()">
	               </td>
	            </tr>
	            <tr>
	               <td><span>매장 주소</span></td>
	               <td><input type="text" name="loca_addr" class="input"></td>
	            </tr>
	            <tr>
	               <td><span>전화번호</span></td>
	               <td><input type="text" name="loca_phone" class="input"></td>
	            </tr>
	            <tr>
	               <td><span>이미지</span></td>
	               <td><input type="file" class="input" name="loca_img" id="file"></td>
	            </tr>
	            <tr>
	               <td colspan="2">
	                  <input type="button" value="매장 등록" class="btn" onclick="checkWrite()">
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