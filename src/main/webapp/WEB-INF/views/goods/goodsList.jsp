<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굿즈 페이지</title>
<link rel="stylesheet" href="/resources/css/goods/goodsList.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$(document).ready(function() {
		var slider = $(".bxslider").bxSlider({
			infiniteLoop : false,
			hideControlOnEnd : true,
			touchEnabled : (navigator.maxTouchPoints > 0)
		// 			slideWidth : 0
		});
		var currentPage = slider.getCurrentSlide();
	});
</script>
<style type="text/css">
.bx-viewport {
	height: 100% !important;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../include/navHeader.jsp"></jsp:include>
	</header>
	<div class="container">
		<main>
			<div class="main-title">
				<h1>굿즈 페이지</h1>
			</div>
			<div class="main-container">
				<div class="bxslider">
					<c:forEach var="goods" items="${gList }" varStatus="status">
						<c:if test="${ status.index % 8 == 0}">
							<div class="goods-item-container">
						</c:if>
						<div class="goods-item">
							<div class="goods-thumbnail">
								<img src="../resources/images/background-img.jpg" alt="여기는 이미지" />
							</div>
							<div class="goods-price">
								<h3>${goods.productPoint }</h3>
							</div>
							<div class="goods-name">
								<h2>${goods.productName }</h2>
							</div>
							<div class="goods-buy-btn">
								<button class="buy-btn" onclick="location.href='/goods/detail.do?productNo=${goods.productNo }'">구매하기</button>
							</div>
						</div>
						<c:if
							test="${ status.index % 8 == 7 or status.count == gList.size() }">
							</div>
						</c:if>	
					</c:forEach>
				</div>
		</div>
	</main>
	<footer></footer>
	</div>
</body>
</html>