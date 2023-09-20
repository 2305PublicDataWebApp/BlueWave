<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="resources/css/main.css" />
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
	<div class="container">
		<header>
			<jsp:include page="include/navHeader.jsp"></jsp:include>
		</header>

		<main>
			<div class="main-container">
				<div class="main-img">
					<img src="resources/images/main2.png" alt="메인이미지" />
				</div>

				<!-- 챌린지 페이지 -->
				<div class="challenge-list-container">
					<div id="container">
						<section id="up-section">
							<div class="chal-category-title">
								<h2>블루웨이브 챌린지</h2>
							</div>

							<div class="chal-list">
								<div class="scroll-container">
									<div class="chal-content">
										<ul>
											<li>
												<div>
													<a href="#"> 챌린지1
														<div class="chal-img"></div>
													</a>
													<div class="chal-text-box">안녕하세요 여기는 챌린지에 대한 정보가 요약되어
														있는 창 입니다.</div>
													<div class="chal-list-bottom">
														<div>
															<div class="user-icon-box">
																<div class="chal-user-icon"></div>
																<span>&nbsp;158</span>
															</div>
															<div class="like-icon-box">
																<div class="chal-like-icon"></div>
																<span>&nbsp;158</span>
															</div>
														</div>
														<div>
															<button>참여하기</button>
														</div>
													</div>
												</div>
											</li>

											<li>
												<div>
													<a href="#"> 챌린지1
														<div class="chal-img"></div>
													</a>
													<div class="chal-text-box">안녕하세요 여기는 챌린지에 대한 정보가 요약되어
														있는 창 입니다.</div>
													<div class="chal-list-bottom">
														<div>
															<div class="user-icon-box">
																<div class="chal-user-icon"></div>
																<span>&nbsp;158</span>
															</div>
															<div class="like-icon-box">
																<div class="chal-like-icon"></div>
																<span>&nbsp;158</span>
															</div>
														</div>
														<div>
															<button>참여하기</button>
														</div>
													</div>
												</div>
											</li>

											<li>
												<div>
													<a href="#"> 챌린지1
														<div class="chal-img"></div>
													</a>
													<div class="chal-text-box">안녕하세요 여기는 챌린지에 대한 정보가 요약되어
														있는 창 입니다.</div>
													<div class="chal-list-bottom">
														<div>
															<div class="user-icon-box">
																<div class="chal-user-icon"></div>
																<span>&nbsp;158</span>
															</div>
															<div class="like-icon-box">
																<div class="chal-like-icon"></div>
																<span>&nbsp;158</span>
															</div>
														</div>
														<div>
															<button>참여하기</button>
														</div>
													</div>
												</div>
											</li>

											<li>
												<div>
													<a href="#"> 챌린지1
														<div class="chal-img"></div>
													</a>
													<div class="chal-text-box">안녕하세요 여기는 챌린지에 대한 정보가 요약되어
														있는 창 입니다.</div>
													<div class="chal-list-bottom">
														<div>
															<div class="user-icon-box">
																<div class="chal-user-icon"></div>
																<span>&nbsp;158</span>
															</div>
															<div class="like-icon-box">
																<div class="chal-like-icon"></div>
																<span>&nbsp;158</span>
															</div>
														</div>
														<div>
															<button>참여하기</button>
														</div>
													</div>
												</div>
											</li>
											<li>
												<div>
													<a href="#"> 챌린지1
														<div class="chal-img"></div>
													</a>
													<div class="chal-text-box">안녕하세요 여기는 챌린지에 대한 정보가 요약되어
														있는 창 입니다.</div>
													<div class="chal-list-bottom">
														<div>
															<div class="user-icon-box">
																<div class="chal-user-icon"></div>
																<span>&nbsp;158</span>
															</div>
															<div class="like-icon-box">
																<div class="chal-like-icon"></div>
																<span>&nbsp;158</span>
															</div>
														</div>
														<div>
															<button>참여하기</button>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</section>

						<section id="down-section">
							<div class="chal-category-title">
								<h2>개인 챌린지</h2>
								<button id="new-chal-btn">챌린지 생성</button>
							</div>

							<div class="chal-list">
								<div class="scroll-container">
									<div class="chal-content">
										<ul>
											<li>
												<div>
													<a href="#"> 챌린지1
														<div class="chal-img"></div>
													</a>
													<div class="chal-text-box">안녕하세요 여기는 챌린지에 대한 정보가 요약되어
														있는 창 입니다.</div>
													<div class="chal-list-bottom">
														<div>
															<div class="user-icon-box">
																<div class="chal-user-icon"></div>
																<span>&nbsp;158</span>
															</div>
															<div class="like-icon-box">
																<div class="chal-like-icon"></div>
																<span>&nbsp;158</span>
															</div>
														</div>
														<div></div>
													</div>
												</div>
											</li>

											<li>
												<div>
													<a href="#"> 챌린지1
														<div class="chal-img"></div>
													</a>
													<div class="chal-text-box">안녕하세요 여기는 챌린지에 대한 정보가 요약되어
														있는 창 입니다.</div>
													<div class="chal-list-bottom">
														<div>
															<div class="user-icon-box">
																<div class="chal-user-icon"></div>
																<span>&nbsp;158</span>
															</div>
															<div class="like-icon-box">
																<div class="chal-like-icon"></div>
																<span>&nbsp;158</span>
															</div>
														</div>
														<div></div>
													</div>
												</div>
											</li>

											<li>
												<div>
													<a href="#"> 챌린지1
														<div class="chal-img"></div>
													</a>
													<div class="chal-text-box">안녕하세요 여기는 챌린지에 대한 정보가 요약되어
														있는 창 입니다.</div>
													<div class="chal-list-bottom">
														<div>
															<div class="user-icon-box">
																<div class="chal-user-icon"></div>
																<span>&nbsp;158</span>
															</div>
															<div class="like-icon-box">
																<div class="chal-like-icon"></div>
																<span>&nbsp;158</span>
															</div>
														</div>
														<div></div>
													</div>
												</div>
											</li>

											<li>
												<div>
													<a href="#"> 챌린지1
														<div class="chal-img"></div>
													</a>
													<div class="chal-text-box">안녕하세요 여기는 챌린지에 대한 정보가 요약되어
														있는 창 입니다.</div>
													<div class="chal-list-bottom">
														<div>
															<div class="user-icon-box">
																<div class="chal-user-icon"></div>
																<span>&nbsp;158</span>
															</div>
															<div class="like-icon-box">
																<div class="chal-like-icon"></div>
																<span>&nbsp;158</span>
															</div>
														</div>
														<div></div>
													</div>
												</div>
											</li>
											<li>
												<div>
													<a href="#"> 챌린지1
														<div class="chal-img"></div>
													</a>
													<div class="chal-text-box">안녕하세요 여기는 챌린지에 대한 정보가 요약되어
														있는 창 입니다.</div>
													<div class="chal-list-bottom">
														<div>
															<div class="user-icon-box">
																<div class="chal-user-icon"></div>
																<span>&nbsp;158</span>
															</div>
															<div class="like-icon-box">
																<div class="chal-like-icon"></div>
																<span>&nbsp;158</span>
															</div>
														</div>
														<div></div>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>

				<!-- 굿즈 페이지 -->
				<div class="goods-div-container">
					<div class="main-title">
						<h1>굿즈 페이지</h1>
					</div>
					<div class="goods-container">
						<div class="bxslider">
							<c:forEach var="goods" items="${gList }" varStatus="status">
								<c:if test="${ status.index % 8 == 0}">
									<div class="goods-item-container">
								</c:if>
										<div class="goods-item">
											<div class="goods-thumbnail">
												<img src="${goods.productThumbnailPath }" alt="여기는 이미지" />
											</div>
											<div class="goods-price">
												<h3>${goods.productPoint }</h3>
											</div>
											<div class="goods-name">
												<h2>${goods.productName }</h2>
											</div>
											<div class="goods-buy-btn">
<%-- 												<button class="buy-btn" onclick="location.href='/goods/detail.do?productNo=${goods.productNo }'">구매하기</button> --%>
											</div>
										</div>
								<c:if test="${ status.index % 8 == 7 or status.count == gList.size() }">
									</div>
								</c:if>	
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</main>
		<footer>
			<div class="footer">여기에 풋터</div>
		</footer>
	</div>

	<script>
		$(document).ready(function() {
			$(".scroll-container").on("wheel", function(event) {
				// 마우스 휠 이벤트 발생 시 가로 스크롤 조작
				const delta = event.originalEvent.deltaY;
				this.scrollLeft += delta;
				event.preventDefault();
			});
		});
	</script>
</body>
</html>