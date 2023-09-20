<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/user/login.css">
    <title>Login</title>
</head>
<body>
    <div class="container">
        <img src="../resources/images/logo-img.png" id="logo-img" alt="로고이미지">
        <h1>로그인</h1>
        <form action="/user/login.do" method="POST">
            <div class="form-group">
                <input type="text" id="userId" name="userId" placeholder="아이디" required>
            </div>
            <div class="form-group">
                <input type="password" id="userPw" name="userPw" placeholder="비밀번호" required>
            </div>
            <div>
                <a href="/user/findId1.do">아이디 찾기</a> |
                <a href="/user/findPw1.do">비밀번호 찾기</a> |
                <a href="/user/register.do">회원가입</a>
            </div>
            <button type="submit" class="login-button">로그인</button>
        </form>
    </div>
</body>
</html>
