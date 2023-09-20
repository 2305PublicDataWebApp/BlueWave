<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>챌린지 게시물 작성</title>
		<!-- 리셋 css -->
		<link rel="stylesheet" href="/resources/css/reset/reset.css">
		
		<!-- 페이지 css -->
		<link rel="stylesheet" href="/resources/css/challenge/challengeModify.css">
	</head>
	<body>
		<header></header>
		<jsp:include page="/WEB-INF/views/include/navHeader.jsp" />
		<main>
			<div id="container">
				<div class="main">
					<section class="user-info-section">
						<div class="user-info-box">
							<div class="user-img">
								<img alt="유저 프로필 이미지" src="/resources/PuploadFiles/${uOne.userProfileRename }">
							</div>
							<div class="user-nickname">
								<h1>${uOne.userNickName }</h1>
							</div>
						</div>
					</section>
					<section class="chal-content-section">
						<form action="/challenge/cbUpdate.do" method="post" enctype="multipart/form-data">
							<div class="chal-board-title-box">
								<input type="hidden" name="cBoardNo" value="${cBOne.cBoardNo }">
								<label for="chal-board-title" class="chal-label">
									제목
								</label> <br>
								<input type="text" id="chal-board-title" class="input-tag" name="cBoardTitle" value="${cBOne.cBoardTitle }" required="required">
							</div>
							<div class="chal-board-content-box">
								<label for="chal-board-content" class="chal-label">
									내용
								</label> <br>
								<textarea id="chal-board-content" rows="0" cols="0" class="input-tag" name="cBoardContent" required="required">${cBOne.cBoardContent }</textarea>								
							</div>
							<div class="chal-board-file-box">
								<input type="file" name="uploadFile" class="input-tag" required="required">
								<div class="btn-box">
									<input type="reset" value="취소하기" id="reset-btn">
									<input type="submit" value="수정하기" class="btn">							
								</div>
							</div>
						</form>
					</section>
				</div>
			</div>
		</main>
		<footer>
		
		</footer>
		
		
	</body>
</html>