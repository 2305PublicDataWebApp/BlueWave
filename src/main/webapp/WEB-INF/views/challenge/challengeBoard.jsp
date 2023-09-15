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
				<section id="top-section">
					<div id="user-info">
						<div class="user-info-box">
							<div class="user-img-box">
								<img alt="프로필 사진" src="/resources/images/flower1.PNG">							
							</div>
							<div class="user-nickname-box">
								<h3>올빼미</h3>
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
					
				</section>
				<section id="bottom-section">
					
				</section>
				
			</div>
		</main>
		<footer>
		
		</footer>
	</body>
</html>