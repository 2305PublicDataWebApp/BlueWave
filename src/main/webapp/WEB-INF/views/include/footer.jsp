<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>footer</title>
	<style>
		.waves {
			position:relative;
			width: 100%;
			height:15vh;
			margin-bottom:-7px; /*Fix for safari gap*/
			min-height:100px;
			max-height:150px;
			background-color: #e7f3f8;
		}
		
		.wave-container {
		    max-height: 180px; /* 최대 높이를 설정합니다. */
		    overflow: hidden; /* 넘치는 부분을 숨깁니다. */
		  }
  
		.parallax > use {
		  animation: move-forever 25s cubic-bezier(.55,.5,.45,.5)     infinite;
		}
		.parallax > use:nth-child(1) {
		  animation-delay: -2s;
		  animation-duration: 7s;
		}
		.parallax > use:nth-child(2) {
		  animation-delay: -3s;
		  animation-duration: 10s;
		}
		.parallax > use:nth-child(3) {
		  animation-delay: -4s;
		  animation-duration: 13s;
		}
		.parallax > use:nth-child(4) {
		  animation-delay: -5s;
		  animation-duration: 20s;
		}
		@keyframes move-forever {
		  0% {
		   transform: translate3d(-90px,0,0);
		  }
		  100% { 
		    transform: translate3d(85px,0,0);
		  }
		}
	</style>
	</head>
	<body>
		<div class="footer">
<!-- 			<div class="footer-wrap"> -->
<!-- 				<div class="div1 float-test"> -->
<!-- 					<img src="../resources/images/logo-img.png" /> -->
<!-- 				</div> -->
<!-- 				<div class="div2 float-test"> -->
<!-- 					<h3>BLUEWAVE</h3> -->
<!-- 					<br> -->
<!-- 					<p> -->
<!-- 						Scanfcode.com CODE WANTS TO BE SIMPLE is an initiative to help the upcoming programmers with the code. -->
<!-- 						Scanfcode focuses on providing the most efficient code or snippets as the code wants to be simple.  -->
<!-- 						We will help programmers build up concepts in different programming languages that include C, C++, Java, -->
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 				<div class="div3 float-test"> -->
<!-- 					<h2>Team != null</h2> -->
<!-- 				</div> -->
<!-- 			</div> -->
		<!--Waves Container-->
		<div class="wave-container">
			<svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
			viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
				<defs>
					<path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
				</defs>
				<g class="parallax">
					<use xlink:href="#gentle-wave" x="48" y="0" fill="hsla(203, 60%, 70%, 0.7)" />
					<use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.5)" />
					<use xlink:href="#gentle-wave" x="48" y="5" fill="hsla(195, 80%, 80%, 0.3)" />
					<use xlink:href="#gentle-wave" x="48" y="7" fill="rgba(255,255,255,0.7)" />
				</g>
			</svg>
		</div>
		<!--Waves end-->
		</div>
	</body>
</html>