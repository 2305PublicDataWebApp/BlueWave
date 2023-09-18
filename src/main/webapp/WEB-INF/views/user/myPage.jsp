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
        <link rel="stylesheet" href="../resources/css/user/myPage.css">
        <link rel="stylesheet" href="../resources/css/user/myPage_Bae.css">
        <link rel="stylesheet" href="../resources/css/user/calendar.css">
        <link rel="stylesheet" href="../resources/css/font.css">
        <link rel="stylesheet" href="../resources/css/reset.css">        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
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
	    <script>
		    $(document).ready(function(){
		    	$(".slider").bxSlider();
		    });
	    </script>
	    <!-- 챌린지 슬라이더 css -->
	    <style type="text/css">
 	    	.bx-wrapper { 
 			    box-shadow: none; 
 			    border: none; 
     			background: transparent; 
 			} 
			
 			.chal-group { 
 				display: flex; 
     			justify-content: space-between; 
     			flex-wrap: wrap; 
     			height: 100%;
 			} 
			
 			.like-group { 
 				display: flex; 
     			--justify-content: space-between; 
     			flex-wrap: wrap; 
 			} 
			
 			.bx-viewport {
 				height: 530px !important;
 			}
 			
 			#like-chal > .bx-wrapper {
 				display: flex;
    			justify-content: center;
 			}
 			
 			#like-chal .bx-viewport {
 				width: 52% !important;
 			}
 			
 			#bluewave-slider, #personal-slider {
 				display: flex;
 			}
 			
 			.bx-controls-direction {
 				opacity: 30%;
 			}
 			
            .bx-prev {
			    background: url("../resources/images/prev-arrow.png") no-repeat !important;
			    left: -30px !important;
			}
			
			.bx-next {
			    background: url("../resources/images/next-arrow.png") no-repeat !important;
			    right: -45px !important;
			}
 			
 			.bx-wrapper .bx-pager.bx-default-pager a {
 				background-color: #AFD3E2;
 			}
 			
 			.bx-wrapper .bx-pager.bx-default-pager a:hover {
 				background-color: #79DAE8;
 			}
 			
 			.bx-wrapper .bx-pager.bx-default-pager a.active {
 				background-color: #19A7CE;
 			}
 			
 			#like-chal .bx-wrapper .bx-pager {
			    position: absolute;
			    bottom: -45px;
			    left: 50%;
			    transform: translateX(-50%);
			}
			
			#like-chal > .bx-wrapper > div:last-child > .bx-controls-direction > .bx-prev {
				left: 135px !important;
			}
			
			#like-chal > .bx-wrapper > div:last-child > .bx-controls-direction > .bx-next {
				right: 145px !important;
			}
	    </style>
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
	                            <span>팔로워23 | 팔로잉43</span>
	                        </div>                                
	                    </div>
	                </div>
	                <div id="uiInfo-div">
	                    <div class="ui-item">
	                        <img class="ui-icon" src="../resources/images/user/공식(달성,진행)아이콘.png" alt="">
	                        <span class="ui-text">15/${totalBlueChalCount }</span>
	                    </div>
	                    <div class="ui-item">
	                        <img class="ui-icon" src="../resources/images/user/개인(달성,진행)아이콘.png" alt="">
	                        <span class="ui-text">3/${totalPersonalChalCount }</span>
	                    </div>
	                    <div class="ui-item">
	                        <img class="ui-icon" src="../resources/images/user/게시물아이콘.png" alt="">
	                        <span class="ui-text">${postCount }개</span>
	                    </div>
	                    <div class="ui-item">
	                        <img class="ui-icon" src="../resources/images/user/포인트아이콘.png" alt="">
	                        <span class="ui-text">${totalPoint }p</span>
	                    </div>
	                </div>                         
	            </div>
	            <c:if test="${sessionScope.userId eq user.userId }">
	            <img id="dot" src="../../resources/images/dot.png" onclick="toggleReportDiv()" alt="">
	            <div id="report-div" style="display: none;">
	                <div id="report-img-div"><img id="report-img" src="../resources/images/user/경고아이콘.png" alt=""></div>
	                <div id="report-text">신고하기</div>
	            </div> 
	            <div id="chal">
	                <div id="blue-wave">
	                    <div class="calendar">
	                        <div class="calendar-header">
	                            <button class="nav-button" id="prevMonth">&lt; 이전 달</button>
	                            <span class="current-month" id="currentMonth"></span>
	                            <button class="nav-button" id="nextMonth">다음 달 &gt;</button>
	                        </div>
	                        <table class="calendar-table" id="calendarTable">
	                            <!-- 캘린더 표가 여기에 생성됩니다. -->
	                        </table>
	                    </div>
	                </div>
	                <div id="todo-chal">
	                    <span id="todo-title"><오늘의 챌린지></span>
	                    <hr>
	                    <table>
	                        <tr>
	                            <td>식물 기르기</td>
	                            <td>
	                                <span id="percent-text">50%</span><progress id="progress" value="50" min="0" max="100"></progress>
	                            </td>
	                        </tr>
	                    </table>
	                    <hr>
	                </div>
	            </div>
	            <div id="list-count">굿즈 목록 | 5개</div>
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
	<!--                         <div class="slide"> -->
	<!--                             <img src="../../resources/images/배경.jpg" alt=""> -->
	<!--                             <div class="goods-name-overlay"> -->
	<!--                                 <div class="goods-name">굿즈 이름2</div> -->
	<!--                             </div> -->
	<!--                         </div> -->
	<!--                         <div class="slide"> -->
	<!--                             <img src="../../resources/images/배경.jpg" alt=""> -->
	<!--                             <div class="goods-name-overlay"> -->
	<!--                                 <div class="goods-name">굿즈 이름3</div> -->
	<!--                             </div> -->
	<!--                         </div> -->
	<!--                         <div class="slide"> -->
	<!--                             <img src="../../resources/images/배경.jpg" alt=""> -->
	<!--                             <div class="goods-name-overlay"> -->
	<!--                                 <div class="goods-name">굿즈 이름4</div> -->
	<!--                             </div> -->
	<!--                         </div> -->
	<!--                         추가 이미지 -->
	<!--                         <div class="slide"> -->
	<!--                             <img src="../../resources/images/배경.jpg" alt=""> -->
	<!--                             <div class="goods-name-overlay"> -->
	<!--                                 <div class="goods-name">굿즈 이름5</div> -->
	<!--                             </div> -->
	<!--                         </div> -->
	<!--                         <div class="slide"> -->
	<!--                             <img src="../../resources/images/배경.jpg" alt=""> -->
	<!--                             <div class="goods-name-overlay"> -->
	<!--                                 <div class="goods-name">굿즈 이름6</div> -->
	<!--                             </div> -->
	<!--                         </div> -->
	<!--                         <div class="slide"> -->
	<!--                             <img src="../../resources/images/배경.jpg" alt=""> -->
	<!--                             <div class="goods-name-overlay"> -->
	<!--                                 <div class="goods-name">굿즈 이름7</div> -->
	<!--                             </div> -->
	<!--                         </div> -->
	<!--                         <div class="slide"> -->
	<!--                             <img src="../../resources/images/배경.jpg" alt=""> -->
	<!--                             <div class="goods-name-overlay"> -->
	<!--                                 <div class="goods-name">굿즈 이름8</div> -->
	<!--                             </div> -->
	<!--                         </div> -->
	                        <!-- 추가 이미지 끝 -->
	                    </div>
	                </div>                
	            </div>
	            </c:if>
	        </div>
            
            
                <section id="my-nav">
                    <div id="bluewave-tab" data-tab="bluewave-chal" style="background-color: rgb(45, 55, 71); color: white;" onclick="showTab('bluewave-tab');">블루웨이브 챌린지</div>
                    <div id="personal-tab" data-tab="personal-chal" onclick="showTab('personal-tab');">나의 챌린지</div>
                    <div id="like-tab" data-tab="like-chal" onclick="showTab('like-tab');">좋아요 게시물</div>
                </section>
                
                <!-- 블루웨이브 챌린지 -->
                <section id="bluewave-chal" class="chal-section">
                    <!-- 챌린지 리스트 -->
	                    <!-- 챌린지 진행도 선택 -->
