<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥 주문하기</title>
<link rel="stylesheet" type="text/css" href="../css/order.css?v=2">
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	function getParameters(param) { // jquery 함수생성
		var params = location.search.substr(location.search.indexOf("?") + 1); // ? 뒤의 문자 출력
		var returnValue = "";
		params = params.split("&"); // & 로 나누기
		for (var i = 0; i < params.length; i++) {
			temp = params[i].split("="); // = 로 나누기
			if ([temp[0]] == param) { // param이랑 = 앞의 문자가 같다면
				returnValue = temp[1];// 값저장 
				break;
			}
		}
		return decodeURI(returnValue);
	};
	$(function() {
		var mem_name = "${login_name}";
		var mem_addr = "${login_addr}";
		
		if(mem_name != null && mem_addr != null){
			$("input[name='deli_name']").attr("value",mem_name);
			$("input[name='deli_addr']").attr("value",mem_addr);
		}
		
		$("#comment > option:eq(1)").attr("value", $("#comment > option:eq(1)").html())
		$("#comment > option:eq(2)").attr("value", $("#comment > option:eq(2)").html())
		
		var price = 0
		
		$.each($(".price"), function(){
			price += parseInt($(this).html())
		})
		
		$("#total_price").html(price)
		
		$("input[value='지점선택']").click(function() {
			window.open("loca_cus_select.do?pg=1",'newWindow' ,"width=1300 height=1000 left=250 top=20");
			//location.href="loca_cus_select.do?pg=1";
			//alert("test");
		});
		$("#comment").change(function(){
			if($("#comment option:selected").val() == "write"){
				$("input[name='deli_comm']").removeAttr("hidden")
			}else{
				$("input[name='deli_comm']").attr("hidden", "true")
			}
		})
		
		$("#order_btn").click(function(){
			if($(".list table").html().trim() == ""){
				alert("주문할 음식이 없습니다.")
			}else{
				if(!$("input[name='deli_name']").val()){
					alert("수령자의 이름을 입력해주세요.")
					$("input[name='deli_name']").focus()
					return false
				}
				if(!$("input[name='deli_addr']").val()){
					alert("배송지를 입력해주세요.")
					$("input[name='deli_addr']").focus()
					return false
				}
				/*
				if($("input[name='deli_store_name']").val() == "지점선택" && 
					$("input[name='deli_store_addr']").val() == "지점선택"){
					alert("지점을 선택해 주세요.")
					$("input[name='deli_store_addr']").focus()
					return false
				}
				*/
				
				var deposit = parseInt($("#deposit").html())
				var total_price = parseInt($("#total_price").html())
				if(deposit >= total_price){
					if(confirm("결제 하시겠습니까?")){
						deposit = deposit - total_price
						$("input[name='deli_remain']").attr("value", deposit)
						$("input[name='deli_price']").attr("value", total_price)
						var select = $("#comment option:selected").val()
						if(select != "write"){
							$("input[name='deli_comm']").attr("value", select)
						}
						frm.submit()
					}
				}else{
					if(confirm("예치금이 부족합니다. 충전페이지로 가시겠습니까?")){
						location.href="../member/member_mypage.jsp";
					}
				}
			}
		})
		
		$(".list_tr").hover(function(){
			$(this).find(".delete_btn").css("opacity", "1.0")
		},function(){
			$(this).find(".delete_btn").css("opacity", "0.15")
		})
		
		$(".delete_btn").click(function(){
			if(confirm("삭제 하시겠습니까?")){
				var menu_name = $(this).parents(".list_tr").find(".menu_name").html()
				var mem_id = "${login_id}"
				$(this).parents(".list_tr").remove()
				$.post("delete_cart.do", {
					menu_name: menu_name
				})
				return false
			}
		})
	});
</script>
</head>
<body>
	<header>
		<div class="flex">
			<a href="member_logout.do">로그아웃 </a>|
			<a href="cartList.do">장바구니 </a>|
			<a href="../member/member_mypage.jsp">예치금 : ${mem_deposit }원 </a>|
			<a href="../member/member_mypage.jsp">마이페이지 </a>|
			<a href="https://www.instagram.com/hansot_official/">
				<img src="../img/insta.png" width=14px height=14px style="max-width: 100%; height: auto;">
			</a>
			<a href="https://www.facebook.com/hansotOfficial/?ref=ts&fref=ts">
				<img src="../img/face.png" width=18px height=18px style="max-width: 100%; height: auto;">
			</a>
		</div>
		<div class="top">
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
		</div>
	</header>
	<div class="content">
		<div class="container">
			<div class="subject" align="center">
				<span class="title">주문하기</span>
			</div>
   		</div>
   		<div class="list">
   			<table>
   				<c:forEach var="dto" items="${list }">
   					<tr class="list_tr">
	   					<td class="photo"><img alt="사진" src="../menu_image/${dto.menu_img }"></td>
	   					<td width="237px" class="menu_name">${dto.menu_name }</td>
	   					<td width="97px">${dto.cart_qty } 개</td>
	   					<td width="165px"><span class="price">${dto.cart_qty * dto.menu_price }</span> 원</td>
	   					<td><div class="delete_btn" 
	   					style="width: 100%; height: 100%;
	   					font-size: 40px; padding-bottom: 6px; padding-right: 10px;
	   					">×</div></td>
   					</tr>
   				</c:forEach>
   			</table>
   		</div>
   		<div class="order">
   			<div id="delivery">
   				<form action="orderProgress.do" name="frm" method="post" id="frm">
   					<table>
   						<tr>
   							<td class="label">수령자</td>
   							<td class="deli_content">
   								<input type="text" name="deli_name" value="${login_name }" class="short">
   							</td>
   						</tr>
   						<tr>
   							<td class="label">받을 곳</td>
   						</tr>
   						<tr>
							<td colspan="2" class="deli_content">
								<input type="text" name="deli_addr" value="${login_addr }" class="long">
							</td>
						</tr>
						
   						<tr>
   							<td class="label">지점선택</td>
   							<td class="deli_content">
   								<input type="hidden" name="loca_num" id="loca_num">
   								<input type="text" name="deli_store_name" id="deli_store_name" value="지점선택" class="short" readonly>
   							</td>
   						</tr>
   						<tr>
   							<td colspan="2" class="deli_content">
   								<input type="text" name="deli_store_addr" id="deli_store_addr" value="지점선택" class="long" readonly>
   							</td>
   						</tr>
   						
   						<tr>
   							<td class="label">요청사항</td>
   							<td class="deli_content">
   								<select class="short" id="comment">
   									<option value=""> -- 요청사항 선택 --</option>
   									<option>부재시 연락바랍니다.</option>
   									<option>부재시 문앞에 놓아주세요.</option>
   									<option value="write"> -- 직접작성 -- </option>
   								</select>
   							</td>
   						</tr>
   						<tr>
   							<td colspan="2">
   								<input hidden="" type="text" name="deli_comm" class="long">
   							</td>
   						</tr>
   					</table>
   					<input type="hidden" name="deli_remain" value="">
   					<input type="hidden" name="deli_price" value="">
   					<input type="hidden" name="cart_num" value="${cart_num }">
   				</form>
   			</div>
   			<div id="calc">
   				<p>예치금: <span id="deposit" class="calc_num">${mem_deposit }</span> 원</p>
   				<p>총 금액: <span id="total_price" class="calc_num"></span> 원</p>
   			</div>
   			<input id="order_btn" type="button" value="주문하기">
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