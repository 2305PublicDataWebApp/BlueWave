<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="resources/css/main.css" />
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
	/* 코드팬 테스트 */
	function scrollFooter(scrollY, heightFooter) {
		console.log(scrollY);
		console.log(heightFooter);

		if (scrollY >= heightFooter) {
			$('.footer').css({
				'bottom' : '0px'
			});
		} else {
			$('.footer').css({
				'bottom' : '-' + heightFooter + 'px'
			});
		}
	}

	$(window).load(
			function() {
				var windowHeight = $(window).height(), footerHeight = $(
						'.footer').height(), heightDocument = (windowHeight)
						+ ($('.main-content').height())
						+ ($('.footer').height()) - 10;

				// Definindo o tamanho do elemento pra animar
				$('#scroll-animate, #scroll-animate-main').css({
					'height' : heightDocument + 'px'
				});

				// Definindo o tamanho dos elementos header e conteúdo
				$('.main-img').css({
					'height' : windowHeight + 'px',
					'line-height' : windowHeight + 'px'
				});

				$('.wrapper-parallax').css({
					'margin-top' : windowHeight + 'px'
				});

				scrollFooter(window.scrollY, footerHeight);

				// ao dar rolagem
				window.onscroll = function() {
					var scroll = window.scrollY;

					$('#scroll-animate-main').css({
						'top' : '-' + scroll + 'px'
					});

					$('.main-img').css(
							{
								'background-position-y' : 50
										- (scroll * 100 / heightDocument) + '%'
							});

					scrollFooter(scroll, footerHeight);
				}
			});
	
	function showChallengeWrite() {
    	const url = "/challenge/create.do";
    	location.href = url;
    	
    }