<!-- 	                    <select name="wavefinishOption" class="select-show-chal" onchange="getWaveChalSelOption(this.value);"> -->
<!--  	                    <select name="wavefinishOption" class="select-show-chal"> --> 
<%-- 	                        <option value="all" <c:if test="${ wavefinishOption eq 'all' }">selected</c:if>>전체</option> --%>
<%-- 	                        <option value="N" <c:if test="${ wavefinishOption eq 'N' }">selected</c:if>>진행 중인 챌린지</option> --%>
<%-- 	                        <option value="Y" <c:if test="${ wavefinishOption eq 'Y' }">selected</c:if>>완료된 챌린지</option> --%>
<!-- 	                    </select> -->
						
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
	                                    <button class="chal-details-btn">
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
                    </c:if>
                    <c:if test="${ empty cWaveList }">
                    	<div class="list-none">참여 이력이 없습니다</div>
                    </c:if>
                </section>
                
                <!-- 나의 챌린지 -->
                <section id="personal-chal" class="chal-section" style="display: none;" >
                    <!-- 챌린지 리스트 -->
                    <c:if test="${ !empty cPersonalList }">
<!-- 	                    <select name="chalPublic" class="select-show-chal" style="width: 100px;"> -->
<!-- 	                        <option value="Y">공개</option> -->
<!-- 	                        <option value="N">비공개</option> -->
<!-- 	                    </select> -->
	                    
