<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굿즈 상세 페이지</title>
<link rel="stylesheet" href="/resources/css/goodsDetail.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$(document).ready(function() {
		$(".bxslider").bxSlider({
			infiniteLoop : false,
			hideControlOnEnd : true,
			slideWidth : 0
		});
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="../include/navHeader.jsp"></jsp:include>
	</header>
	<main>
		<div class="goods-d-container">
			<div class="goods-d-title">
				<h1>굿즈 상세 페이지</h1>
			</div>
			<div class="goods-d-main">
				<div class="goods-d-main-left">
					<div class="goods-name">
						<h2>여기가 굿즈이름</h2>
					</div>
					<div class="goods-point">
						<h3>여기가 굿즈 설명</h3>
					</div>
					<div class="goods-buy-container">
						<div class="goods-buy-name">
							<h4>굿즈이름</h4>
						</div>
						<div class="goods-buy-point">
							<h4>굿즈가격</h4>
						</div>
						<div class="goods-buy-howmany">
							<div>굿즈갯수</div>
						</div>
						<div class="goods-result-container">
							<div class="goods-total-point">
								<h4>굿즈갯수*굿즈가격</h4>
							</div>
							<div class="goods-buy-button">
								<button class="goods-buy-btn">구매하기</button>
							</div>
						</div>
					</div>
				</div>
				<div class="goods-d-main-right">
					<div class="goods-image-container">
						<div class="goods-image">
							<h1>여기에 이미지</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer>
	</footer>
</body>
</html>