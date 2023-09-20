<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린지 검색</title>
<!-- 리셋 css -->
<link rel="stylesheet" href="/resources/css/reset/reset.css">

<!-- 페이지 css -->
<link rel="stylesheet"
	href="/resources/css/challenge/challengeSearch.css">
</head>
<body>
	<header> </header>
	<jsp:include page="/WEB-INF/views/include/navHeader.jsp" />
	<main>
		<div id="container">
			<section class="title-section">
				<div class="title-box">
					<h1>챌린지 검색</h1>
				</div>
				<div class="small-title-box">
					<h3>챌린지 '${searchKeyword}' 검색 결과</h3>
				</div>
			</section>
			<section class="content-section">
				<section id="up-section">
					<div class="chal-title-search-box">
						<div class="chal-category-title">
							<h2>블루웨이브 챌린지</h2>
						</div>

						<div class="chal-search-box">
							<form action="/challenge/search.do" method="get">
								<select name="searchCondition">
									<option value="all" 		<c:if test="${searchCondition == 'all'}">selected</c:if>>전체</option>
									<option value="writer" 		<c:if test="${searchCondition == 'writer'}">selected</c:if>>작성자</option>
									<option value="title" 		<c:if test="${searchCondition == 'title'}">selected</c:if>>제목</option>
									<option value="content" 	<c:if test="${searchCondition == 'content'}">selected</c:if>>내용</option>
								</select> 
								<input type="text" name="searchKeyword" placeholder="검색어를 입력해주세요." value="${searchKeyword}">
								<div id="searchBtn">
									<button>검색</button>
		                    	</div>
							</form>
						</div>
					</div>

					<div class="chal-list">
						<div class="scroll-container">
							<div class="chal-content">
								<ul>
									<c:forEach var="chalList" items="${sList}">
										<c:if test="${chalList.chalUserId eq 'admin'}">
											<li>
												<div>
													<a href="/challenge/info.do?chalNo=${chalList.chalNo }">
														${chalList.chalTitle }
														<div style="height: 175px;">
															<img
																src="../resources/chaluploadFiles/${chalList.chalFileRename}"
																alt="챌린지 게시물 사진" class="chal-img">
														</div>
													</a>
													<div class="chal-text-box">${chalList.chalContent }
													</div>
													<div class="chal-list-bottom">
														<div>
															<div class="user-icon-box">
																<div class="chal-user-icon">
																	<img src="/resources/images/challenge/board-icon3.png" alt="게시물 아이콘">
																</div>
																<span>&nbsp;158</span>
															</div>
															<div class="like-icon-box">
																<div class="chal-like-icon">
																	<img src="/resources/images/challenge/heart.png" alt="좋아요 아이콘">
																</div>
																<span>&nbsp;158</span>
															</div>
														</div>
														<div class="btn">
															<button>참여하기</button>
														</div>
													</div>
												</div>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</section>
			</section>
			<section id="down-section">
				<div class="chal-category-title">
					<h2>개인 챌린지</h2>
				</div>
				<div class="chal-list">
					<div class="scroll-container">
						<div class="chal-content">
							<ul>
								<c:forEach var="chalList" items="${sList}">
									<c:if test="${chalList.chalUserId ne 'admin'}">
										<li>
											<div>
												<a href="/challenge/info.do?chalNo=${chalList.chalNo }">
													${chalList.chalTitle }
													<div style="height: 175px;">
														<img
															src="/resources/chaluploadFiles/${chalList.chalFileRename}"
															alt="챌린지 게시물 사진" class="chal-img">
													</div>
												</a>
												<div class="chal-text-box">${chalList.chalContent }</div>
												<div class="chal-list-bottom">
													<div>
														<div class="user-icon-box">
															<div class="chal-user-icon">
																<img src="/resources/images/challenge/board-icon3.png" alt="게시물 아이콘">
															</div>
															<span>&nbsp;158</span>
														</div>
														<div class="like-icon-box">
															<div class="chal-like-icon">
																<img src="/resources/images/challenge/heart.png" alt="좋아요 아이콘">
															</div>
															<span>&nbsp;158</span>
														</div>
													</div>
													<div class="btn">
														<button>참여하기</button>
													</div>
												</div>
											</div>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
	<footer> </footer>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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