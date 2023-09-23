<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/user/findId1.css">
    <title>findId1</title>
</head>
<body>
    <div class="container">
        <img src="../resources/images/logo-img.png" id="logo-img" alt="로고이미지">
        <div id="order">
            <span id="order-1">본인확인</span>
            <span id="order-2"> > 아이디 조회</span>
        </div>
        <form action="/user/findId1.do" method="POST" id="email-form" name="email-form" >
            <div id="email-input" class="form-group">
                <input type="text" id="user-name-email" name="userName" placeholder="이름" required>
                <input type="text" id="user-email" name="userEmail" placeholder="이메일" required>
            </div>
            <!-- type를 submit으로 변경 -->
            <button type="submit" class="login-button" id="submit-button">확인</button>
        </form>
    </div>
    <script>
        const form = document.getElementById('email-form');

        form.addEventListener('submit', function(event) {
            // 폼이 서버로 제출되기 전에 할 작업을 여기에 추가할 수 있습니다.

            // 만약 이벤트를 중단하고 직접 서버로 데이터를 보내려면 아래 주석을 제거합니다.
            // event.preventDefault();

            // 여기에 서버로 데이터를 보내는 로직을 작성하세요.
        });
    </script>
</body>
</html>

