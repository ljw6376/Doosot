<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥</title>
<link rel="stylesheet" type="text/css" href="../css/main.css?v=1">
<link rel="stylesheet" type="text/css" href="../css/menuList.css?v=2">
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function goDetail(num){
		location.href = "menuDetail.do?menu_num=" + num + "&category=" + cat
	}
	
	function loadCategory(category){
		$.ajax({
			url: "menuList.do",
			type: "post",
			dateType: "html",
			data:{
				menu_category: category
			},
			cache: false,
			timeout: 30000,
			success: function(html){
				var page = $(html)
				var con = page.find("#con")
				con.find("#category").html($(".filter > select > option:selected").html())
				$("#con").html(con.html())
				$.each($(".food"), function(index){
					if(index % 3 == 1){
						$(this).addClass("list_mid")
					}
				})
				$.each($(".disableFood"), function(index){
               		if(index % 3 == 1){
                  	$(this).addClass("list_mid")
               	}
            })
			},
			fail: function(xhr, textStatus, errorThrown){
				alert(xhr.status)
			}
		})
	}

	$(function(){
		if("${category }" == ""){
			cat = $(".filter > select > option:selected").val()
		}else{
			cat = "${category }"
			$.each($(".filter > select > option"), function(){
				if($(this).attr("value") == cat){
					$(this).attr("selected", "selected")
				}
			})
		}
		
		loadCategory(cat)
		
		$(".filter > select").change(function(){
			cat = $(".filter > select > option:selected").val()
			
			loadCategory(cat)
			
			return false
		})
		
		$("#menuWriteForm").click(function(){
			location.href = "menuWriteForm.do"
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
			<span class="title">두솥 메뉴</span> <span class="filter"> <select>
					<option value="total">전체</option>
					<option value="고기고기">고기고기</option>
					<option value="마요">마요</option>
			</select>
			</span>
		</div>
	</div>
	<div class="content">
		<div id="con">
			<span class="category">전체</span>
			<div class="menu_table">
				<c:forEach var="dto" items="${list }">
					<table class="food" onclick="goDetail(${dto.menu_num })">
						<tr>
							<td width="300px" height="250px"><img alt="음식 사진"
								src="../menu_image/${dto.menu_img }" class="img"></td>
						</tr>
						<tr>
							<td>${dto.menu_name }</td>
						</tr>
						<tr>
							<td>${dto.menu_price }</td>
						</tr>
					</table>
				</c:forEach>
			</div>
			<c:if test="${admin_num == '1' }">
				<hr style="border: 1px solid #ececec">
				<span class="category">비활성화 메뉴</span>
				<div class="menu_table">
					<c:forEach var="disableDto" items="${disableList }">
						<table class="disableFood"
							onclick="goDetail(${disableDto.menu_num })">
							<tr>
								<td width="300px" height="250px"><img alt="음식 사진"
									src="../menu_image/${disableDto.menu_img }" class="img"></td>
							</tr>
							<tr>
								<td>${disableDto.menu_name }</td>
							</tr>
							<tr>
								<td>${disableDto.menu_price }</td>
							</tr>
						</table>
					</c:forEach>
				</div>
			</c:if>
		</div>
	</div>
	<c:if test="${admin_num == '1' }">
		<div class="admin_bar">
			<div class="admin_bar_list">
				<div class="bar_btn" id="menuWriteForm">신규 등록</div>
			</div>
		</div>
	</c:if>
	<footer>
		<div id="footer_content">
			<div id="footer_head">
				<p>인재채용 | 협력업체등록 | 공지사항 | 고객 센터 | 개인정보처리방침 | 이용약관</p>
			</div>
			<br>
			<br>
			<hr style="border: 1px solid dimgray;">
			<div id="footer_foot">
				<p>대표이사 홍길동 | 사업자등록번호 123-12-12345 | 서울 서초구 서초대로 77길 55,에이프로 스퀘어
					3층(서초동) | T.02-1234-1234 | F.02-9876-9876</p>
				<p>E.doosot@naver.com | 두솥 도시락 고객센터 02-2345-2345 | 전국창업설명회
					02-3456-3456 | 단체주문 4567-4567</p>
				<br>
				<p>COPYRIGHT (주)두솥.ALL RIGHT RESEVED</p>
			</div>
		</div>
	</footer>
</body>
</html>