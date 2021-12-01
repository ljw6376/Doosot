<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두솥</title>
<link rel="stylesheet" type="text/css" href="../css/main_css.css?v=3">
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
   function slide_show(curr, wid, time){
      if(curr.next(".slide").attr("data-img-url") != $(".slide").last().attr("data-img-url")){
         curr.animate({width: "0px"}, time)
         curr.next(".slide").animate({width: wid + "px"}, time)
         
         curr.removeClass("active_slide")
         curr.next(".slide").addClass("active_slide")
      }else{
         curr.animate({width: "0px"}, time)
         curr.next(".slide").animate({width: wid + "px"}, time)
         
         curr.removeClass("active_slide")
         $(".slide").first().addClass("active_slide")
         
         setTimeout(function(){
            $(".slide").last().animate({width: "0px"}, 0)
            $(".slide").first().animate({width: wid + "px"}, 0)
         }, time)
      }
   }
   
   function auto_slide(wait_time, time){
      auto = setInterval(function(){
         var w = $(window).width()
         slide_show($(".active_slide"), w, time)
         var index = $(".active_slide").attr("data-index")
         $.each($(".b_btn"), function(){
               $(this).css("border", "2px solid gray")
         })
         $(".b_btn:eq(" + index + ")").css("border", "3px solid orange")
         $(".b_btn").first().css("margin-left", $(".main_top_list").css("margin-left"))
      }, wait_time)
      return auto
   }

   $(function(){
      var w = $(window).width()
      var time = 200
      var wait_time = 3000
      $(".baaner").css("width", w)
      $(".baaner").css("background", "url('" + $(".slide").first().attr("data-img-url") + "') no-repeat center")
      $(".baaner").css("background-size", "cover")
      
      $(".slide").last().attr("data-img-url", $(".slide").first().attr("data-img-url"))
      
      $.each($(".slide"), function(index){
         var url = $(this).attr("data-img-url")
         $(this).css("background", "url('" + url + "') no-repeat center")
         $(this).css("background-size", "cover")
         
         if(index < $(".slide").length - 1){
            $("#banner_btn").append("<div class='b_btn' data-index='" + index + "'></div>")
         }
      })
      
      $(".b_btn").first().css("margin-left", $(".main_top_list").css("margin-left"))
      $(".b_btn").first().css("border", "3px solid orange")
      
      $(window).resize(function(){
         w = $(window).width()
         $(".baaner").css("width", w)
         $(".active_slide").css("width", w)
         $(".b_btn").first().css("margin-left", $(".main_top_list").css("margin-left"))
      })
      
      $(".slide").first().width(w)
      
      var end_index = $(".slide").last()
      
      var auto_banner = auto_slide(wait_time, time)
      
      $(".b_btn").click(function(){
         if($(this).attr("data-index") != $(".active_slide").attr("data-index")){
            clearInterval(auto_banner)
            
            var index = $(this).attr("data-index")
            $(".active_slide").animate({width: "0px"}, time)
            $(".slide:eq(" + index + ")").animate({width: w + "px"}, time)
            
            $(".active_slide").removeClass("active_slide")
            $(".slide:eq(" + index + ")").addClass("active_slide")
            
            $.each($(".b_btn"), function(){
               $(this).css("border", "2px solid gray")
            })
            
            $(this).css("border", "3px solid orange")
            
            setTimeout(function(){
               auto_banner = auto_slide(wait_time, time)
            }, time)
         }
      })
      
      $("#stop_btn").click(function(){
         var stat = $("#stop_btn").html()
         if(stat == "▶"){
            $("#stop_btn").html("∥")
            auto_banner = auto_slide(wait_time, time)
         }else{
            $("#stop_btn").html("▶")
            clearInterval(auto_banner)
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
		<div class="banner">
			<div class="slide active_slide" data-img-url="../img/banner1.jpg"
				data-index="0"></div>
			<div class="slide" data-img-url="../img/banner2.jpg" data-index="1"></div>
			<div class="slide" data-img-url="../img/banner3.jpg" data-index="2"></div>
			<div class="slide" data-img-url="../img/banner4.jpg" data-index="3"></div>
			<div class="slide" data-img-url="" data-index="0"></div>
		</div>
		<div id="banner_btn"></div>
		<div id="stop_btn">∥</div>
	</header>
	<div id="container">
		<div class="menu_img">
			<div class="menu_img1">
				<a href="menuList.do"><img src="../img/main_left.png" alt="메인왼쪽"></a>
			</div>
			<div class="menu_img2">
				<a href="loca_list.do?pg=1"><img src="../img/main_right.png"
					alt="메인오른쪽"></a>
			</div>
		</div>
		<div class="brand_img">
			<a href="../brand/brand.jsp"><img src="../img/main_bottom.png"
				alt="메인아래쪽"></a>
		</div>
	</div>
	<footer>
		<div id="footer_head">
			<p>인재채용 | 협력업체등록 | 공지사항 | 고객 센터 | 개인정보처리방침 | 이용약관</p>
			<br>
			<br>
			<hr style="border: 1px solid dimgray;">
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