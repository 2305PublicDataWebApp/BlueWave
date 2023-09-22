<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>챌린지 페이지</title>
		<!-- 리셋 css -->
		<link rel="stylesheet" href="/resources/css/reset/reset.css">
		<!-- 페이지 css -->
		<link rel="stylesheet" href="/resources/css/challenge/challengePage.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
		<header>

        </header>
        <jsp:include page="/WEB-INF/views/include/navHeader.jsp" />
        <main>
            <div id="container">
                <section id="up-section">
                	<div class="chal-title-search-box">
	                    <div class="chal-category-title">
	                        <h2>블루웨이브 챌린지</h2>
	                    </div>
	                    
	                    <div class="chal-search-box">
	                    	<form action="/challenge/search.do" method="get">
	                    		<select name="searchCondition" class="search-form">
	                    			<option value="all">전체</option>
	                    			<option value="title">제목</option>
	                    			<option value="content">내용</option>
	                    		</select>
		                    	<input type="text" name="searchKeyword" class="search-form" style="padding-left: 15px;" placeholder="검색어를 입력해주세요.">
		                    	<div class="btn">
									<button style="width: 70px; height: 28px;">검색</button>
		                    	</div>
	                    	</form>
	                    </div>
                	</div>

                    <div class="chal-list">
                        <div class="scroll-container">
                            <div class="chal-content">
                                <ul>
                                	
                                	<c:forEach var="chalList" items="${cList}">
                                		<c:if test="${chalList.chalUserId eq 'admin'}">
		                                    <li>
		                                        <div>
		                                            <a href="/challenge/info.do?chalNo=${chalList.chalNo }">
		                                                <div class="chal-title-div">
		                                                	<c:set var="chalTitle" value="${chalList.chalTitle }" />
												
														    <c:choose>
														        <c:when test="${fn:length(chalTitle) > 15}">
														            <c:set var="chalTitleTruncatedString" value="${fn:substring(chalTitle, 0, 15)}..." />
														            <c:out value="${chalTitleTruncatedString}" />
														        </c:when>
														        <c:otherwise>
														            <c:out value="${chalTitle}" />
														        </c:otherwise>
														    </c:choose>
		                                                </div>
		                                                <div style="height: 175px;">
		                                                	<img src="../resources/chaluploadFiles/${chalList.chalFileRename}" alt="챌린지 게시물 사진" class="chal-img">
		                                                </div>
		                                            </a>
		                                            <div class="chal-text-box">
		                                                ${chalList.chalContent }
		                                            </div>
		                                            <div class="chal-list-bottom">
		                                                <div>
		                                                    <div  class="user-icon-box">
		                                                        <div class="chal-user-icon">
		                                                        	<img src="/resources/images/challenge/board-icon3.png" alt="게시물 아이콘">
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
		                                                        	<img src="/resources/images/challenge/heart.png" alt="좋아요 아이콘">
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
		                                                <div class="btn">
			                                                <a href="/challenge/write.do?chalNo=${chalList.chalNo }">
			                                                    <button>참여하기</button>
			                                                </a>	
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

                <section id="down-section">
                    <div class="chal-title-write-box">
	                    <div class="chal-category-title">
	                        <h2>개인 챌린지</h2>
	                    </div>
                        <div id="new-chal-btn" class="btn"  style="padding-right: 35px !important;">
                            <button onclick="showChallengeWrite();">챌린지 생성</button>
                        </div>
                    </div>


                    <div class="chal-list">
                        <div class="scroll-container">
                            <div class="chal-content">
                                <ul>
                                
                                	<c:forEach var="chalList" items="${cList}">
                                		<c:if test="${chalList.chalUserId ne 'admin'}">
		                                    <li>
		                                        <div>
		                                            <a href="/challenge/info.do?chalNo=${chalList.chalNo }">
		                                                <div class="chal-title-div">
			                                                <c:set var="chalTitle" value="${chalList.chalTitle }" />
												
														    <c:choose>
														        <c:when test="${fn:length(chalTitle) > 15}">
														            <c:set var="chalTitleTruncatedString" value="${fn:substring(chalTitle, 0, 15)}..." />
														            <c:out value="${chalTitleTruncatedString}" />
														        </c:when>
														        <c:otherwise>
														            <c:out value="${chalTitle}" />
														        </c:otherwise>
														    </c:choose>
		                                                </div>
		                                                <div style="height: 175px;">
		                                                	<img src="/resources/chaluploadFiles/${chalList.chalFileRename}" alt="챌린지 게시물 사진" class="chal-img">
		                                                </div>
		                                            </a>
		                                            <div class="chal-text-box">
		                                                ${chalList.chalContent }
		                                            </div>
		                                            <div class="chal-list-bottom">
		                                                <div>
		                                                    <div  class="user-icon-box">
		                                                        <div class="chal-user-icon">
		                                                        	<img src="/resources/images/challenge/board-icon3.png" alt="게시물 아이콘">
		                                                        </div>
		                                                        <c:forEach var="cBoardCount" items="${cBoardCNT }">
		                                                        	<c:if test="${chalList.chalNo eq cBoardCount.chalNo }">
		                                                        		<span>&nbsp;${cBoardCount.boardCount }</span>
		                                                        	</c:if>
		                                                        </c:forEach>
		                                                    </div>
		                                                    <div class="like-icon-box">
		                                                        <div class="chal-like-icon">
		                                                        	<img src="/resources/images/challenge/heart.png" alt="좋아요 하트">
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
		                                                <div class="btn">
		                                                	<c:if test="${sessionScope.userId eq chalList.chalUserId}">
		                                                		<a href="/challenge/write.do?chalNo=${chalList.chalNo }">
		                                                			<button>작성하기</button>
		                                                		</a>
		                                                	</c:if>
		                                                    <c:if test="${sessionScope.userId ne chalList.chalUserId}">
		                                                		<button onclick="location.href='/challenge/pullChal.do?chalNo=${chalList.chalNo }'">가져가기</button>
		                                                	</c:if>
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

        <footer>
        	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        </footer>

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
        
        function showChallengeWrite() {
        	const url = "/challenge/create.do";
        	location.href = url;
        	
        }
        </script>

	</body>
</html>