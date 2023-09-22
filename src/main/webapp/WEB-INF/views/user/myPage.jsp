<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/resources/css/user/myPage.css">
        <link rel="stylesheet" href="/resources/css/user/myPage_Bae.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="/resources/css/challenge/challengeBoard.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- FullCalendar JavaScript -->
  		<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.0/main.min.js"></script>
  		<!-- FullCalendar CSS -->
  		<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.0/main.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="/resources/css/user/calender.css">
	    <script>
		    $(document).ready(function() {
				var bluewaveSlider = $("#bluewave-slider").bxSlider({
				    touchEnabled : (navigator.maxTouchPoints > 0)
				});
				
				var personalSlider = $("#personal-slider").bxSlider({
				    touchEnabled : (navigator.maxTouchPoints > 0)
				});
				
				var likeSlider = $("#like-slider").bxSlider({
				    touchEnabled : (navigator.maxTouchPoints > 0)
				});
				
				$(".slider").bxSlider();
			    
			    $("#bluewave-tab").click(function() {
			    	bluewaveSlider.reloadSlider();
			    });
			    
			    $("#personal-tab").click(function() {
			    	personalSlider.reloadSlider();
			    });
			    
			    $("#like-tab").click(function() {
			    	likeSlider.reloadSlider();
			    });
			});
	    </script>
	    <style>
	    				
			.chal-board-title-box {
				cursor: pointer;
			}
			
			.chal-board-title-box:hover {
				color: #4AA8D5;
			}
            
	    </style>
	    <!-- 챌린지 슬라이더 css -->
        <link rel="stylesheet" href="/resources/css/user/myPageChalSlider.css"> 
        <title>마이페이지</title>
    </head>
    <body>
    	<jsp:include page="/WEB-INF/views/include/navHeader.jsp"></jsp:include>
<!--         <header></header> -->
        <main>
            <section id="main-container">
				<div class="mini-container">
		            <div id="mypage-header">
		                <div id="profile-div">
		                    <img src="${ user.userProfilePath}" alt="">
		                </div>
		                <c:if test="${sessionScope.userId eq user.userId }">
		                	<div id="modify-btn-div">
				                <a href="/user/modify.do?userId=${sessionScope.userId }">
								    <img id="modify-btn" src="../resources/images/user/setting-icon.png" alt="설정 아이콘">
								</a>
		                	</div>
		                </c:if>
		                <div id="userInfo-div">
		                    <div>
		                        <div id="nickname">${user.userNickName }</div>
		                    </div>
		                    <div>
		                        <div>
		                            <span>
			                            <a class="sub" data-bs-toggle="modal" data-bs-target="#followingModal">팔로잉 ${ followingCnt }</a>&nbsp;&nbsp;|&nbsp;
			                            <a class="sub" data-bs-toggle="modal" data-bs-target="#followersModal">팔로워 ${ followersCnt }</a>
		                            </span>
		                        </div>   
	                        	<c:if test="${sessionScope.userId ne user.userId  && sessionScope.userId ne null }">
		                        	<div>
									    <c:url var="followUrl" value="/user/follow.do">
									        <c:param name="sTarget" value="${ user.userId }"></c:param>
									        <c:param name="sUser" value="${ sessionScope.userId }"></c:param>
									    </c:url>
<%-- 									    <c:url var="isFollowing" value="/user/myPage.do"> --%>
<%-- 									        <c:param name="following" value="${ user.userId }"></c:param> --%>
<%-- 									        <c:param name="follower" value="${ sessionScope.userId }"></c:param> --%>
<%-- 									    </c:url> --%>
									    <c:url var="unfollowUrl" value="/user/unfollow.do">
									        <c:param name="unSubTarget" value="${ user.userId }"></c:param>
									        <c:param name="unSubUser" value="${ sessionScope.userId }"></c:param>
									    </c:url>
									    <c:if test="${isFollowing eq 1 }">
									    	<button id="follow-btn" onclick="unfollowUser('${unfollowUrl}');">팔로우 해제</button>
									    </c:if>
									    <c:if test="${isFollowing eq 0}">
									    	<button id="follow-btn" onclick="followUser('${followUrl}');">팔로우</button>
									    </c:if>