<!-- 	                    <select name="perfinishOption" class="select-show-chal" onchange="getPerChalSelOption(this.value);"> -->
<!-- 	                    <select name="perfinishOption" class="select-show-chal"> -->
<%-- 	                        <option value="all" <c:if test="${ perfinishOption eq 'all' }">selected</c:if>>전체</option> --%>
<%-- 	                        <option value="N" <c:if test="${ perfinishOption eq 'N' }">selected</c:if>>진행 중인 챌린지</option> --%>
<%-- 	                        <option value="Y" <c:if test="${ perfinishOption eq 'Y' }">selected</c:if>>완료된 챌린지</option> --%>
<!-- 	                    </select> -->
	                    
	                    <div id="personal-slider">
	                        <c:forEach var="chal" items="${ cPersonalList }" varStatus="status">
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
		                                    <div>
		<!--                                     	근데 수정 링크 post로 받아야하지않나... -->
		                                    	<c:url var="updateUrl" value="/challenge/update.do">
		                                    		<c:param name="chalNo" value="${ chal.chalNo }"></c:param>
		                                    	</c:url>
		                                    	<c:url var="deleteUrl" value="/challenge/delete.do">
		                                    		<c:param name="chalNo" value="${ chal.chalNo }"></c:param>
		                                    	</c:url>
		                                        <a href="${ updateUrl }" class="edit-personal-chal">수정</a>&nbsp;
		                                        <a href="javascript:void(0)" class="edit-personal-chal" onclick="deleteMyChal('${ deleteUrl }');">삭제</a>
		                                    </div>
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
		                                    <button class="chal-details-btn">
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
                    </c:if>
                    <c:if test="${ empty cPersonalList }">
                    	<div class="list-none">참여 이력이 없습니다</div>
                    </c:if>
                </section>
                

                <!-- 좋아요 게시물 -->
                <section id="like-chal" class="chal-section" style="display: none;">
                	<div id="like-slider">
                        <c:forEach begin="0" end="30" varStatus="status">
                        	<c:if test="${status.index % 9 == 0}">
					            <div class="like-group">
					        </c:if>
			                    <div class="like-image-container">
			                        <a href="#">
			                            <img src="../resources/images/background-img.jpg" alt="좋아요 게시물" class="like-img" width="140px" height="160px">
			                            <div class="image-text">
			                                <span class="material-symbols-outlined" style="font-size: 1.1em;">
			                                    favorite
			                                </span>
			                                &nbsp;128
			                            </div>
			                        </a>
			                    </div>
		                    <c:if test="${status.index % 9 == 8 or status.count == 30 }">
					            </div>
					        </c:if> 
	                	</c:forEach>
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


    const calendarTable = document.getElementById("calendarTable");
        const currentMonthHeader = document.getElementById("currentMonth");
        const prevMonthButton = document.getElementById("prevMonth");
        const nextMonthButton = document.getElementById("nextMonth");
        let currentDate = new Date();

        function updateCalendar() {
            const year = currentDate.getFullYear();
            const month = currentDate.getMonth();
            const daysInMonth = new Date(year, month + 1, 0).getDate();
            const firstDay = new Date(year, month, 1).getDay();

            // 현재 월 표시
            currentMonthHeader.textContent = `${year}년 ${month + 1}월`;

            // 캘린더 표 초기화
            calendarTable.innerHTML = "";

            // 날짜 표시
            let date = 1;
            for (let i = 0; i < 6; i++) {
                const row = document.createElement("tr");
                for (let j = 0; j < 7; j++) {
                    const td = document.createElement("td");
                    if (i === 0 && j < firstDay) {
                        // 빈 셀
                    } else if (date <= daysInMonth) {
                        td.textContent = date;
                        date++;
                    }
                    row.appendChild(td);
                }
                calendarTable.appendChild(row);
                if (date > daysInMonth) {
                    break;
                }
            }
        }

        prevMonthButton.addEventListener("click", () => {
            currentDate.setMonth(currentDate.getMonth() - 1);
            updateCalendar();
        });

        nextMonthButton.addEventListener("click", () => {
            currentDate.setMonth(currentDate.getMonth() + 1);
            updateCalendar();
        });

        // 특정 날짜를 파란색으로 표시
        function highlightDate(dateToHighlight) {
            const year = currentDate.getFullYear();
            const month = currentDate.getMonth();
            const tableRows = calendarTable.querySelectorAll("tr");

            for (let i = 1; i < tableRows.length; i++) {
                const row = tableRows[i];
                const cells = row.querySelectorAll("td");

                for (let j = 0; j < cells.length; j++) {
                    const cell = cells[j];
                    const cellDate = parseInt(cell.textContent);

                    if (!isNaN(cellDate) && cellDate === dateToHighlight) {
                        cell.style.backgroundColor = "#3d9ff6"; // 파란색으로 설정
                    }
                }
            }
        }

        // 초기 캘린더 업데이트
        updateCalendar();

        // 9월 29일을 파란색으로 표시
        highlightDate(29);  
        highlightDate(2);  
        highlightDate(3);  
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
            function deleteMyChal(deleteUrl) {
                if(confirm("삭제한 챌린지 정보는 복구되지 않습니다. 정말 삭제하시겠습니까?")){
                	location.href = deleteUrl;
                }
            }
        </script>
<!--         <script> -->
<!--          	function getWaveChalSelOption(option, userId) { -->
<!--          		location.href="/user/uWaveChalInfoCheck.do?wavefinishOption=" + option + "&userId=" + "testuser01"; -->
<!--         	}  -->
        	
<!--          	function getPerChalSelOption(option, userId) { -->
<!--          		location.href="/user/uPerChalInfoCheck.do?perfinishOption=" + option + "&userId=" + "testuser01"; -->
<!--          	} -->
<!-- 		</script> -->
    </body>
</html>