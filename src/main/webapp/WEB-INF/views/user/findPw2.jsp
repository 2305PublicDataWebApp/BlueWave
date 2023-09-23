<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/user/findPw2.css">
    <title>findId1</title>
</head>
<body>
    <div class="container">
        <img src="../resources/images/logo-img.png" id="logo-img" alt="로고이미지">
        <div id="order">
            <span id="order-1">아이디 입력 > </span>
            <span id="order-2">본인확인</span>
            <span id="order-3"> > 비밀번호 조회</span>
        </div>
        <form action="/user/findPw2.do" method="POST" id="email-form" name="email-form" >
        	<input type="hidden" value="${userId}" name="userId">
            <div id="email-input" class="form-group">
                <input type="text" id="user-name-email" name="userName" placeholder="이름" required>
                <input type="text" id="user-email" name="userEmail" placeholder="이메일" required>
            </div>
            <!-- type를 submit으로 변경 -->
            <button type="submit" class="login-button" id="submit-button">확인</button>
        </form>
    </div>
    <script>
    const emailType = document.getElementById('email-type');
    const emailInputDiv = document.getElementById('email-input');
    const phoneType = document.getElementById('phone-type');
    const phoneInputDiv = document.getElementById('phone-input');
    const submitButton = document.getElementById('submit-button');

    submitButton.addEventListener('click', function() {
        // 선택한 폼에 대한 데이터를 서버로 전송
        if (emailType.checked) {
            document.forms["email-form"].submit();
        }
    });
//         submitButton.addEventListener('click', function() {
//             // 선택한 폼에 대한 데이터를 서버로 전송
//             if (emailType.checked) {
//             	document.forms["email-form"].submit(); // 이메일 폼 제출
//             } else if (phoneType.checked) {
//             	document.forms["phone-form"].submit(); // 전화번호 폼 제출
//             }
//         });
    </script>
</body>
</html>