<%-- 									   <c:choose> --%>
<%-- 									         <c:when test="${isFollowing}"> --%>
<%-- 									            <button id="follow-btn" onclick="unfollowUser('${unfollowUrl}');">팔로잉</button> --%>
<%-- 									        </c:when> --%>
<%-- 									        <c:otherwise> --%>
<%-- 									            <button id="follow-btn" onclick="followUser('${followUrl}');">팔로우</button> --%>
<%-- 									        </c:otherwise> --%>
<%-- 									    </c:choose> --%>
									</div>                      
	                        	</c:if>
		                    </div>
		                </div>
		                
		                <!-- 구독 모달창 -->
		                <!-- 팔로잉 -->
                        <div class="modal fade" id="followingModal" tabindex="-1" aria-labelledby="followingModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="followingModalLabel">${user.userNickName } 님의 팔로잉</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<c:forEach var="following" items="${ followingList }" varStatus="status">
											<c:url var="userPageUrl" value="/user/myPage.do">
												<c:param name="userId" value="${ following.userId }" />
											</c:url>
											<div onclick="showUserPage('${userPageUrl}');">
												<div class="sub-div">
													<img src="${ following.userProfilePath}" alt="팔로잉 프로필 이미지" class="sub-profile-img">
												</div>
												<div>
													${ following.userNickName }
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>              
						<!-- 팔로워 -->
                        <div class="modal fade" id="followersModal" tabindex="-1" aria-labelledby="followersModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="followersModalLabel">${user.userNickName } 님의 팔로워</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<c:forEach var="followers" items="${ followersList }" varStatus="status">
											<c:url var="userPageUrl" value="/user/myPage.do">
												<c:param name="userId" value="${ followers.userId }" />
											</c:url>
											<div onclick="showUserPage('${userPageUrl}');">
												<div class="sub-div">
													<img src="${ followers.userProfilePath}" alt="팔로워 프로필 이미지" class="sub-profile-img">
												</div>
												<div>
													${ followers.userNickName }
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>                   
		                
		                <div id="uiInfo-div">
		                    <div class="ui-item">
		                        <img class="ui-icon" src="../resources/images/user/b-chal-icon.png" alt="블루웨이브 챌린지">
		                        <span class="ui-text">${finishTotalBlueChalCount} / ${totalBlueChalCount }</span>
		                    </div>
		                    <div class="ui-item">
		                        <img class="ui-icon" src="../resources/images/user/p-chal-icon.png" alt="">
		                        <span class="ui-text">${finishTotalPersonalChalCount} / ${totalPersonalChalCount }</span>
		                    </div>
		                    <div class="ui-item">
		                        <img class="ui-icon" id="post-count-icon" src="../resources/images/user/board-icon.png" alt="">
		                        <span class="ui-text">${postCount }개</span>
		                    </div>
		                    <div class="ui-item">
		                        <img class="ui-icon" src="../resources/images/user/point-icon.png" alt="">
		                        <span class="ui-text">${totalPoint }p</span>
		                    </div>
		                </div>   
		                <c:if test="${sessionScope.userId eq user.userId }"> 
				            <img id="dot" src="../../resources/images/user/dot.png" onclick="toggleReportDiv()" alt="">
				            <div id="report-div" style="display: none;">
				                <div id="report-text" onclick="deleteUser()">탈퇴하기</div>
				            </div> 
				           </c:if>                      
		            </div>
		            <c:if test="${sessionScope.userId eq user.userId }"> 
			            <div id="chal">
			                <div id="blue-wave">
			                    <div class="calendar">
			                        <div id="calendar"></div>
			                    </div>
			                </div>
			                
			                <div id="todo-chal">
			                    <span id="todo-title"> <오늘의 챌린지> </span>
			                    <hr>
			                    	<c:if test="${ empty todayCList }">
				                   		<div id="c-list-none">챌린지 참여 이력이 없습니다</div>
				                   	</c:if>
				                   	<c:if test="${ !empty todayCList }">
				                    <c:forEach var="todayCList" items="${todayCList }" >
						                <c:set var="startDate" value="${ todayCList.chalStartDate }" />
									    <c:set var="endDate" value="${ todayCList.chalEndDate }" />
									    <c:set var="now" value="<%= new java.util.Date() %>" />
									    
									    <fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" var="startDateStr" />
									    <fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" var="endDateStr" />
									
									    <fmt:parseDate value="${startDateStr}" pattern="yyyy-MM-dd" var="startDateDate" />
									    <fmt:parseDate value="${endDateStr}" pattern="yyyy-MM-dd" var="endDateDate" />
									
										<!-- 오늘 - 시작일 -->												
										<c:set var="progressMillis" value="${now.time - startDateDate.time}" />
										<!-- 종료일 - 시작일 --> 
										<c:set var="totalMillis" value="${endDateDate.time - startDateDate.time}" />
										<!-- 밀리초를 일 단위로 변환 -->
										<c:set var="progressDays" value="${progressMillis / (1000 * 60 * 60 * 24)}" />
										<c:set var="totalDays" value="${totalMillis / (1000 * 60 * 60 * 24)}" />
										
								        <c:set var="progress" value="${(progressDays * 100) / totalDays}" />
			                    <table>
			                    <colgroup>
			                    	<col style="width:60%">
			                    	<col style="width:10%">
			                    	<col style="width:30%">
			                    </colgroup>
			                        <tr>
			                        	<th>
										    <c:set var="inputString" value="${todayCList.chalTitle}" /> <!-- todayCList.chalTitle 값을 inputString 변수에 저장 -->
										
										    <c:choose>
										        <c:when test="${fn:length(inputString) > 12}"> <!-- 만약 문자열 길이가 5를 초과한다면 -->
										            <c:set var="truncatedString" value="${fn:substring(inputString, 0, 12)}..." /> <!-- 문자열을 자르고 "..."을 추가하여 truncatedString 변수에 저장 -->
										            <c:out value="${truncatedString}" /> <!-- truncatedString을 출력 -->
										        </c:when>
										        <c:otherwise>
										            <c:out value="${inputString}" /> <!-- 그렇지 않으면 원래 문자열을 출력 -->
										        </c:otherwise>
										    </c:choose>
										</th>
										<td>
										    <c:choose>
										        <c:when test="${ endDate eq null }">
										        	<td style="letter-spacing: 6px;">
										            	<span id="zero-percent-text">기한없음</span>
										            <td>
										        </c:when>
										        <c:otherwise>
										            <span id="percent-text"><fmt:formatNumber value="${progress}" pattern="#" />%</span>
										        	<td>
													    <progress id="progress" value="<fmt:formatNumber value="${progress}" pattern="#" />" min="0" max="100"></progress>
													</td>
										        </c:otherwise>
										    </c:choose>
										</td>
			                        </tr>
			                    </table>
			                    </c:forEach>
			                   	</c:if>
			                </div>
			            </div>
			            <div id="list-count"><b>굿즈 목록</b> | ${goodsList.size() }개</div>
			            <c:if test="${ empty goodsList }">
	                   		<div class="list-none" style="height:180px">굿즈 교환 내역이 없습니다</div>
	                   	</c:if>
	                   	<c:if test="${ !empty goodsList }">
				            <div id="goods-img-div">
				                <div class="slider-container">
				                    <div class="slider1">
				                        <!-- 이곳에 추가 이미지를 슬라이드로 넣어줍니다. -->
				                        <c:forEach var="goods" items="${goodsList }" >
					                        <div class="slide">
					                    		<a href="/user/goods/detail.do?productNo=${goods.productNo }">
						                            <img src="${goods.productThumbnailPath }" alt=""> 
						                            <div class="goods-name-overlay">
						                                <div class="goods-name">${goods.productName }</div>
						                            </div>
					                    		</a>
					                        </div>
				                        </c:forEach>
				                    </div>
				                </div>                
				            </div>
				        </c:if>
           			</c:if>
		        </div>    
            		
                <section id="my-nav">
                    <div id="bluewave-tab" data-tab="bluewave-chal" style="background-color: rgb(45, 55, 71); color: white;" onclick="showTab('bluewave-tab');">블루웨이브 챌린지</div>
                    <div id="personal-tab" data-tab="personal-chal" onclick="showTab('personal-tab');">나의 챌린지</div>
                    <div id="like-tab" data-tab="like-chal" onclick="showTab('like-tab');">좋아요 게시물</div>
                </section>
                
                <!-- 블루웨이브 챌린지 -->
                <section id="bluewave-chal" class="chal-section">
                    <c:if test="${ !empty cWaveList }">
	                    <div id="bluewave-slider">
	                        <c:forEach var="chal" items="${ cWaveList }" varStatus="status">
	                        	<c:if test="${status.index % 4 == 0}">
						            <div class="chal-group">
						        </c:if>
	                        	<div class="chal-list">
	                                <!-- 챌린지 기간 -->
	                                <c:if test="${ chal.chalEndDate ne null }">
		                                <span class="chal-date">${ chal.chalStartDate } ~ ${ chal.chalEndDate }</span>                                
	                                </c:if>
	                                <c:if test="${ chal.chalEndDate eq null }">
		                                <span class="chal-date">${ chal.chalStartDate }</span>                                
	                                </c:if>
	                                <div class="chal-main-info">
	                                    <!-- 대표 이미지 -->
	                                    <c:if test="${ chal.chalFileRename ne null }">
	                                    	<img src="../resources/chaluploadFiles/${ chal.chalFileRename }" alt="챌린지 대표 이미지" class="chal-main-img">
	                                    </c:if>
	                                    <div>
	                                        <!-- 챌린지 명 -->
	                                        <div class="chal-title">
		                                        <c:set var="chalTitle" value="${ chal.chalTitle }" />
											
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
	                                        <!-- 챌린지 방법 설명 -->
	                                        <c:if test="${ chal.chalFileRename ne null }">
		                                        <div style="width: 170px">
			                                        <c:set var="chalContent" value="${ chal.chalContent }" />
												
												    <c:choose>
												        <c:when test="${fn:length(chalContent) > 50}">
												            <c:set var="chalContentTruncatedString" value="${fn:substring(chalContent, 0, 50)}..." />
												            <c:out value="${chalContentTruncatedString}" />
												        </c:when>
												        <c:otherwise>
												            <c:out value="${chalContent}" />
												        </c:otherwise>
												    </c:choose>
		                                        </div>                                    	
	                                    	</c:if>
	                                        <c:if test="${ chal.chalFileRename eq null }">
		                                        <div>
		                                        	<c:set var="chalContent" value="${ chal.chalContent }" />
												
												    <c:choose>
												        <c:when test="${fn:length(chalContent) > 50}">
												            <c:set var="chalContentTruncatedString" value="${fn:substring(chalContent, 0, 50)}..." />
												            <c:out value="${chalContentTruncatedString}" />
												        </c:when>
												        <c:otherwise>
												            <c:out value="${chalContent}" />
												        </c:otherwise>
												    </c:choose>
		                                        </div>                                    	
	                                    	</c:if>
	                                    </div>
	                                    <!-- 챌린지 세부 정보 이동 버튼 -->
	                                    <c:url var="userChalInfoUrl" value="/challenge/userChalInfo.do">
	                                   		<c:param name="chalNo" value="${ chal.chalNo }"></c:param>
	                                   		<c:param name="userId" value="${ user.userId }"></c:param>
	                                   	</c:url>
	                                    <button class="chal-details-btn" onclick="showChalInfo('${ userChalInfoUrl }');">
	                                        <span class="material-symbols-outlined">arrow_forward_ios</span>
	                                    </button>
	                                </div>
	                                <div class="chal-sub-info">
	                                    <div>
	                                        <!-- 참여 인원 수 -->
	                                        <div>
	                                            <img src="../resources/images/challenge/person.png" alt="참여 인원 수" width="20">
	                                            <span>&nbsp;
	                                            	<c:forEach var="people" items="${ cWPplList }" varStatus="pplStatus">
	                                            		<c:if test="${ chal.chalNo eq people.chalNo }">
	                                            			${ people.pplCount }
	                                            		</c:if>
	                                            	</c:forEach>
	                                            </span>
	                                        </div>
	                                        <!-- 총 좋아요 수 -->
	                                        <div>
	                                            <img src="../resources/images/challenge/heart.png" alt="총 좋아요 수" width="20">
	                                            <span>&nbsp;
	                                            	<c:forEach var="like" items="${ cWLikeList }" varStatus="likeStatus">
	                                            		<c:if test="${ chal.chalNo eq like.chalNo }">
	                                            			${ like.likeCount }
	                                            		</c:if>
	                                            	</c:forEach>
	                                            </span>
	                                        </div>
	                                    </div>
	                                    <div>
	                                        <!-- 진행률 -->
										    <c:set var="startDate" value="${ chal.chalStartDate }" />
										    <c:set var="endDate" value="${ chal.chalEndDate }" />
										    <c:set var="now" value="<%= new java.util.Date() %>" />
										    
										    <!-- 종료일이 존재하는 챌린지 -->
											<c:if test="${ endDate ne null }">
												<c:if test="${ fn:contains(chal.chalFinish, 'N') }">
												    <fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" var="startDateStr" />
												    <fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" var="endDateStr" />
												
												    <fmt:parseDate value="${startDateStr}" pattern="yyyy-MM-dd" var="startDateDate" />
												    <fmt:parseDate value="${endDateStr}" pattern="yyyy-MM-dd" var="endDateDate" />
												
													<!-- 오늘 - 시작일 -->												
													<c:set var="progressMillis" value="${now.time - startDateDate.time}" />
													<!-- 종료일 - 시작일 --> 
													<c:set var="totalMillis" value="${endDateDate.time - startDateDate.time}" />
													<!-- 밀리초를 일 단위로 변환 -->
													<c:set var="progressDays" value="${progressMillis / (1000 * 60 * 60 * 24)}" />
													<c:set var="totalDays" value="${totalMillis / (1000 * 60 * 60 * 24)}" />
													
											        <c:set var="progress" value="${(progressDays * 100) / totalDays}" />
											        
													<c:choose>
													    <c:when test="${progress <= 0}">
													    	<div class="chal-progress-before">
														        <em>대기 중..</em>												    	
													    	</div>
													    </c:when>
													    <c:otherwise>
														    <div class="chal-progress-ing">
														        <fmt:formatNumber value="${progress}" pattern="#.#" />%
														    </div>
													    </c:otherwise>
													</c:choose>
												</c:if>
												<c:if test="${ fn:contains(chal.chalFinish, 'Y') }">
													<div class="chal-progress-finish">
												        <b><em>완료</em></b>
											    	</div>
												</c:if>
											</c:if>
											
											<!-- 무기한 챌린지 -->
											<c:if test="${ endDate eq null }">
												<div class="chal-progress-none">
													<em>기한없음</em>
												</div>
											</c:if>
	
	                                        <!-- 나의 인증 횟수 -->
	                                        <div>
	                                            <c:forEach var="post" items="${ cPostCntList }" varStatus="postStatus">
                                            		<c:if test="${ chal.chalNo eq post.chalNo }">
                                            			${ post.postCount }회
                                            		</c:if>
                                            	</c:forEach>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
								<c:if test="${status.index % 4 == 3 or status.count == fn:length(cWaveList)}">
						            </div>
						        </c:if>  	
	                        </c:forEach>
	                    </div>
                    </c:if>
                    <c:if test="${ empty cWaveList }">
                    	<div class="list-none">블루웨이브 챌린지 참여 이력이 없습니다</div>
                    </c:if>
                </section>
                
                <!-- 나의 챌린지 -->
                <section id="personal-chal" class="chal-section" style="display: none;" >
                    <!-- 챌린지 리스트 -->
                    <c:if test="${ !empty cPersonalList }">
	                    <div id="personal-slider">
	                    	<c:if test="${sessionScope.userId ne user.userId }">
	                    		<c:set var="personalList" value="${ cOtherPersonalList }" />
	                        </c:if>
	                        <c:if test="${sessionScope.userId eq user.userId }">
	                        	<c:set var="personalList" value="${ cPersonalList }" />
	                        </c:if>
                        	<c:forEach var="chal" items="${ personalList }" varStatus="status">
	                        	<c:if test="${status.index % 4 == 0}">
						            <div class="chal-group">
						        </c:if>
		                        	<div class="chal-list">
		                        		<div>
			                                <!-- 챌린지 기간 -->
			                                <c:if test="${ chal.chalEndDate ne null }">
				                                <span class="chal-date">${ chal.chalStartDate } ~ ${ chal.chalEndDate }</span>                                
			                                </c:if>
			                                <c:if test="${ chal.chalEndDate eq null }">
				                                <span class="chal-date">${ chal.chalStartDate }</span>                                
			                                </c:if>
			                                <c:if test="${sessionScope.userId eq user.userId }">
			                                    <div>
