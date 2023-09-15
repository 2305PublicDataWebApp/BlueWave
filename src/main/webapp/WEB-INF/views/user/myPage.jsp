<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../resources/css/user/myPage.css">
        <link rel="stylesheet" href="../resources/css/font.css">
        <link rel="stylesheet" href="../resources/css/reset.css">        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
                    <div>
                        <div>
                        <c:forEach var="chal" items="${ cList }">
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
                                        <div>
                                            60%
                                        </div>
                                        <!-- 나의 인증 횟수 -->
                                        <div>
                                            17회
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        
                        
<!--                             <div class="chal-list"> -->
<!--                                 챌린지 기간 -->
<!--                                 <span class="chal-date">2023.09.15 ~ 2023.10.26</span> -->
<!--                                 <div class="chal-main-info"> -->
<!--                                     대표 이미지 -->
<!--                                     <img src="../resources/images/background-img.jpg" alt="챌린지 대표 이미지" class="chal-main-img"> -->
<!--                                     <div> -->
<!--                                         챌린지 명 -->
<!--                                         <div class="chal-title">쓰레기 줍기 챌린지</div> -->
<!--                                         챌린지 방법 설명 -->
<!--                                         <div>코드에서 주어진 스타일은 텍스트를 최대 높이 50px까지 표시합니다.</div> -->
<!--                                     </div> -->
<!--                                     챌린지 세부 정보 이동 버튼 -->
<!--                                     <button class="chal-details-btn"> -->
<!--                                         <span class="material-symbols-outlined">arrow_forward_ios</span> -->
<!--                                     </button> -->
<!--                                 </div> -->
<!--                                 <div class="chal-sub-info"> -->
<!--                                     <div> -->
<!--                                         참여 인원 수 -->
<!--                                         <div> -->
<!--                                             <img src="../resources/images/challenge/person.png" alt="참여 인원 수" width="20"> -->
<!--                                             <span>&nbsp;42</span> -->
<!--                                         </div> -->
<!--                                         총 좋아요 수 -->
<!--                                         <div> -->
<!--                                             <img src="../resources/images/challenge/heart.png" alt="총 좋아요 수" width="20"> -->
<!--                                             <span>&nbsp;125</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div> -->
<!--                                         진행률 -->
<!--                                         <div> -->
<!--                                             60% -->
<!--                                         </div> -->
<!--                                         나의 인증 횟수 -->
<!--                                         <div> -->
<!--                                             17회 -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->

<!--                             <div class="chal-list"> -->
<!--                                 챌린지 기간 -->
<!--                                 <span class="chal-date">2023.09.15 ~ 2023.10.26</span> -->
<!--                                 <div class="chal-main-info"> -->
<!--                                     대표 이미지 -->
<!--                                     <img src="" alt=""> -->
<!--                                     <div id="img"></div> -->
<!--                                     <div> -->
<!--                                         챌린지 명 -->
<!--                                         <div class="chal-title">대중교통 이용하기 챌린지</div> -->
<!--                                         챌린지 방법 설명 -->
<!--                                         <div>코드에서 주어진 스타일은 텍스트를 최대 높이 50px까지 표시합니다.</div> -->
<!--                                     </div> -->
<!--                                     챌린지 세부 정보 이동 버튼 -->
<!--                                     <img src="" alt=""> -->
<!--                                     <button class="chal-details-btn"> -->
<!--                                         <span class="material-symbols-outlined"> -->
<!--                                             arrow_forward_ios -->
<!--                                             </span> -->
<!--                                     </button> -->
<!--                                 </div> -->
<!--                                 <div class="chal-sub-info"> -->
<!--                                     <div> -->
<!--                                         참여 인원 수 -->
<!--                                         <div> -->
<!--                                             <img src="../resources/images/challenge/person.png" alt="" width="20"> -->
<!--                                             <span>&nbsp;42</span> -->
<!--                                         </div> -->
<!--                                         총 좋아요 수 -->
<!--                                         <div> -->
<!--                                             <img src="../resources/images/challenge/heart.png" alt="" width="20"> -->
<!--                                             <span>&nbsp;125</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div> -->
<!--                                         진행률 -->
<!--                                         <div> -->
<!--                                             60% -->
<!--                                         </div> -->
<!--                                         나의 인증 횟수 -->
<!--                                         <div> -->
<!--                                             17회 -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                        </div>
                    </div>
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
                    <div>
                        <div>
                        	<c:forEach var="chal" items="${ cList }">
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
                                        <div>
                                            60%
                                        </div>
                                        <!-- 나의 인증 횟수 -->
                                        <div>
                                            17회
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        
                        
