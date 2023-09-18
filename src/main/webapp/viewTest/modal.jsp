<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
		<!-- 리셋 css -->
		<link rel="stylesheet" href="/resources/css/reset/reset.css">
		
		<!-- 페이지 css -->
		<link rel="stylesheet" href="/resources/css/challenge/challengeBoard.css">
		<link rel="stylesheet" href="/resources/css/challenge/challengeInfo.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<body>
		<!-- Button trigger modal -->
<!-- 		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"> -->
<!-- 		  Launch demo modal -->
<!-- 		</button> -->
		<div class="like-image-container" data-bs-toggle="modal" data-bs-target="#exampleModal">
        	<img src="/resources/images/flower2.PNG" alt="" class="like-img" width="180px" height="200px">
            <div class="image-text">
                <span class="material-symbols-outlined" style="font-size: 1.1em;">
                    favorite
                </span>
                    &nbsp;128
            </div>
        </div>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-xl">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">챌린지 게시물 제목</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      
		        <div id="container-modal">
					<div class="main-modal">
						<section id="top-section">
							<div id="user-info">
								<div class="user-info-box">
									<div class="user-img-box">
										<img alt="프로필 사진" src="/resources/images/flower1.PNG">							
									</div>
									<div class="user-nickname-box">
										<h1>올빼미</h1>
									</div>
									<div class="user-subscribe-box">
										<button>구독하기</button>
									</div>
								</div>
								<div class="report-board-box">
									<img src="/resources/images/report-icon.png" alt="신고 아이콘">
		                            <a href="#">신고하기</a>
								</div>
							</div>
						</section>
						<div id="chal-info">
							<p>개인 챌린지  /  쓰레기 줍기 챌린지</p>
						</div>
						<section id="mid-section">
							<div class="top-box">
								<div class="chal-board-title-box">
									<h2>하루에 1번씩 쓰레기 줍기></h2>
								</div>
								<div class="chal-board-tag-box">
									<a href="#">수정하기</a>
									<a href="#">삭제하기</a>
								</div>
							</div>
							<div class="mid-box">
								<img alt="챌린지 게시물 업로드 사진" src="/resources/images/river2.PNG">
								<p>길 가에 버려진 쓰레기 주워서 쓰레기통에 버렸음</p>
							</div>
							<div class="bottom-box">
								<div class="calendar-box">
									<img alt="캘린더 아이콘" src="/resources/images/Unioncalendar.png">
									<p>7회 째 실천 중</p>					
								</div>
								<div>
									<p>1시간 전</p>						
								</div>
							</div>
						</section>
						<hr>
						<section id="bottom-section">
							<div class="like-btn-box">
								<img alt="하트 아이콘" src="/resources/images/heart.png">
								<h4>좋아요 5개</h4>
							</div>
						</section>
					</div>
				</div>
				
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
<!-- 		        <button type="button" class="btn btn-primary"></button> -->
		      </div>
		    </div>
		  </div>
		</div>
	
	</body>
</html>