<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/findPw2.css">
    <title>findId1</title>
</head>
<body>
    <div class="container">
        <img src="../../resources/images/로고.png" id="logo-img" alt="로고이미지">
        <div id="order">
            <span id="order-1">아이디 입력</span> > 
            <span id="order-2">이메일로 임시 비밀번호 받기</span>
        </div>
        <span id="info">회원 정보에 저장한 이메일로 임시비밀번호 받기</span>
        <form action="#" method="POST">
            <div id="email-input" class="form-group">
                <input type="text" id="user-name" name="userName" placeholder="이름" required>
                <input type="text" id="user-email" name="userEmail" placeholder="이메일" required>
            </div>
            <div id="getPwBtnDiv">
                <button id="getPwBtn">임시비밀번호 받기</button>
            </div>
            <button type="submit" id="next-button" style="display: block;">확인</button>
        </form>
    </div>
</body>
</html>