<!--                             <div class="chal-list"> -->
<!--                                 <div> -->
<!--                                     챌린지 기간 -->
<!--                                     <span class="chal-date">2023.09.15 ~ 2023.10.26</span> -->
<!--                                     <div> -->
<!--                                         <a href="/challenge/update.do" class="edit-personal-chal">수정</a>&nbsp; -->
<!--                                         <a href="javascript:void(0)" class="edit-personal-chal" onclick="deleteMyChal();">삭제</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="chal-main-info"> -->
<!--                                     대표 이미지 -->
<!--                                     <img src="../resources/images/background-img.jpg" alt="챌린지 대표 이미지" class="chal-main-img"> -->
<!--                                     <div> -->
<!--                                         챌린지 명 -->
<!--                                         <div class="chal-title"> -->
<!--                                             <span class="material-symbols-outlined">lock</span> -->
<!--                                             분리수거 챌린지 -->
<!--                                         </div> -->
<!--                                         챌린지 방법 설명 -->
<!--                                         <div>코드에서 주어진 스타일은 텍스트를 최대 높이 50px까지 표시합니다.</div> -->
<!--                                     </div> -->
<!--                                     챌린지 세부 정보 이동 버튼 -->
<!--                                     <button class="chal-details-btn"> -->
<!--                                         <span class="material-symbols-outlined">arrow_forward_ios</span> -->
<!--                                     </button> -->
<!--                                 </div> -->
<!--                                 <div class="chal-sub-info"> -->
<!--                                     <div> -->
<!--                                         총 좋아요 수 -->
<!--                                         <div> -->
<!--                                             <img src="../resources/images/challenge/heart.png" alt="총 좋아요 수" width="20"> -->
<!--                                             <span>&nbsp;125</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div> -->
<!--                                         진행률 -->
<!--                                         <div> -->
<!--                                             60% -->
<!--                                         </div> -->
<!--                                         나의 인증 횟수 -->
<!--                                         <div> -->
<!--                                             17회 -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->

<!--                             <div class="chal-list"> -->
<!--                                 <div> -->
<!--                                     챌린지 기간 -->
<!--                                     <span class="chal-date">2023.09.15 ~ 2023.10.26</span> -->
<!--                                     <div> -->
<!--                                         <a href="/challenge/update.do" class="edit-personal-chal">수정</a>&nbsp; -->
<!--                                         <a href="" class="edit-personal-chal">삭제</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="chal-main-info"> -->
<!--                                     대표 이미지 -->
<!--                                     <img src="" alt=""> -->
<!--                                     <div id="img"></div> -->
<!--                                     <div> -->
<!--                                         챌린지 명 -->
<!--                                         <div class="chal-title">텀블러 사용하기 챌린지</div> -->
<!--                                         챌린지 방법 설명 -->
<!--                                         <div>코드에서 주어진 스타일은 텍스트를 최대 높이 50px까지 표시합니다.</div> -->
<!--                                     </div> -->
<!--                                     챌린지 세부 정보 이동 버튼 -->
<!--                                     <button class="chal-details-btn"> -->
<!--                                         <span class="material-symbols-outlined"> -->
<!--                                             arrow_forward_ios -->
<!--                                             </span> -->
<!--                                     </button> -->
<!--                                 </div> -->
<!--                                 <div class="chal-sub-info"> -->
<!--                                     <div> -->
<!--                                         총 좋아요 수 -->
<!--                                         <div> -->
<!--                                             <img src="../resources/images/challenge/heart.png" alt="" width="20"> -->
<!--                                             <span>&nbsp;125</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div> -->
<!--                                         진행률 -->
<!--                                         <div> -->
<!--                                             60% -->
<!--                                         </div> -->
<!--                                         나의 인증 횟수 -->
<!--                                         <div> -->
<!--                                             17회 -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                        </div>
                    </div>
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