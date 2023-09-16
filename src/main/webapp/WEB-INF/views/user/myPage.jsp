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
        <link rel="stylesheet" href="../resources/css/font.css">
        <link rel="stylesheet" href="../resources/css/reset.css">        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	    <script>
		    $(document).ready(function() {
				$("#bluewave-slider").bxSlider({
					minSlides: 1,
				    maxSlides: 1,
				    infiniteLoop: false
				});
				
				$("#personal-slider").bxSlider({
					minSlides: 1,
				    maxSlides: 1,
				    infiniteLoop: false
				});
			});
	    </script>
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
/*    			    width: 836.264px !important; */
 			} 
			
 			.bx-viewport {
 				height: 530px !important;
 			}
 			
 			#bluewave-slider, #personal-slider {
 				display: flex;
 			}
 			
 			.bx-controls-direction {
 				display: none;
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
	    </style>
        <title>마이페이지</title>
    </head>
    <body>
    	<jsp:include page="/WEB-INF/views/include/navHeader.jsp"></jsp:include>
<!--         <header></header> -->
        <main>
            <section id="main-container">
                <section id="my-nav">
                    <div id="bluewave-tab" data-tab="bluewave-chal" style="background-color: rgb(45, 55, 71); color: white;" onclick="showTab('bluewave-tab');">블루웨이브 챌린지</div>
                    <div id="personal-tab" data-tab="personal-chal" onclick="showTab('personal-tab');">나의 챌린지</div>
                    <div id="like-tab" data-tab="like-chal" onclick="showTab('like-tab');">좋아요 게시물</div>
                </section>
                
                <!-- 블루웨이브 챌린지 -->
                <section id="bluewave-chal" class="chal-section">
                    <!-- 챌린지 진행도 선택 -->
<!--                     <select name="wavefinishOption" class="select-show-chal" onchange="getWaveChalSelOption(this.value);"> -->
                    <select name="wavefinishOption" class="select-show-chal">
                        <option value="all" <c:if test="${ wavefinishOption eq 'all' }">selected</c:if>>전체</option>
                        <option value="N" <c:if test="${ wavefinishOption eq 'N' }">selected</c:if>>진행 중인 챌린지</option>
                        <option value="Y" <c:if test="${ wavefinishOption eq 'Y' }">selected</c:if>>완료된 챌린지</option>
                    </select>
					
                    <!-- 챌린지 리스트 -->
                    <div id="bluewave-slider">
                        <c:forEach var="chal" items="${ cList }" varStatus="status">
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
                                            <span>&nbsp;42</span>
                                        </div>
                                        <!-- 총 좋아요 수 -->
                                        <div>
                                            <img src="../resources/images/challenge/heart.png" alt="총 좋아요 수" width="20">
                                            <span>&nbsp;125</span>
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
												    <c:when test="${progress >= 100 }">
												    	<div class="chal-progress-finish">
													        <b><em>완료</em></b>
												    	</div>
												    </c:when>
												    <c:otherwise>
													    <div class="chal-progress-ing">
													        <fmt:formatNumber value="${progress}" pattern="#.#" />%
													    </div>
												    </c:otherwise>
												</c:choose>
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
                                            17회
                                        </div>
                                    </div>
                                </div>
                            </div>
							<c:if test="${status.index % 4 == 3 or status.count == fn:length(cList)}">
					            </div>
					        </c:if>  	
                        </c:forEach>
                </section>
                
                <!-- 나의 챌린지 -->
                <section id="personal-chal" class="chal-section" style="display: none;" >
                    <select name="chalPublic" class="select-show-chal" style="width: 100px;">
                        <option value="Y">공개</option>
                        <option value="N">비공개</option>
                    </select>
                    
<!--                     <select name="perfinishOption" class="select-show-chal" onchange="getPerChalSelOption(this.value);"> -->
                    <select name="perfinishOption" class="select-show-chal">
                        <option value="all" <c:if test="${ perfinishOption eq 'all' }">selected</c:if>>전체</option>
                        <option value="N" <c:if test="${ perfinishOption eq 'N' }">selected</c:if>>진행 중인 챌린지</option>
                        <option value="Y" <c:if test="${ perfinishOption eq 'Y' }">selected</c:if>>완료된 챌린지</option>
                    </select>
					
                    <!-- 챌린지 리스트 -->
                    <div id="personal-slider">
                        <c:forEach var="chal" items="${ cList }" varStatus="status">
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
	                                            <span>&nbsp;125</span>
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
													    <c:when test="${progress >= 100 }">
													    	<div class="chal-progress-finish">
														        <b><em>완료</em></b>
													    	</div>
													    </c:when>
													    <c:otherwise>
														    <div class="chal-progress-ing">
														        <fmt:formatNumber value="${progress}" pattern="#.#" />%
														    </div>
													    </c:otherwise>
													</c:choose>
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
	                                            17회
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
                            <c:if test="${status.index % 4 == 3 or status.count == fn:length(cList)}">
					            </div>
					        </c:if>  
                        </c:forEach>
                </section>
                

                <!-- 좋아요 게시물 -->
                <section id="like-chal" class="chal-section" style="display: none;">
                    <div class="like-image-container">
                        <a href="#">
                            <img src="../resources/images/background-img.jpg" alt="좋아요 게시물" class="like-img" width="180px" height="200px">
                            <div class="image-text">
                                <span class="material-symbols-outlined" style="font-size: 1.1em;">
                                    favorite
                                </span>
                                &nbsp;128
                            </div>
                        </a>
                    </div>
                    <div class="like-image-container">
                        <a href="#">
                            <img src="../resources/images/background-img.jpg" alt="좋아요 게시물" class="like-img" width="180px" height="200px">
                            <div class="image-text">
                                <span class="material-symbols-outlined" style="font-size: 1.1em;">
                                    favorite
                                </span>
                                &nbsp;128
                            </div>
                        </a>
                    </div>
                    <div class="like-image-container">
                        <a href="#">
                            <img src="../resources/images/background-img.jpg" alt="좋아요 게시물" class="like-img" width="180px" height="200px">
                            <div class="image-text">
                                <span class="material-symbols-outlined" style="font-size: 1.1em;">
                                    favorite
                                </span>
                                &nbsp;128
                            </div>
                        </a>
                    </div>
                    <div class="like-image-container">
                        <a href="#">
                            <img src="../resources/images/background-img.jpg" alt="좋아요 게시물" class="like-img" width="180px" height="200px">
                            <div class="image-text">
                                <span class="material-symbols-outlined" style="font-size: 1.1em;">
                                    favorite
                                </span>
                                &nbsp;128
                            </div>
                        </a>
                    </div>
            	</section>
            </section>
        </main>
        <footer></footer>

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
        <script>
         	function getWaveChalSelOption(option, userId) {
         		location.href="/user/uWaveChalInfoCheck.do?wavefinishOption=" + option + "&userId=" + "testuser01";
        	} 
        	
         	function getPerChalSelOption(option, userId) {
         		location.href="/user/uPerChalInfoCheck.do?perfinishOption=" + option + "&userId=" + "testuser01";
         	}
		</script>
    </body>
</html>