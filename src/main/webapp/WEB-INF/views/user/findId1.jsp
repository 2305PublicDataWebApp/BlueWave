<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/findId1.css">
    <title>findId1</title>
</head>
<body>
    <div class="container">
        <img src="../../resources/images/로고.png" id="logo-img" alt="로고이미지">
        <div id="order">
            <span id="order-1">본인확인</span> > 
            <span id="order-2">아이디 조회</span>
        </div>
        <form action="#" method="POST">
            <div id="email-input" class="form-group">
                <input type="text" id="user-name" name="userName" placeholder="이름" required>
                <input type="text" id="user-email" name="userEmail" placeholder="이메일" required>
            </div>
            <button id="getNoBtn">인증번호받기</button>
            <input type="text" id="confirm-no" placeholder="인증번호" required>
            <button id="ConfirmBtn">확인</button>
            <button type="submit" id="next-button" style="display: block;">확인</button>
        </form>
    </div>
</body>
</html>
