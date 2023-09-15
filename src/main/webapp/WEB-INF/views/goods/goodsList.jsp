<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굿즈 페이지</title>
<link rel="stylesheet" href="/resources/css/goodsList.css">
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
	<div class="container">
		<main>
			<div class="main-title">
				<h1>굿즈 페이지</h1>
			</div>
			<div class="main-container">
				<div class="bxslider">
					<div class="goods-list-container">
						<div class="goods-item-container">
							<div class="goods-item">
								<div class="goods-thumbnail">
									<img src="./images/main-img.png" alt="여기는 이미지" />
								</div>
								<div class="goods-price">
									<h3>여기가 가격</h3>
								</div>
								<div class="goods-name">
									<h2>여기가 이름</h2>
								</div>
								<div class="goods-buy-btn">
									<button class="buy-btn">구매하기</button>
								</div>
							</div>
						</div>
						<div class="goods-item-container">
							<div class="goods-item">
								<div class="goods-thumbnail">
									<img src="#" alt="여기는 이미지" />
								</div>
								<div class="goods-price">
									<h3>여기가 가격</h3>
								</div>
								<div class="goods-name">
									<h2>여기가 이름</h2>
								</div>
								<div class="goods-buy-btn">
									<button class="buy-btn">구매하기</button>
								</div>
							</div>
						</div>
						<div class="goods-item-container">
							<div class="goods-item">
								<div class="goods-thumbnail">
									<img src="#" alt="여기는 이미지" />
								</div>
								<div class="goods-price">
									<h3>여기가 가격</h3>
								</div>
								<div class="goods-name">
									<h2>여기가 이름</h2>
								</div>
								<div class="goods-buy-btn">
									<button class="buy-btn">구매하기</button>
								</div>
							</div>
						</div>
						<div class="goods-item-container">
							<div class="goods-item">
								<div class="goods-thumbnail">
									<img src="#" alt="여기는 이미지" />
								</div>
								<div class="goods-price">
									<h3>여기가 가격</h3>
								</div>
								<div class="goods-name">
									<h2>여기가 이름</h2>
								</div>
								<div class="goods-buy-btn">
									<button class="buy-btn">구매하기</button>
								</div>
							</div>
						</div>
						<div class="goods-item-container">
							<div class="goods-item">
								<div class="goods-thumbnail">
									<img src="#" alt="여기는 이미지" />
								</div>
								<div class="goods-price">
									<h3>여기가 가격</h3>
								</div>
								<div class="goods-name">
									<h2>여기가 이름</h2>
								</div>
								<div class="goods-buy-btn">
									<button class="buy-btn">구매하기</button>
								</div>
							</div>
						</div>
						<div class="goods-item-container">
							<div class="goods-item">
								<div class="goods-thumbnail">
									<img src="#" alt="여기는 이미지" />
								</div>
								<div class="goods-price">
									<h3>여기가 가격</h3>
								</div>
								<div class="goods-name">
									<h2>여기가 이름</h2>
								</div>
								<div class="goods-buy-btn">
									<button class="buy-btn">구매하기</button>
								</div>
							</div>
						</div>
						<div class="goods-item-container">
							<div class="goods-item">
								<div class="goods-thumbnail">
									<img src="#" alt="여기는 이미지" />
								</div>
								<div class="goods-price">
									<h3>여기가 가격</h3>
								</div>
								<div class="goods-name">
									<h2>여기가 이름</h2>
								</div>
								<div class="goods-buy-btn">
									<button class="buy-btn">구매하기</button>
								</div>
							</div>
						</div>
						<div class="goods-item-container">
							<div class="goods-item">
								<div class="goods-thumbnail">
									<img src="#" alt="여기는 이미지" />
								</div>
								<div class="goods-price">
									<h3>여기가 가격</h3>
								</div>
								<div class="goods-name">
									<h2>여기가 이름</h2>
								</div>
								<div class="goods-buy-btn">
									<button class="buy-btn">구매하기</button>
								</div>
							</div>
						</div>
					</div>
					<div class="goods-list-container">
						<div class="goods-item-container">
							<div class="goods-item">
								<div class="goods-thumbnail">
									<img src="./images/main-img.png" alt="여기는 이미지" />
								</div>
								<div class="goods-price">
									<h3>여기가 가격</h3>
								</div>
								<div class="goods-name">
									<h2>여기가 이름</h2>
								</div>
								<div class="goods-buy-btn">
									<button class="buy-btn">구매하기</button>
								</div>
							</div>
						</div>
						<div class="goods-item-container">
							<div class="goods-item">
								<div class="goods-thumbnail">
									<img src="#" alt="여기는 이미지" />
								</div>
								<div class="goods-price">
									<h3>여기가 가격</h3>
								</div>
								<div class="goods-name">
									<h2>여기가 이름</h2>
								</div>
								<div class="goods-buy-btn">
									<button class="buy-btn">구매하기</button>
								</div>
							</div>
						</div>
						<div class="goods-item-container">
							<div class="goods-item">
								<div class="goods-thumbnail">
									<img src="#" alt="여기는 이미지" />
								</div>
								<div class="goods-price">
									<h3>여기가 가격</h3>
								</div>
								<div class="goods-name">
									<h2>여기가 이름</h2>
								</div>
								<div class="goods-buy-btn">
									<button class="buy-btn">구매하기</button>
								</div>
							</div>
						</div>
						<div class="goods-item-container">
							<div class="goods-item">
								<div class="goods-thumbnail">
									<img src="#" alt="여기는 이미지" />
								</div>
								<div class="goods-price">
									<h3>여기가 가격</h3>
								</div>
								<div class="goods-name">
									<h2>여기가 이름</h2>
								</div>
								<div class="goods-buy-btn">
									<button class="buy-btn">구매하기</button>
								</div>
							</div>
						</div>
						<div class="goods-item-container">
							<div class="goods-item">
								<div class="goods-thumbnail">
									<img src="#" alt="여기는 이미지" />
								</div>
								<div class="goods-price">
									<h3>여기가 가격</h3>
								</div>
								<div class="goods-name">
									<h2>여기가 이름</h2>
								</div>
								<div class="goods-buy-btn">
									<button class="buy-btn">구매하기</button>
								</div>
							</div>
						</div>
						<div class="goods-item-container">
							<div class="goods-item">
								<div class="goods-thumbnail">
									<img src="#" alt="여기는 이미지" />
								</div>
								<div class="goods-price">
									<h3>여기가 가격</h3>
								</div>
								<div class="goods-name">
									<h2>여기가 이름</h2>
								</div>
								<div class="goods-buy-btn">
									<button class="buy-btn">구매하기</button>
								</div>
							</div>
						</div>
						<div class="goods-item-container">
							<div class="goods-item">
								<div class="goods-thumbnail">
									<img src="#" alt="여기는 이미지" />
								</div>
								<div class="goods-price">
									<h3>여기가 가격</h3>
								</div>
								<div class="goods-name">
									<h2>여기가 이름</h2>
								</div>
								<div class="goods-buy-btn">
									<button class="buy-btn">구매하기</button>
								</div>
							</div>
						</div>
						<div class="goods-item-container">
							<div class="goods-item">
								<div class="goods-thumbnail">
									<img src="#" alt="여기는 이미지" />
								</div>
								<div class="goods-price">
									<h3>여기가 가격</h3>
								</div>
								<div class="goods-name">
									<h2>여기가 이름</h2>
								</div>
								<div class="goods-buy-btn">
									<button class="buy-btn">구매하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<footer></footer>
	</div>
</body>
</html>