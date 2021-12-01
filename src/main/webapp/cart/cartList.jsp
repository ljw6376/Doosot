<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥</title>
<link rel="stylesheet" type="text/css" href="../css/main.css?v=1">
<link rel="stylesheet" type="text/css" href="../css/cartList.css?v=2">
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".list").first().css("border-top", "none")
	$(".qty_minus").click(function(){
		var qty = parseInt($(this).parents(".list_con").find(".qty").val())
		var price = $(this).parents(".list_con").find(".menu_price").attr("data-origin")
		if(qty > 1){
			ori_price = price
			$(this).parents(".list_con").find(".qty").val(--qty)
			$(this).parents(".list_con").find(".menu_price").html(qty * price)
		}else{
			if(confirm("삭제 하시겠습니까?")){
				var menu_name = $(this).parents(".list").find(".menu_name").html()
				var mem_id = "${login_id}"
				$(this).parents(".list").remove()
				$(".list").first().css("border-top", "none")
				$.post("delete_cart.do", {
					menu_name: menu_name
				})
				return false
			}
		}
	})
	$(".qty_plus").click(function(){
		var qty = parseInt($(this).parents(".list_con").find(".qty").val())
		var price = $(this).parents(".list_con").find(".menu_price").attr("data-origin")

		$(this).parents(".list_con").find(".qty").val(++qty)
		$(this).parents(".list_con").find(".menu_price").html(qty * price)
	})
	$(".qty").change(function(){
		var qty = parseInt($(this).parents(".list_con").find(".qty").val())
		var price = $(this).parents(".list_con").find(".menu_price").attr("data-origin")
		$(this).parents(".list_con").find(".menu_price").html(qty * price)
	})
	
	$("#order_btn").click(function(){
		if($("#con").html().trim() == ""){
			alert("주문할 음식이 없습니다.")
		}else{
			if(confirm("주문 하시겠습니까?")){
				var menu_name_list = ""
				var cart_qty_list = ""
				$.each($(".list"), function(index){
					menu_name_list += $(this).find(".menu_name").html() + " "
					cart_qty_list += $(this).find(".qty").val() + " "
				})
				$.ajax({
					url: "update_qty.do",
					type: "post",
					dataType: "html",
					data:{
						menu_name: menu_name_list,
						cart_qty: cart_qty_list
					},
					cache: false,
					timeout: 30000
				})
				var timer = setTimeout(function(){}, 10000)
				location.href = '../order/order.do?cart_num=${cart_num }'
				clearTimeout(timer)
			}
		}
	})
	
	$(".list").hover(function(){
		$(this).find(".delete_btn").css("opacity", "1.0")
	},function(){
		$(this).find(".delete_btn").css("opacity", "0.15")
	})
	
	$(".delete_btn").click(function(){
		if(confirm("삭제 하시겠습니까?")){
			var menu_name = $(this).parents(".list").find(".menu_name").html()
			var mem_id = "${login_id}"
			$(this).parents(".list").remove()
			$(".list").first().css("border-top", "none")
			$.post("delete_cart.do", {
				menu_name: menu_name
			})
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
			<span class="title">장바구니</span>
		</div>
	</div>
	<div class="content">
		<div id="con">
			<c:forEach var="dto" items="${list }">
				<div class="list">
					<div class="img">
						<img alt="사진" src="../menu_image/${dto.menu_img }">
					</div>
					<div class="list_con">
						<p class="menu_name">${dto.menu_name }</p>
						<div class="cart_qty"><span>수량:</span>
							<div class="qty_minus">&lt;</div>
							<input class="qty" value="${dto.cart_qty }">
							<div class="qty_plus">&gt;</div>
						</div>
						<br>
						<div class="menu_price" data-origin="${dto.menu_price }">
							${dto.cart_qty * dto.menu_price }
						</div>
						<div>원</div>
					</div>
					<div class="delete_btn">
						×
					</div>
				</div>
			</c:forEach>
		</div>
		<div id="order">
			<div id="order_btn">주문하기</div>
		</div>
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