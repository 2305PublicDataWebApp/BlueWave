<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/user/findId2.css">
    <title>findId2</title>
</head>
<body>
    <div class="container">
        <img src="../resources/images/로고.png" id="logo-img" alt="로고이미지">
        <div id="order">
            <span id="order-1">본인확인</span> > 
            <span id="order-2">아이디 조회</span>
        </div>
        <input type="text" id="user-id" name="userId" value="${foundUserId }" readonly>
        <a href="/user/login.do">
        <button type="submit" class="login-button" style="display: block;">로그인 하러가기</button>
        </a>
    </div>

</body>
</html>