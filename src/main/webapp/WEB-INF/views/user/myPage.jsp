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
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- FullCalendar JavaScript -->
  		<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.0/main.min.js"></script>
  		<!-- FullCalendar CSS -->
  		<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.0/main.min.css" rel="stylesheet" />
	    <style>
		    /* 선택한 날짜의 스타일 */
		    .selected-day {
		      background-color: #3788d8; /* 선택한 날짜의 배경색을 파란색으로 설정 */
		      color: white; /* 선택한 날짜의 텍스트 색상 설정 (예: 흰색) */
		    }
			.fc-daygrid-dot-event{
				flex-direction: column
			}
			.fc-event-time, .fc-event-title{
				display: none;
			}
			.fc-daygrid-day-top {
				height: 15px;
			}
			.fc-daygrid-event-dot {
				border : none;
				width: 25px;
    			height: 20px;
    			background-color: #3788d8;
			}
			.fc-toolbar-chunk button {
				display: none;
			}
			.fc-daygrid-day-number {
				font-size : 13px;
				color : rgb(188,188,188);
			}
			.fc-col-header-cell-cushion {
				color : rgb(224,230,234);
			} 
			fc-toolbar-chunk button:first-child{
				display: none;
			}
			
			.fc .fc-toolbar.fc-header-toolbar {
			    margin-bottom: 1em;
			}
		    
		    .fc-header-toolbar > .fc-toolbar-chunk:last-child > button {
		    	display: none;
		    }
		  </style>
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
		                <a href="/user/modify.do?userId=${sessionScope.userId }">
						    <img src="../resources/images/user/설정아이콘.png" alt="설정 아이콘">
						</a>
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
	                        	<c:if test="${sessionScope.userId ne user.userId }">
		                        	<div>
		                        		<a href="/user/follow.do?userId=${user.userId}">
										  <button>버튼 텍스트</button>
										</a>
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
													<c:if test="${ following.userProfileName ne null}">
														<img src="${ following.userProfilePath}" alt="팔로잉 프로필 이미지" class="sub-profile-img">
													</c:if>
													<c:if test="${ following.userProfileName eq null}">
														<img src="../../resources/images/user/프로필이미지.png" alt="기본 프로필 이미지" class="sub-profile-img">
													</c:if>
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
													<c:if test="${ followers.userProfileName ne null}">
														<img src="${ followers.userProfilePath}" alt="팔로워 프로필 이미지" class="sub-profile-img">
													</c:if>
													<c:if test="${ followers.userProfileName eq null}">
														<img src="../../resources/images/user/프로필이미지.png" alt="기본 프로필 이미지" class="sub-profile-img">
													</c:if>
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
		                        <img class="ui-icon" src="../resources/images/user/공식(달성,진행)아이콘.png" alt="">
		                        <span class="ui-text">${finishTotalBlueChalCount} / ${totalBlueChalCount }</span>
		                    </div>
		                    <div class="ui-item">
		                        <img class="ui-icon" src="../resources/images/user/개인(달성,진행)아이콘.png" alt="">
		                        <span class="ui-text">${finishTotalPersonalChalCount} / ${totalPersonalChalCount }</span>
		                    </div>
		                    <div class="ui-item">
		                        <img class="ui-icon" id="post-count-icon" src="../resources/images/user/게시물아이콘.png" alt="">
		                        <span class="ui-text">${postCount }개</span>
		                    </div>
		                    <div class="ui-item">
		                        <img class="ui-icon" src="../resources/images/user/포인트아이콘.png" alt="">
		                        <span class="ui-text">${totalPoint }p</span>
		                    </div>
		                </div>                         
		            </div>
		            <c:if test="${sessionScope.userId ne user.userId }"> 
		            <img id="dot" src="../../resources/images/dot.png" onclick="toggleReportDiv()" alt="">
		            <div id="report-div" style="display: none;">
		                <div id="report-img-div"><img id="report-img" src="../resources/images/user/경고아이콘.png" alt=""></div>
		                <div id="report-text">신고하기</div>
		            </div> 
		            </c:if>
		            <c:if test="${sessionScope.userId eq user.userId }"> 
		            <div id="chal">
		                <div id="blue-wave">
		                    <div class="calendar">
		                        <div id="calendar"></div>
		                    </div>
		                </div>
		                
		                <div id="todo-chal">
		                    <span id="todo-title"> <오늘의 챌린지> </span>
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
		                    <hr>
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
									            <c:set var="truncatedString" value="${fn:substring(inputString, 0, 5)}..." /> <!-- 문자열을 자르고 "..."을 추가하여 truncatedString 변수에 저장 -->
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
									            	<span id="0percent-text">기한없음</span>
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
		                    <hr>
		                </div>
		            </div>
		            <c:if test="${ empty todayCList }">
                   		<div class="list-none">굿즈 교환 내역이 없습니다</div>
                   	</c:if>
                   	<c:if test="${ !empty todayCList }">
			            <div id="list-count">굿즈 목록 | ${goodsList.size() }개</div>
			            <div id="goods-img-div">
			                <div class="slider-container">
			                    <div class="slider1">
			                        <!-- 이곳에 추가 이미지를 슬라이드로 넣어줍니다. -->
			                        <c:forEach var="goods" items="${goodsList }" >
				                        <div class="slide">
				                            <img src="../../resources/images/${goods.productName}.jpg" alt=""> 
				                            <div class="goods-name-overlay">
				                                <div class="goods-name">${goods.productName }</div>
				                            </div>
				                        </div>
			                        </c:forEach>
			                    </div>
			                </div>                
			            </div>
			        </c:if>
			        </div>    
            		</c:if>
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
	                                        <div class="chal-title">${ chal.chalTitle }</div>
	                                        <!-- 챌린지 방법 설명 -->
	                                        <c:if test="${ chal.chalFileRename ne null }">
		                                        <div style="width: 170px">${ chal.chalContent }</div>                                    	
	                                    	</c:if>
	                                        <c:if test="${ chal.chalFileRename eq null }">
		                                        <div>${ chal.chalContent }</div>                                    	
	                                    	</c:if>
	                                    </div>
	                                    <!-- 챌린지 세부 정보 이동 버튼 -->
	                                    <button class="chal-details-btn" onclick="showChalInfo('${ chal.chalNo }');">
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
												    ${chal.chalTitle}
												</div>
		
		                                        <!-- 챌린지 방법 설명 -->
		                                        <c:if test="${ chal.chalFileRename ne null }">
			                                        <div style="width: 170px">${ chal.chalContent }</div>                                    	
		                                    	</c:if>
		                                        <c:if test="${ chal.chalFileRename eq null }">
			                                        <div>${ chal.chalContent }</div>                                    	
		                                    	</c:if>
		                                    </div>
		                                    <!-- 챌린지 세부 정보 이동 버튼 -->
		                                    <button class="chal-details-btn" onclick="showChalInfo('${ chal.chalNo }');">
		                                        <span class="material-symbols-outlined">arrow_forward_ios</span>
		                                    </button>
		                                </div>
		                                <div class="chal-sub-info">
		                                    <div>
		                                        <!-- 총 좋아요 수 -->
		                                        <div>
		                                            <img src="../resources/images/challenge/heart.png" alt="" width="20">
		                                            <span>&nbsp;
			                                            <c:forEach var="like" items="${ cPLikeList }" varStatus="likeStatus">
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
		                                        	<c:set var="loop_flag" value="true" />
		                                            <c:forEach var="post" items="${ cPostCntList }" varStatus="postStatus">
	                                            		<c:if test="${ loop_flag }">
		                                            		<c:choose>
		                                            			<c:when test="${ chal.chalNo eq post.chalNo }">
		                                            				${ post.postCount }회
		                                            				<c:set var="loop_flag" value="false" />
		                                            			</c:when>
		                                            			<c:otherwise>
		                                            				0회
		                                            				<c:set var="loop_flag" value="false" />
		                                            			</c:otherwise>
		                                            		</c:choose>
	                                            		</c:if>
	                                            	</c:forEach>
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
				                    <div class="like-image-container">
				                    <!-- 좋아요 모달창 추가하기 -->
				                        <a href="#">
				                            <img src="../resources/cuploadFiles/${ likePost.cBoardFileRename }" alt="좋아요 게시물" class="like-img" width="140px" height="160px">
				                            <div class="image-text">
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
				                        </a>
				                    </div>
			                    <c:if test="${status.index % 9 == 8 or status.count == 30 }">
						            </div>
						        </c:if> 
		                	</c:forEach>
		                </div>
		            </c:if>
		            <c:if test="${ empty cBLikePostList }">
                    	<div class="list-none">좋아요 이력이 없습니다</div>
                    </c:if>
            	</section>
            </section>
        </main>
<!--         <footer></footer> -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

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
		      events: events, // 생성한 이벤트 배열을 events 옵션에 전달
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
        	function showChalInfo(chalNo) {
				location.href = "/challenge/info.do?chalNo=" + chalNo;
			}
        </script>
        <script>
			function submitChalUpdateForm() {
			    document.chalUpdateForm.submit();
			}
		</script>
        <script>
            function deleteMyChal(deleteUrl) {
                if(confirm("삭제한 챌린지 정보는 복구되지 않습니다(인증 게시물 포함). 정말 삭제하시겠습니까?")){
                	location.href = deleteUrl;
                }
            }
        </script>
    </body>
</html>