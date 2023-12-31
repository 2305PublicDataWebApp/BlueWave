<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/resources/css/font.css">
        <link rel="stylesheet" href="/resources/css/reset.css">  
		
		<style>
		* {
			margin: 0;
			padding: 0;
			/* border 추가 계산하지마 */
			box-sizing: border-box;
		}
		
		.navbar {
			position: fixed;
			top: 0;
			width: 100%;
			height: 60px;
			display: flex;
			justify-content: space-around;
			background-color: #4aa8d5;
			align-items: center;
			z-index: 1000;
		}
		
		.navbar a {
			text-decoration: none;
			color: white;
		}
		
		.space {
			padding-left: 20px;
		}
		
		.navbar-left {
			display: flex;
			align-items: center;
		}
		
		.navbar-right {
			display: flex;
			align-items: center;
		}
		
		.register-btn button {
			border-style: hidden;
			padding: 10px 30px 10px 30px;
			border-radius: 5px;
			color: #45A1D6;
			font-size: 15px;
			background-color: #F8F8F8;
			box-sizing: border-box;
			transition: all 0.2s;
			border-bottom: 2px solid darkgray;
			border-right: 2px solid darkgray;
		}
		
		.register-btn button:active {
			transform: translate(2px, 2px);
		}
		
		.register-btn button:hover {
			cursor: pointer;
		}
		
		.nav-logo-img img {
			width: 35px;
   			height: 35px;
			object-fit: cover;
		}
		
		.main-img img {
			width: 100%;
			height: 100vh;
			object-fit: cover;
		}
		
		.header-logo-img {
			width: 70%;
			margin: 0 auto;
			height: 250px;
		}
		
		.header-logo-img img {
			width: 100%;
			height: 100%;
		}
		
		body {
			background-image: url(../resources/images/background-img.jpg);
			background-size: cover;
			background-attachment: fixed; /* 이미지를 고정 배경으로 설정합니다. */
			background-repeat: no-repeat; /* 배경 이미지 반복을 비활성화합니다. */
			background-position: center center; /* 배경 이미지를 중앙에 정렬합니다. */
		}
		
		#userId {
			bottom: 22px;
		    position: absolute;
		    color: white;
		    right: 550px;
		}
		</style>
	</head>
	<body>
		<div>
			<nav class="navbar">
				<!-- 헤더 왼쪽 -->
				<div class="navbar-left">
					<div class="nav-logo-img space">
						<a href="/home.do"><img src="../resources/images/logo-img.png" alt="로고이미지" /></a>
					</div>
					<div class="go-to-challenge space">
						<a href="/challenge/page.do">챌린지</a>
					</div>
					<div class="go-to-notice space">
						<a href="/notice/board.do">공지사항</a>
					</div>
					<div class="go-to-tip space">
						<a href="/tip/board.do">팁 게시판</a>
					</div>
					<div class="go-to-goods space">
						<a href="/goods/list.do">굿즈 페이지</a>
					</div>
				</div>
				<!-- 헤더 오른쪽 -->
				<div class="navbar-right">
					<c:if test="${sessionScope.userId eq null}">
						<div class="login-btn">
							<a href="/user/login.do">login</a>
						</div>
						<div class="register-btn space">
							<button onclick="location.href='/user/register.do'">sign up</button>
						</div>
					</c:if>
					<c:if test="${sessionScope.userId ne null}">
						<div id="userId">${sessionScope.userId }님</div>
						<div class="login-btn">
							<a href="/user/logout.do">logout</a>
						</div>
						<div class="register-btn space">
							<c:if test="${sessionScope.userId ne 'admin' }">
								<button onclick="location.href='/user/myPage.do?userId=${sessionScope.userId}'">myPage</button>
							</c:if>
							<c:if test="${sessionScope.userId eq 'admin' }">
								<button onclick="location.href='/admin/main.do'">관리자페이지</button>
							</c:if>
						</div>
					</c:if>
				</div>
			</nav>
		</div>
	</body>
</html>