<!-- 			                                    	<form action="/challenge/update.do" method="post" name="chalUpdateForm"> -->
<%-- 													    <input type="hidden" name="chalNo" value="${chal.chalNo}"> --%>
<%-- 													    <input type="hidden" name="userId" value="${sessionScope.userId}"> --%>
<!-- 													</form> -->
			                                    	<c:url var="updateUrl" value="/challenge/update.do">
			                                    		<c:param name="chalNo" value="${ chal.chalNo }"></c:param>
			                                    		<c:param name="userId" value="${ sessionScope.userId }"></c:param>
			                                    	</c:url>
			                                    	<c:url var="deleteUrl" value="/challenge/delete.do">
			                                    		<c:param name="chalNo" value="${ chal.chalNo }"></c:param>
			                                    		<c:param name="chalUserId" value="${ chal.chalUserId }"></c:param>
			                                    		<c:param name="userId" value="${ sessionScope.userId }"></c:param>
			                                    	</c:url>
<!-- 			                                        <a href="javascript:void(0)" class="edit-personal-chal" onclick="submitChalUpdateForm();">수정</a>&nbsp; -->
			                                        <a href="${ updateUrl }" class="edit-personal-chal">수정</a>&nbsp;
			                                        <a href="javascript:void(0)" class="edit-personal-chal" onclick="deleteMyChal('${ deleteUrl }');">삭제</a>
			                                    </div>
			                                </c:if>
		                                </div>
		                                <div class="chal-main-info">
		                                    <!-- 대표 이미지 -->
		                                    <c:if test="${ chal.chalFileRename ne null }">
		                                    	<img src="../resources/chaluploadFiles/${ chal.chalFileRename }" alt="챌린지 대표 이미지" class="chal-main-img">
		                                    </c:if>
		                                    <div>
		                                    	<!-- 챌린지 명 -->
		                                        <div class="chal-title">
		                                        	<!-- 비공개 챌린지일 경우 잠금 표시 -->
												    <c:if test="${fn:contains(chal.chalPublic, 'N')}">
												        <span class="material-symbols-outlined" style="font-size: 20px;">lock</span>
												    </c:if>
												    <c:set var="chalTitle" value="${ chal.chalTitle }" />
											
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
		
		                                        <!-- 챌린지 
 -->
		                                        <c:if test="${ chal.chalFileRename ne null }">
			                                        <div style="width: 170px">
				                                        <c:set var="chalContent" value="${ chal.chalContent }" />
												
													    <c:choose>
													        <c:when test="${fn:length(chalContent) > 50}">
													            <c:set var="chalContentTruncatedString" value="${fn:substring(chalContent, 0, 50)}..." />
													            <c:out value="${chalContentTruncatedString}" />
													        </c:when>
													        <c:otherwise>
													            <c:out value="${chalContent}" />
													        </c:otherwise>
													    </c:choose>
			                                        </div>                                    	
		                                    	</c:if>
		                                        <c:if test="${ chal.chalFileRename eq null }">
			                                        <div>
				                                        <c:set var="chalContent" value="${ chal.chalContent }" />
												
													    <c:choose>
													        <c:when test="${fn:length(chalContent) > 50}">
													            <c:set var="chalContentTruncatedString" value="${fn:substring(chalContent, 0, 50)}..." />
													            <c:out value="${chalContentTruncatedString}" />
													        </c:when>
													        <c:otherwise>
													            <c:out value="${chalContent}" />
													        </c:otherwise>
													    </c:choose>
			                                        </div>                                    	
		                                    	</c:if>
		                                    </div>
		                                    <!-- 챌린지 세부 정보 이동 버튼 -->
		                                    <c:url var="userChalInfoUrl" value="/challenge/userChalInfo.do">
		                                   		<c:param name="chalNo" value="${ chal.chalNo }"></c:param>
		                                   		<c:param name="userId" value="${ user.userId }"></c:param>
		                                   	</c:url>
		                                    <button class="chal-details-btn" onclick="showChalInfo('${ userChalInfoUrl }');">
		                                        <span class="material-symbols-outlined">arrow_forward_ios</span>
		                                    </button>
		                                </div>
		                                <div class="chal-sub-info">
		                                    <div>
		                                        <!-- 총 좋아요 수 -->
		                                        <div>
		                                        	<c:if test="${fn:contains(chal.chalPublic, 'Y')}">
		                                            <img src="../resources/images/challenge/heart.png" alt="" width="20">
		                                            <span>&nbsp;
			                                            <c:forEach var="like" items="${ cPLikeList }" varStatus="likeStatus">
		                                            		<c:if test="${ chal.chalNo eq like.chalNo }">
		                                            			${ like.likeCount }
		                                            		</c:if>
		                                            	</c:forEach>
		                                            </span>
		                                            </c:if>
		                                        </div>
		                                    </div>
		                                    <div>
		                                        <!-- 진행률 -->
											    <c:set var="startDate" value="${ chal.chalStartDate }" />
											    <c:set var="endDate" value="${ chal.chalEndDate }" />
											    <c:set var="now" value="<%= new java.util.Date() %>" />
											    
											    <!-- 종료일이 존재하는 챌린지 -->
												<c:if test="${ endDate ne null }">
													<c:if test="${ fn:contains(chal.chalFinish, 'N') }">
													    <fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" var="startDateStr" />
													    <fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" var="endDateStr" />
													
													    <fmt:parseDate value="${startDateStr}" pattern="yyyy-MM-dd" var="startDateDate" />
													    <fmt:parseDate value="${endDateStr}" pattern="yyyy-MM-dd" var="endDateDate" />
													
														<!-- 오늘 - 시작일 -->												
														<c:set var="progressMillis" value="${now.time - startDateDate.time}" />
														<!-- 종료일 - 시작일 --> 
														<c:set var="totalMillis" value="${endDateDate.time - startDateDate.time}" />
														<!-- 밀리초를 일 단위로 변환 -->
														<c:set var="progressDays" value="${progressMillis / (1000 * 60 * 60 * 24)}" />
														<c:set var="totalDays" value="${totalMillis / (1000 * 60 * 60 * 24)}" />
														
												        <c:set var="progress" value="${(progressDays * 100) / totalDays}" />
												        
														<c:choose>
														    <c:when test="${progress <= 0}">
														    	<div class="chal-progress-before">
															        <em>대기 중..</em>												    	
														    	</div>
														    </c:when>
														    <c:otherwise>
															    <div class="chal-progress-ing">
															        <fmt:formatNumber value="${progress}" pattern="#.#" />%
															    </div>
														    </c:otherwise>
														</c:choose>
													</c:if>
													<c:if test="${ fn:contains(chal.chalFinish, 'Y') }">
														<div class="chal-progress-finish">
													        <b><em>완료</em></b>
												    	</div>
													</c:if>
												</c:if>
												
												<!-- 무기한 챌린지 -->
												<c:if test="${ endDate eq null }">
													<div class="chal-progress-none">
														<em>기한없음</em>
													</div>
												</c:if>
												
												<!-- 나의 인증 횟수 -->
												<div>
												    <c:set var="found" value="false" />
												    <c:forEach var="post" items="${cPostCntList}" varStatus="postStatus">
												        <c:if test="${not found}">
												            <c:choose>
												                <c:when test="${chal.chalNo eq post.chalNo}">
												                    ${post.postCount }회
												                    <c:set var="found" value="true" />
												                </c:when>
												                <c:otherwise>
												                    <c:set var="found" value="false" />
												                </c:otherwise>
												            </c:choose>
												        </c:if>
												    </c:forEach>
												    <c:if test="${not found}">
												        0회
												    </c:if>
												</div>
		                                    </div>
		                                </div>
		                            </div>
	                            <c:if test="${status.index % 4 == 3 or status.count == fn:length(cPersonalList)}">
						            </div>
						        </c:if>  
	                        </c:forEach>
	                    </div>
                    </c:if>
                    <c:if test="${ empty cPersonalList }">
                    	<div class="list-none">개인 챌린지 참여 이력이 없습니다</div>
                    </c:if>
                </section>

                <!-- 좋아요 게시물 -->
                <section id="like-chal" class="chal-section" style="display: none;">
                	<c:if test="${ !empty cBLikePostList }">
	                	<div id="like-slider">
	                        <c:forEach var="likePost" items="${ cBLikePostList }" varStatus="status">
	                        	<c:if test="${status.index % 9 == 0}">
						            <div class="like-group">
						        </c:if>
				                    <div class="like-image-container" data-bs-toggle="modal" data-bs-target="#likePostModal${status.count }">
			                            <img src="../resources/cuploadFiles/${ likePost.cBoardFileRename }" alt="좋아요 게시물" class="like-img" width="140px" height="160px">
			                            <div class="image-text" >
			                                <span class="material-symbols-outlined" style="font-size: 1.1em;">
			                                    favorite
			                                </span>
			                                &nbsp;
			                                <c:forEach var="like" items="${ cBLikeCntList }" varStatus="likeStatus">
                                           		<c:if test="${ likePost.cBoardNo eq like.cBoardNo }">
                                           			${ like.likeCnt }
                                           		</c:if>
                                           	</c:forEach>
			                            </div>
				                    </div>
			                    <c:if test="${status.index % 9 == 8 or status.count == fn:length('${ cBLikePostList }') }">
						            </div>
						        </c:if> 
		                	</c:forEach>
		                </div>
		            </c:if>
		            <c:if test="${ empty cBLikePostList }">
                    	<div class="list-none">좋아요 이력이 없습니다</div>
                    </c:if>
            	</section>
            	
            	<!-- 좋아요 게시물 모달 -->
            	<c:forEach var="likePost" items="${ cBLikePostList }" varStatus="status">
	            	<div class="modal fade" id="likePostModal${status.count }" tabindex="-1" aria-labelledby="likePostModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="likePostModalLabel">
										<c:forEach var="chal" items="${ allChalList }">
											<c:if test="${ chal.chalNo eq likePost.chalNo }">
												<c:if test="${chal.chalUserId eq 'admin' }">블루웨이브 챌린지</c:if>
												<c:if test="${chal.chalUserId ne 'admin' }">개인 챌린지</c:if>
											</c:if>
										</c:forEach>
									</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body"  style="padding:45px; padding-top: 20px;">
									<div id="container-modal">
										<div class="main-modal">
											<section id="top-section">
												<div id="user-info">
													<c:forEach var="chal" items="${ allChalList }">
														<c:if test="${ chal.chalNo eq likePost.chalNo }">
															<c:if test="${chal.chalUserId ne 'admin' }">
																<div class="user-info-box">
																	<c:forEach var="user" items="${ allUserList }">
																		<c:if test="${ user.userId eq likePost.cBoardWriter }">
																			<div class="user-info" onclick="location.href='/user/myPage.do?userId=${ user.userId }'">
																				<div class="user-img-box">
																					<img alt="프로필 사진" src="/resources/PuploadFiles/${user.userProfileRename }">
																				</div>
																				<div class="user-nickname-box">
																					<h1>${user.userNickName}</h1>
																				</div>
																			</div>
																		</c:if>
																	</c:forEach>
																</div>
															</c:if>
															<c:if test="${chal.chalUserId eq 'admin' }">
																<div class="user-info-box">
																	<div class="user-nickname-box">
																		<h1>관리자</h1>
																	</div>
																</div>
															</c:if>
														</c:if>
													</c:forEach>
												</div>
											</section>
											<div id="chal-info">
												<p> </p>
											</div>
											<section id="mid-section">
												<div class="top-box">
													<div class="chal-board-title-box" onclick="location.href='/challenge/info.do?chalNo=${likePost.chalNo}'">
														<h2>${likePost.cBoardTitle }</h2>
													</div>
													<div class="chal-board-tag-box">
														<c:if test="${sessionScope.userId eq likePost.cBoardWriter }">
															<c:url var="delCBUrl" value="/challenge/cbDelete.do">
															   <c:param name="cBoardNo" value="${likePost.cBoardNo }"></c:param>
															</c:url>
															<a href="/challenge/cbUpdate.do?cBoardNo=${likePost.cBoardNo }">수정하기</a> / <a href="/challenge/cbDelete.do?cBoardNo=${likePost.cBoardNo }">삭제하기</a>
														</c:if>
													</div>
												</div>
												<div class="mid-box">
													<img alt="챌린지 게시물 업로드 사진" src="/resources/cuploadFiles/${likePost.cBoardFileRename }">
													<p>${likePost.cBoardContent}</p>
												</div>
											</section>
											<hr>
											<section id="bottom-section">
													<c:forEach var="like" items="${ cBLikeCntList }" varStatus="likeStatus">
													    <c:if test="${likePost.cBoardNo eq like.cBoardNo}">
													    	<c:if test="${ sessionScope.userId eq liskPost.cBoardWriter }">
														    	<div class="like-btn-box"  onclick="myPost();">
														    		<img alt="빈 하트 아이콘" src="/resources/images/heart.png">
														    		<h5>${cBoardLikeCNT.cBoardLikeCount}</h5>
													    		</div>
													    	</c:if>
													    	<c:if test="${ sessionScope.userId ne liskPost.cBoardWriter }">
													    		<div class="like-btn-box">
															    	<c:url var="myLikeUrl" value="/challenge/myLike.do">
															    		<c:param name="chalNo" value="${likePost.chalNo}"></c:param>
															    		<c:param name="userId" value="${user.userId}"></c:param>
															    		<c:param name="cBoardNo" value="${likePost.cBoardNo}"></c:param>
															    	</c:url>
															        <a href="${ myLikeUrl }">
															            <c:set var="liked" value="false" />
															            <c:forEach var="isLiked" items="${isLiked}">
															                <c:if test="${isLiked.cBoardNo eq likePost.cBoardNo}">
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
						                                           		<c:if test="${ likePost.cBoardNo eq like.cBoardNo }">
						                                           			<h5>${ like.likeCnt }</h5>
						                                           		</c:if>
															        </a>
															    </div>
													        </c:if>
													    </c:if>
													</c:forEach>
											</section>
										</div>
									</div>
								</div>
