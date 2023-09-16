<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>챌린지 게시물</title>
		<!-- 리셋 css -->
		<link rel="stylesheet" href="/resources/css/reset/reset.css">
		
		<!-- 페이지 css -->
		<link rel="stylesheet" href="/resources/css/challenge/challengeBoard.css">
	</head>
	<body>
		<header>
		
		</header>
		<jsp:include page="/WEB-INF/views/include/nav.jsp" />
		<main>
			<div id="container">
				<div class="main">
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
		</main>
		<footer>
		
		</footer>
	</body>
</html>