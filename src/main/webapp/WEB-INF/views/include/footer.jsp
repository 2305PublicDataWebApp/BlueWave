<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>footer</title>
	</head>
	<style>
		* {
			margin: 0;
			padding: 0;
		    /* border 추가 계산하지마 */
			box-sizing: border-box;
		}
		/* div {
			border: 1px solid white;
			
		} */
		.float-test {
			float: left;
		}
		.footer {
			width: 100%;
			height: 250px;
			background-color: #afd3e2;
		}
		.footer-wrap {
			margin: 0 auto;
			width: 70%;
			height: 100%;
		}
		.div1 {
			width: 20%;
			height: 100%;
			padding:20px;
			;
		}
		.div1>img {
			width: 100%;
			height: 100%;
		}
		.div2{
			width: 50%;
			height: 100%;
			padding: 20px;
			color: white;
		}
		.div3 {
			width: 30%;
			height: 100%;
			padding: 20px;
			color: white;
			display: flex;
			justify-content: center;
			align-items: center;
		}
	</style>
	<body>
		<div class="footer">
			<div class="footer-wrap">
				<div class="div1 float-test">
					<img src="../resources/images/water.png" />
				</div>
				<div class="div2 float-test">
					<h3>ABOUT</h3>
					<br>
					<p>
						Scanfcode.com CODE WANTS TO BE SIMPLE is an initiative to help the upcoming programmers with the code.
						Scanfcode focuses on providing the most efficient code or snippets as the code wants to be simple. 
						We will help programmers build up concepts in different programming languages that include C, C++, Java,
					</p>
				</div>
				<div class="div3 float-test">
					<h2>Team != null</h2>
				</div>
			</div>
		</div>
	</body>
</html>