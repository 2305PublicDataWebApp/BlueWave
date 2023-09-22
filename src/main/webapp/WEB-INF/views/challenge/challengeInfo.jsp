<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>챌린지 세부정보</title>
		<!-- 리셋 css -->
		<link rel="stylesheet" href="/resources/css/reset/reset.css">
		
		<!-- 페이지 css -->
		<link rel="stylesheet" href="/resources/css/challenge/challengeInfo.css">
		<link rel="stylesheet" href="/resources/css/challenge/challengeBoard.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
		
		<!-- 모달 -->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	</head>
<body>
	<!-- 인클루드 자리 -->
	<jsp:include page="/WEB-INF/views/include/navHeader.jsp" />
	<main>
		<div id="container">
			<section id="up-section">

				<div id="chal-img-box">
					<img src="/resources/chaluploadFiles/${cOne.chalFileRename}" alt="챌린지 사진">
				</div>

				<div id="chal-title-box">
					<div id="chal-title">
						<strong> ${cOne.chalTitle } </strong>
					</div>
					<div id="chal-info-box">
						<p>${cOne.chalContent }</p>
					</div>
				</div>


				<div id="btn-report-box">
					<div id="btn-box" class="btn-design">
						<c:if test="${cOne.chalUserId ne 'admin' }">
							<c:if test="${sessionScope.userId eq cOne.chalUserId }">
		                        <a href="/challenge/write.do?chalNo=${cOne.chalNo }">
		                        	<button>작성하기</button>
		                        </a>
							</c:if>
							<c:if test="${sessionScope.userId ne cOne.chalUserId }">
								<button onclick="location.href='/challenge/pullChal.do?chalNo=${cOne.chalNo }'">가져가기</button>											
							</c:if>	
						</c:if>
						<c:if test="${cOne.chalUserId eq 'admin' }">
							<a href="/challenge/write.do?chalNo=${cOne.chalNo }">
		                        	<button>작성하기</button>
                        	</a>
						</c:if>
					</div>
					<div id="report-box" class="btn-design">
					</div>
					<div class="update-delete-box">
						<c:if test="${sessionScope.userId eq cOne.chalUserId }">
							<c:url var="updateUrl" value="/challenge/update.do">
							   <c:param name="chalNo" value="${ cOne.chalNo }"></c:param>
							   <c:param name="userId" value="${ sessionScope.userId }"></c:param>
							</c:url>
							<c:url var="deleteUrl" value="/challenge/delete.do">
							   <c:param name="chalNo" value="${ cOne.chalNo }"></c:param>
							   <c:param name="chalUserId" value="${ cOne.chalUserId }"></c:param>
							   <c:param name="userId" value="${ sessionScope.userId }"></c:param>
							</c:url>
							<a href="${ updateUrl }" class="edit-personal-chal">수정하기</a> / <a href="javascript:void(0)" class="edit-personal-chal" onclick="deleteMyChal('${ deleteUrl }');">삭제하기</a>
						</c:if>
					</div>
				</div>

			</section>

			<section id="down-section" class="chal-section">
								
				<c:forEach var="cBoard" items="${cList }" varStatus="i">
					<c:set var="post" value="${cBoard.cBoardFileRename }"></c:set>
						<div class="like-image-container" data-bs-toggle="modal" data-bs-target="#chalBoardModal${i.count }">
							<img src="/resources/cuploadFiles/${cBoard.cBoardFileRename}" alt="챌린지 게시물 사진" class="like-img"
								width="180px" height="200px">
							<div class="image-text">
								<c:forEach var="cBoardLikeCNT" items="${cBoardLikeCNT }">
									<c:if test="${cBoard.cBoardNo eq cBoardLikeCNT.cBoardNo }">
										<span class="material-symbols-outlined" style="font-size: 1.1em;">
											favorite </span> &nbsp;${cBoardLikeCNT.cBoardLikeCount }
									</c:if>
								</c:forEach>
							</div>
						</div>
						
				<!-- Modal -->
				<div class="modal fade" id="chalBoardModal${i.count }" tabindex="-1"
					aria-labelledby="chalBoardModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="chalBoardModalLabel">
									<c:if test="${cOne.chalUserId eq 'admin' }">블루웨이브 챌린지</c:if>
									<c:if test="${cOne.chalUserId ne 'admin' }">개인 챌린지</c:if>
								</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">

								<div id="container-modal">
									<div class="main-modal">
										<section id="top-section">
											<div id="user-info">
												<c:if test="${cOne.chalUserId ne 'admin' }">
													<div class="user-info-box">
														<div class="user-img-box">
															<img alt="프로필 사진" src="/resources/PuploadFiles/${uOne.userProfileRename }">
														</div>
														<div class="user-nickname-box">
															<h1>${uOne.userNickName}</h1>
														</div>
														<div class="user-subscribe-box">
															<c:if test="${sessionScope.userId ne uOne.userId }">
																<button>구독하기</button>
															</c:if>
														</div>
													</div>
												<div class="report-board-box">

												</div>
												</c:if>
												<c:if test="${cOne.chalUserId eq 'admin' }">
													<div class="user-info-box">
														<c:forEach var="user" items="${user }">
															<c:if test="${cBoard.cBoardWriter eq user.userId }">
																<div class="user-img-box">
																	<img alt="프로필 사진" src="/resources/PuploadFiles/${user.userProfileRename }">
																</div>
																<div class="user-nickname-box">
																	<h1>${user.userNickName }</h1>
																</div>
															</c:if>
														</c:forEach>
													</div>
													<div class="report-board-box">
													</div>
												</c:if>
											</div>
										</section>
										<div id="chal-info">
											<p> </p>
										</div>
										<section id="mid-section">
											<div class="top-box">
												<div class="chal-board-title-box">
													<h2>${cBoard.cBoardTitle }</h2>
												</div>
												<div class="chal-board-tag-box">
													<c:if test="${sessionScope.userId eq cBoard.cBoardWriter }">
														<c:url var="delCBUrl" value="/challenge/cbDelete.do">
														   <c:param name="cBoardNo" value="${cBoard.cBoardNo }"></c:param>
														</c:url>
														<a href="/challenge/cbUpdate.do?cBoardNo=${cBoard.cBoardNo }">수정하기</a> / <a href="/challenge/cbDelete.do?cBoardNo=${cBoard.cBoardNo }">삭제하기</a>
													</c:if>
												</div>
											</div>
											<div class="mid-box">
												<img alt="챌린지 게시물 업로드 사진" src="/resources/cuploadFiles/${cBoard.cBoardFileRename }">
												<p>${cBoard.cBoardContent}</p>
											</div>
										</section>
										<section id="bottom-section">
											<div class="like-btn-box">
											<c:forEach var="cBoardLikeCNT" items="${cBoardLikeCNT}">
											    <c:if test="${cBoard.cBoardNo eq cBoardLikeCNT.cBoardNo}">
											        <a href="/challenge/like.do?chalNo=${cBoard.chalNo}&userId=${sessionScope.userId}&cBoardNo=${cBoard.cBoardNo}">
											            <c:set var="liked" value="false" />
											            <c:forEach var="isLiked" items="${isLiked}">
											                <c:if test="${isLiked.cBoardNo eq cBoard.cBoardNo}">
											                    <c:set var="liked" value="true" />
											                </c:if>
											            </c:forEach>
											            <c:choose>
											                <c:when test="${liked}">
											                    <img alt="꽉 찬 하트 아이콘" src="/resources/images/colored-heart.png">
											                </c:when>
											                <c:otherwise>
											                    <img alt="빈 하트 아이콘" src="/resources/images/heart.png">
											                </c:otherwise>
											            </c:choose>
											            <h4>좋아요 ${cBoardLikeCNT.cBoardLikeCount}개</h4>
											        </a>
											    </c:if>
											</c:forEach>
											<input type="hidden" value="${msg }" id="msg">
											</div>
										</section>
									</div>
								</div>
							</div>
							
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				
			
				

			</section>
		</div>
	</main>
	
	<script>
	    function deleteMyChal(deleteUrl) {
	        if(confirm("삭제한 챌린지 정보는 복구되지 않습니다(인증 게시물 포함). 정말 삭제하시겠습니까?")){
	        	location.href = deleteUrl;
	        }
	    };
	    
	    function deleteCBoard(delCBUrl) {
	    	if(confirm("삭제한 챌린지 게시물은 복구되지 않습니다. 정말 삭제하시겠습니까?")) {
	    		location.href = delCBUrl;
	    	}
	    };
	</script>
</body>
</html>