<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/user/findPw1.css">
    <title>findId2</title>
</head>
<body>
    <div class="container">
        <img src="../resources/images/logo-img.png" id="logo-img" alt="로고이미지">
        <div id="order">
            <span id="order-1">아이디 입력</span> >
            <span id="order-2">본인확인</span> >
            <span id="order-3">비밀번호 조회</span>
        </div>
        <form action="/user/findPw1.do" method="POST">
            <input type="text" id="user-id" name="userId" placeholder="비밀번호를 찾고자 하는 아이디를 입력하세요">
            <button type="submit" id="next-button" style="display: block;">다음</button>
        </form>
    </div>
</body>
</html>