<!-- 								<div class="modal-footer"> -->
<!-- 									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button> -->
<!-- 								</div> -->
							</div>
						</div>
					</div>
            	</c:forEach>
            </section>
        </main>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
<!--         <footer></footer> -->

	    <script>
	        // // 프로그레스 바 엘리먼트 선택
	        // const progressBar = document.querySelector(".progress-fill");
	
	        // // 진행 상태 설정 (60%로 설정)
	        // const progress = 60;
	
	        // // 프로그레스 바 업데이트
	        // progressBar.style.width = `${progress}%`;
	        function toggleReportDiv() {
	            var reportDiv = document.getElementById("report-div");
	
	            if (reportDiv.style.display === "none" || reportDiv.style.display === "") {
	                reportDiv.style.display = "block";
	            } else {
	                reportDiv.style.display = "none";
	            }
	        }
	        
	        $(document).ready(function(){
	        $('.slider1').bxSlider({
	        slideWidth: 215,
	        minSlides: 2,
	        maxSlides: 4,
	        slideMargin: 20
	        });
	    });
	       
	    </script>
<!-- // 	        캘린더 ************************ -->
	

		<script>
		  document.addEventListener("DOMContentLoaded", function () {
		    var calendarEl = document.getElementById("calendar");
		
		    // FullCalendar 이벤트 배열 생성
		    var events = [];
		
		    // calDateList를 순회하면서 이벤트 객체 생성 및 배열에 추가
		    <c:forEach var="dateData" items="${calDateList}">
		      var year = ${dateData.YEAR};
		      var month = ${dateData.MONTH};
		      var day = ${dateData.DAY};
		
		      // 이벤트 객체 생성
		      var event = {
		        title: "chal", // 이벤트 제목 설정
		        start: new Date(year, month - 1, day), // 이벤트 시작 날짜 설정
		        backgroundColor: "blue", // 이벤트 배경색 설정
		      };
		
		      // 이벤트 배열에 추가
		      events.push(event);
		    </c:forEach>
		
		    // FullCalendar 초기화 및 이벤트 표시
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      initialView: "dayGridMonth", // 월별 뷰
		      events: events // 생성한 이벤트 배열을 events 옵션에 전달
		    });
		
		    calendar.render();
		  });
		</script>
		<script>
		    document.addEventListener("DOMContentLoaded", function () {
		        var progress = ${progress};
		
		        var colElements = document.querySelectorAll("table col");
		        if (progress === null) {
		            colElements[0].style.width = "60%";
		            colElements[1].style.width = "40%";
		        } else {
		            colElements[0].style.width = "60%";
		            colElements[1].style.width = "10%";
		            colElements[2].style.width = "30%";
		        }
		    });
		</script>
		
	    <script>
	    	function showUserPage(userPageUrl){
				location.href = userPageUrl;
	    	}
	    	
	    	function followUser(followUrl){
				location.href = followUrl;
	    	}
	    	function unfollowUser(unfollowUrl){
				location.href = unfollowUrl;
	    	}
	    </script>
        <script>
            var tabs = document.querySelectorAll('#my-nav > div');
            var tabContents = document.querySelectorAll('.chal-section');

            function showTab(tabId) {
                // 모든 탭 초기화
                tabs.forEach(function(tab) {
                    tab.style.backgroundColor = 'transparent';
                    tab.style.color = 'black';
                });

                // 선택된 탭 스타일 적용
                var selectedTab = document.getElementById(tabId);
                selectedTab.style.backgroundColor = 'rgb(45, 55, 71)';
                selectedTab.style.color = 'white';

                // 모든 콘텐츠 숨김
                tabContents.forEach(function(content) {
                    content.style.display = 'none';
                });

                // 선택된 탭 콘텐츠 보임
                var contentId = selectedTab.getAttribute('data-tab');
                document.getElementById(contentId).style.display = 'block';
            }

            // 초기 탭 설정
            showTab('bluewave-tab');
        </script>
        <script>
        	function showChalInfo(userChalInfoUrl) {
				location.href = userChalInfoUrl;
			}
        </script>
        <script>
			function submitChalUpdateForm() {
			    document.chalUpdateForm.submit();
			}
		</script>
		<script>
			function myPost() {
				alert("자신의 게시물에는 좋아요를 누를 수 없습니다.");
			}
		</script>
        <script>
            function deleteMyChal(deleteUrl) {
                if(confirm("삭제한 챌린지 정보는 복구되지 않습니다(인증 게시물 포함). 정말 삭제하시겠습니까?")){
                	location.href = deleteUrl;
                }
            }
            function deleteUser() {
                if(confirm("탈퇴한 유저 정보는 복구되지 않습니다. 정말 탈퇴하시겠습니까?")){
                	location.href = "/user/delete.do?userId=${user.userId}";
                }
            }
            function toggleReportDiv() {
                var reportDiv = document.getElementById("report-div");
                if (reportDiv.style.display === "none" || reportDiv.style.display === "") {
                    reportDiv.style.display = "block";
                } else {
                    reportDiv.style.display = "none";
                }
            }
        </script>
       
    </body>
</html>