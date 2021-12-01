<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥</title>
<link rel="stylesheet" type="text/css" href="../css/main.css?v=1">
<link rel="stylesheet" type="text/css" href="../css/menuWriteForm.css">
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#frm").submit(function(){
		if(!$("input[name='menu_num']").val()){
			alert("상품 번호를 입력해 주세요.")
			return false
		}
		if($("select[name='menu_category'] option:selected").index() == 0){
			alert("상품 카테고리를 선택해 주세요.")
			return false
		}
		if(!$("input[name='menu_name']").val()){
			alert("상품 이름을 입력해 주세요.")
			return false
		}
		if(!$("input[name='menu_price']").val()){
			alert("상품 가격을 입력해 주세요.")
			return false
		}
		if(!$("input[name='menu_kcal']").val()){
			alert("상품 열량을 입력해 주세요.")
			return false
		}
		if(!$("input[name='menu_kcal']").val()){
			alert("상품 열량을 입력해 주세요.")
			return false
		}
		if(!$("input[name='menu_ingre']:checked").val()){
			alert("알레르기 반응을 선택해 주세요.")
			return false
		}
		if(!$("input[name='menu_img']").val()){
			alert("상품 이미지를 삽입 해주세요.")
			return false
		}
	})
})

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
			<span class="title">메뉴 등록</span>
		</div>
	</div>
	<div class="content">
		<form action="menuWrite.do" id="frm" name="menu_frm" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td width="120"><span class="need">*</span><span>상품 번호</span></td>
					<td><input type="text" class="input" name="menu_num"></td>
				</tr>
				<tr>
					<td><span class="need">*</span><span>상품 종류</span></td>
					<td><select class="input" name="menu_category">
						<option value="">-----선택하세요-----</option>
						<option value="고기고기">고기고기</option>
						<option value="마요">마요</option>
					</select></td>
				</tr>
				<tr>
					<td><span class="need">*</span><span>상품 이름</span></td>
					<td><input type="text" class="input" name="menu_name"></td>
				</tr>
				<tr>
					<td><span class="need">*</span><span>상품 가격</span></td>
					<td><input type="number" class="input" name="menu_price"></td>
				</tr>
				<tr>
					<td><span class="need">*</span><span>상품 칼로리</span></td>
					<td><input type="number" placeholder="Kcal" class="input" name="menu_kcal"></td>
				</tr>
				<tr>
					<td><span>상품 설명</span></td>
					<td><textarea class="input" name="menu_content"></textarea></td>
				</tr>
				<tr>
					<td><span class="need">*</span><span>상품 재료</span></td>
					<td id="category">
						<label for="chk1">난류(계란)</label>
						<input type="checkbox" id="chk1" name="menu_ingre" value="난류(계란)" class="checkbox">
						
						<label for="chk2">우유</label>
						<input type="checkbox" id="chk2" name="menu_ingre" value="우유" class="checkbox">
						
						<label for="chk3">메밀</label>
						<input type="checkbox" id="chk3" name="menu_ingre" value="메밀" class="checkbox">
						
						<label for="chk4">땅콩</label>
						<input type="checkbox" id="chk4" name="menu_ingre" value="땅콩" class="checkbox">
						
						<label for="chk5">대두</label>
						<input type="checkbox" id="chk5" name="menu_ingre" value="대두" class="checkbox">
						
						<label for="chk6">밀</label>
						<input type="checkbox" id="chk6" name="menu_ingre" value="밀" class="checkbox">
						
						<label for="chk7">고등어</label>
						<input type="checkbox" id="chk7" name="menu_ingre" value="고등어" class="checkbox">
						
						<label for="chk8">게</label>
						<input type="checkbox" id="chk8" name="menu_ingre" value="게" class="checkbox">
						
						<label for="chk9">돼지고기</label>
						<input type="checkbox" id="chk9" name="menu_ingre" value="돼지고기" class="checkbox">
						
						<br>
						
						<label for="chk10">복숭아</label>
						<input type="checkbox" id="chk10" name="menu_ingre" value="복숭아" class="checkbox">
						
						<label for="chk11">토마토</label>
						<input type="checkbox" id="chk11" name="menu_ingre" value="토마토" class="checkbox">
						
						<label for="chk12">새우</label>
						<input type="checkbox" id="chk12" name="menu_ingre" value="새우" class="checkbox">
						
						<label for="chk13">아황산류</label>
						<input type="checkbox" id="chk13" name="menu_ingre" value="아황산류" class="checkbox">
						
						<label for="chk14">호두</label>
						<input type="checkbox" id="chk14" name="menu_ingre" value="호두" class="checkbox">
						
						<label for="chk15">닭고기</label>
						<input type="checkbox" id="chk15" name="menu_ingre" value="닭고기" class="checkbox">
						
						<label for="chk16">쇠고기</label>
						<input type="checkbox" id="chk16" name="menu_ingre" value="쇠고기" class="checkbox">
						
						<label for="chk17">오징어</label>
						<input type="checkbox" id="chk17" name="menu_ingre" value="오징어" class="checkbox">
						
						<label for="chk18">조개류</label>
						<input type="checkbox" id="chk18" name="menu_ingre" value="조개류" class="checkbox">
					</td>
				</tr>
				<tr>
					<td><span class="need">*</span><span>상품 이미지</span></td>
					<td><input type="file" class="input" id="file" name="menu_img"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="등록" class="btn">
						<input type="reset" value="취소" class="btn">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<footer>
		<div id="footer_content">
			<div id="footer_head">
				<p>인재채용 | 협력업체등록 | 공지사항 | 고객 센터 | 개인정보처리방침 | 이용약관</p>
			</div>
			<br><br>
			<hr style="border: 1px solid dimgray;">
			<div id="footer_foot">
				<p>대표이사 홍길동 | 사업자등록번호 123-12-12345 | 서울 서초구 서초대로 77길 55,에이프로 스퀘어 3층(서초동) | T.02-1234-1234 | F.02-9876-9876</p>
				<p>E.doosot@naver.com | 두솥 도시락 고객센터 02-2345-2345 | 전국창업설명회 02-3456-3456 | 단체주문 4567-4567</p>
				<br>
				<p>COPYRIGHT (주)두솥.ALL RIGHT RESEVED</p>
			</div>
		</div>
	</footer>
</body>
</html>