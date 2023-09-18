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
        <img src="../resources/images/user/로고.png" id="logo-img" alt="로고이미지">
        <div id="order">
            <span id="order-1">본인확인</span>
            <span id="order-2">아이디 조회</span>
        </div>
        <form action="/user/findId1.do" method="POST" id="email-form" name="email-form" >
        <div class="type-group">
            <label for="email-type"></label>
            <input type="radio" name="confirmType" id="email-type" value="emailType"> 회원 정보에 저장한 이메일로 인증
        </div>
            <div id="email-input" class="form-group" style="display: none;">
                <input type="text" id="user-name-email" name="userName" placeholder="이름" required>
                <input type="text" id="user-email" name="userEmail" placeholder="이메일" required>
            </div>
        <div class="type-group">
            <label for="phoneType"></label>
            <input type="radio" name="confirmType" id="phone-type" value="phoneType"> 회원 정보에 저장한 전화번호로 인증
        </div>
            <div id="phone-input" class="form-group" style="display: none;">
                <input type="text" id="user-name-phone" name="userName" placeholder="이름" required disabled>
                <input type="text" id="user-phone" name="userPhone" placeholder="전화번호" required disabled>
            </div>
        </form>
        <button type="button" class="login-button" id="submit-button">확인</button>
    </div>
    <script>
    const emailType = document.getElementById('email-type');
    const emailInputDiv = document.getElementById('email-input');
    const phoneType = document.getElementById('phone-type');
    const phoneInputDiv = document.getElementById('phone-input');
    const submitButton = document.getElementById('submit-button');

    emailType.addEventListener('change', function() {
        if (emailType.checked) {
            emailInputDiv.style.display = 'block';
            phoneInputDiv.style.display = 'none'; // 전화번호 입력 div를 숨깁니다.
            document.getElementById('user-name-email').removeAttribute('disabled');
            document.getElementById('user-email').removeAttribute('disabled');
            document.getElementById('user-name-phone').setAttribute('disabled', 'disabled');
            document.getElementById('user-phone').setAttribute('disabled', 'disabled');
        }
    });

    phoneType.addEventListener('change', function() {
        if (phoneType.checked) {
            emailInputDiv.style.display = 'none'; // 이메일 입력 div를 숨깁니다.
            phoneInputDiv.style.display = 'block';
            document.getElementById('user-name-phone').removeAttribute('disabled');
            document.getElementById('user-phone').removeAttribute('disabled');
            document.getElementById('user-name-email').setAttribute('disabled', 'disabled');
            document.getElementById('user-email').setAttribute('disabled', 'disabled');
        }
    });

    submitButton.addEventListener('click', function() {
        // 선택한 폼에 대한 데이터를 서버로 전송
        if (emailType.checked) {
            document.forms["email-form"].submit();
        } else if (phoneType.checked) {
            document.forms["phone-form"].submit();
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
