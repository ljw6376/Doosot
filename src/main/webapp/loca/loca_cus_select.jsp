<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main_page.css?new">
<link rel="stylesheet" type="text/css" href="../css/loca.css?v=4">

<script type="text/javascript" src="../script/locaScript.js?v=2"></script>

</head>
<body>

	<div class="container">
		<div class="subject" align="center">
			<span class="title">점포 찾기</span>
		</div>
		<br><br>
		<div class="select">
			<form action="loca_cus_select_Search.do" method="get" name="loca_search">
				<input type="hidden" name="pg" value="1">
				<select name="sido" id="sido" onchange="categoryChange(this)">
					<option>시/도 선택</option>
					<option value="서울특별시 ">서울특별시</option>
					<option value="경기도 ">경기도</option>
					<option value="부산광역시 ">부산광역시</option>
				</select> 
				<select name="gugun" id="gugun">
					<option>구/군 선택</option>
				</select> 
				<input type="submit" value="검색">
			</form>
		</div>
		<br>
		<br>
		<br>
		<div class="content">
			<table class="loca_list">
				<tr height="50">
					<th width="25%">매장명</th>
					<th width="40%">주소</th>
					<th width="25%">전화번호</th>
					<th width="10%">선택</th>
				</tr>
			<c:forEach var="dto" items="${list}">
				<c:if test="${dto.loca_valid == 'true'}">
					<tr height="50" bgcolor="#ffffff">
						<td>${dto.loca_name}</td>
						<td>${dto.loca_addr}</td>
						<td>${dto.loca_phone}</td>
						<td>
							<input type="button" value="선택" 
							onclick="loca_cus_Choice('${dto.loca_num}', '${dto.loca_name}', '${dto.loca_addr}')">
						</td>									
					</tr>
				</c:if>
			</c:forEach>
			<!-- 페이징 -->
				<tr height="70">
					<td colspan="5" align="center">
					<c:if test="${startPage > 3}">
							<a class="paging" href="loca_Select.do?pg=${startPage-1}">◀&nbsp;</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${pg==i}">
								<a class="currentPaging" href="loca_Select.do?pg=${i}">${i}</a>
							</c:if>
							<c:if test="${pg!=i}">
								<a class="paging" href="loca_Select.do?pg=${i}">${i}</a>
							</c:if>
					</c:forEach>
									
					<c:if test="${endPage < totalP}">
							<a href="loca_Select.do?pg=${endPage+1}" class="paging">&nbsp;▶</a>
					</c:if>				
					</td>
				</tr>
			</table>
			<br><br>

		</div>
	</div>

</body>
</html>