</script>
</head>
<body>
	<header>
		<jsp:include page="include/navHeader.jsp"></jsp:include>
	</header>
	<div id="scroll-animate">
		<div id="scroll-animate-main">
			<div class="wrapper-parallax">
				<div class="main-img">
					<img src="resources/images/admin-img.png" alt="메인이미지" />
				</div>
				<div class="container ">
					<main class="main-content">
						<div class="main-container">

							<!-- 챌린지 페이지 -->
							<div class="challenge-list-container">
								<div class="chall-container">
									<div style="width:80%;margin:0 auto;margin-bottom:15px;">
										<div class="chal-title-write-box">
											<div class="chal-category-title">
												<h2 style="margin-bottom:15px;">블루웨이브 챌린지</h2>
											</div>
										</div>

										<div class="chal-list">
											<div class="scroll-container">
												<div class="chal-content">
													<ul>
														<c:forEach var="chalList" items="${acList}" begin="0"
															end="2">
															<c:if test="${chalList.chalUserId eq 'admin'}">
																<li>
																	<div>
																		<a
																			href="/challenge/info.do?chalNo=${chalList.chalNo }">
																			<div class="chal-title-div">
																				<c:set var="chalTitle"
																					value="${chalList.chalTitle }" />

																				<c:choose>
																					<c:when test="${fn:length(chalTitle) > 15}">
																						<c:set var="chalTitleTruncatedString"
																							value="${fn:substring(chalTitle, 0, 15)}..." />
																						<c:out value="${chalTitleTruncatedString}" />
																					</c:when>
																					<c:otherwise>
																						<c:out value="${chalTitle}" />
																					</c:otherwise>
																				</c:choose>
																			</div>
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
																						<img
																							src="/resources/images/challenge/board-icon3.png"
																							alt="게시물 아이콘">
																					</div>
																					<c:set var="found" value="false" />
							                                                        <c:forEach var="cBoardCount" items="${cBoardCNT }">
							                                                        	<c:if test="${chalList.chalNo eq cBoardCount.chalNo }">
							                                                        		<span>&nbsp;${cBoardCount.boardCount }</span>
							                                                        	</c:if>
							                                                        </c:forEach>
																				</div>
																				<div class="like-icon-box">
																					<div class="chal-like-icon">
																						<img src="/resources/images/challenge/heart.png"
																							alt="좋아요 아이콘">
																					</div>
																					<c:forEach var="cLikeCount" items="${cLikeList }">
							                                                        	<c:if test="${chalList.chalNo eq cLikeCount.chalNo }">
								                                                        	<c:if test="${cLikeCount.likeCount eq 0 }">
								                                                        		<span>&nbsp;0</span>
								                                                        	</c:if>
								                                                        	<c:if test="${cLikeCount.likeCount ne 0 }">
								                                                        		<span>&nbsp;${cLikeCount.likeCount }</span>
								                                                        	</c:if>
							                                                        	</c:if>
							                                                        </c:forEach>
																				</div>
																			</div>
																			<c:if test="${!empty sessionScope.userId}">
																				<div class="btn">
																					<a href="/challenge/write.do?chalNo=${chalList.chalNo }">
																						<button>참여하기</button>
																					</a>
																				</div>
																			</c:if>
																		</div>
																	</div>
																</li>
															</c:if>
														</c:forEach>
													</ul>
												</div>
											</div>
										</div>
									</div>

									<div style="width:80%;margin:0 auto;">
										<div class="chal-title-write-box">
											<div class="chal-category-title">
												<h2 style="margin-bottom:15px;">개인 챌린지</h2>
											</div>
										</div>
										<div class="chal-list">
											<div class="scroll-container">
												<div class="chal-content">
													<ul>
														<c:forEach var="chalList" items="${cList}" begin="0"
															end="2">
															<c:if test="${chalList.chalUserId ne 'admin'}">
																<li>
																	<div>
																		<a
																			href="/challenge/info.do?chalNo=${chalList.chalNo }">
																			${chalList.chalTitle }
																			<div style="height: 175px;">
																				<img
																					src="/resources/chaluploadFiles/${chalList.chalFileRename}"
																					alt="챌린지 게시물 사진" class="chal-img">
																			</div>
																		</a>
																		<div class="chal-text-box">${chalList.chalContent }
																		</div>
																		<div class="chal-list-bottom">
																			<div>
																				<div class="user-icon-box">
																					<div class="chal-user-icon">
																						<img
																							src="/resources/images/challenge/board-icon3.png"
																							alt="게시물 아이콘">
																					</div>
																					<c:forEach var="cBoardCount" items="${cBoardCNT }">
							                                                        	<c:if test="${chalList.chalNo eq cBoardCount.chalNo }">
							                                                        		<span>&nbsp;${cBoardCount.boardCount }</span>
							                                                        	</c:if>
							                                                        </c:forEach>
																				</div>
																				<div class="like-icon-box">
																					<div class="chal-like-icon">
																						<img src="/resources/images/challenge/heart.png"
																							alt="좋아요 하트">
																					</div>
																					<c:forEach var="cLikeCount" items="${cLikeList }">
							                                                        	<c:if test="${chalList.chalNo eq cLikeCount.chalNo }">
								                                                        	<c:if test="${cLikeCount.likeCount eq 0 }">
								                                                        		<span>&nbsp;0</span>
								                                                        	</c:if>
								                                                        	<c:if test="${cLikeCount.likeCount ne 0 }">
								                                                        		<span>&nbsp;${cLikeCount.likeCount }</span>
								                                                        	</c:if>
							                                                        	</c:if>
							                                                        </c:forEach>
																				</div>
																			</div>
																			<c:if test="${!empty sessionScope.userId}">
																				<div class="btn">
																					<c:if
																						test="${sessionScope.userId eq chalList.chalUserId}">
																						<a
																							href="/challenge/write.do?chalNo=${chalList.chalNo }">
																							<button>작성하기</button>
																						</a>
																					</c:if>
																					<c:if
																						test="${sessionScope.userId ne chalList.chalUserId}">
																						<button
																							onclick="location.href='/challenge/pullChal.do?chalNo=${chalList.chalNo }'">가져가기</button>
																					</c:if>
																				</div>
																			</c:if>
																		</div>
																	</div>
																</li>
															</c:if>
														</c:forEach>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 공지 페이지 -->
							<div class="notice-container">
								<div class="notice-subject">
									<h2>공지 게시판</h2>
								</div>
								<table class="notice-table">
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
									<c:forEach var="notice" items="${nList }" begin="0" end="9">
										<tr>
											<td>${notice.noticeNo }</td>
											<c:url var="detailUrl" value="/notice/detail.do">
												<c:param name="noticeNo" value="${notice.noticeNo }" />
											</c:url>
											<td><a href="${detailUrl}">${notice.noticeTitle }</a></td>
											<td>${notice.noticeWriter }</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${notice.noticeCreateDate }" /></td>
											<td>${notice.noticeViewCount }</td>
										</tr>
									</c:forEach>
								</table>
								<div class="notice-paging"></div>
							</div>
						</div>
					</main>
				</div>
				<footer>
					<div>
						<jsp:include page="./include/mainFooter.jsp"></jsp:include>
					</div>
				</footer>
			</div>
		</div>
	</div>
</body>
</html>