<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굿즈 상세 페이지</title>
<link rel="stylesheet" href="/resources/css/goods/goodsDetail.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
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
				<form action="/goods/buy.do" method="post">
					<div class="goods-d-main-left">
					<input type="hidden" name="productNo" value="${goods.productNo }">
					<input type="hidden" name="productPoint" value="${goods.productPoint }">
						<div id="goods-main-info-div">
							<div class="goods-name">
								<h2>${goods.productName }</h2>
							</div>
							<div class="goods-content">
								<div>${goods.productContent }</div>
							</div>
						</div>
						<div class="goods-buy-container">
							<div class="goods-buy-name">
								<h4>상품이름 : ${goods.productName }</h4>
							</div>
							<div class="goods-buy-point">
								<h4>상품가격 : ${goods.productPoint } 포인트</h4>
							</div>
							<div class="goods-buy-howmany-container">
								<div class="goods-buy-howmany">
									<div>구매갯수</div>
								</div>
								<div class="goods-buy-howmany">
									<input type="button" onClick="miunsGoods();" value=" - " name="minus" class="minus">
									<input type="text" id="count" name="count" value=0> 
									<input type="button" onClick="addGoods();" value=" + " name="add" class="add">
								</div>
							</div>
							<div class="goods-result-container">
								<div class="goods-total-point">
									<div>
										합계&nbsp;&nbsp;<input type="text" id="sum" name="sum">&nbsp;&nbsp;포인트
									</div>
								</div>
								<div class="goods-buy-button">
									<button type="submit" class="goods-buy-btn">구매하기</button>
								</div>
							</div>
						</div>
					</div>
				</form>
				<div class="goods-d-main-right">
					<div class="goods-image-container">
						<div class="goods-image">
							<img src="${goods.productImagePath }" alt="여기에 이미지">
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
	<script>
		function addGoods() {
			if(document.getElementById('count').value <= ${goods.productCount }) {
				document.getElementById('count').value++;
				document.getElementById('sum').value = ${goods.productPoint } * document.getElementById('count').value;
			}
		}
		function miunsGoods() {
			if(document.getElementById('count').value > 0) {
				document.getElementById('count').value--;
				document.getElementById('sum').value = ${goods.productPoint } * document.getElementById('count').value;			
			}
		}
	</script>
</body>
</html>