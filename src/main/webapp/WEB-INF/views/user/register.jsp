<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/register.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>Document</title>
</head>
<body>
    <div class="container">
        <img src="../resources/images/user/로고.png" id="logo-img" alt="로고이미지">
        <h1>BLUE WAVE</h1>
        <form action="/user/register.do" method="POST" enctype="multipart/form-data">
            <div id="img-div">
                <label for="profile-image"></label>
                <div class="profile-image-container">
                    <img src="../../resources/images/user/프로필이미지.png" id="profile-image-preview" alt="프로필 이미지">
                    <input type="file" id="profile-image" name="uploadFile" >
                    <label for="profile-image" class="upload-icon"><img src="../resources/images/user/카메라아이콘.png" id="camera" class="upload-icon" alt=""></label>
                </div>
            </div>
            <div id="form-top-group">
                <div class="form-top-group">
                    <input type="text" id="user-id" name="userId" placeholder="아이디" required>
                    <<div class="error-message" id="id-error"></div>
                </div>
                <div class="form-top-group">
                    <input type="password" id="user-pw" name="userPw" placeholder="비밀번호" required>
                	<div class="error-message" id="pw-error"></div>
                </div>
                <div class="form-top-group">
                    <input type="password" id="confirm-pw" name="confirm-pw" placeholder="비밀번호 확인" required>
                	<div class="error-message" id="pw-match-error"></div>
                </div>
            </div>
            <div id="form-group">
                <input type="text" id="user-nickname" name="userNickName" placeholder="닉네임" required>
                <input type="button" class="check-btn" id="nickname-check-btn" value="중복체크">
            </div>
            <div id="form-bottom-group">
                <div class="form-bottom-group">
                    <input type="text" id="user-name" name="userName" placeholder="이름" required>
                	<div class="error-message" id="name-error"></div>
                </div>
                <div class="form-bottom-group">
                    <input type="text" id="user-phone" name="userPhone" placeholder="전화번호" required>
                	<div class="error-message" id="phone-error"></div>
                </div>
                <div class="form-bottom-group" id="post-div">
			        <input type="text" id="user-addr" name="userAddr" placeholder="주소" required>
			        <input type="button" id="post-btn" onclick="sample4_execDaumPostcode();" value="우편번호 찾기">
			    </div>
			    <div class="form-bottom-group" id="email-div">
			        <input type="text" id="user-email" name="userEmail" placeholder="이메일" required>
			        <input type="button" class="check-btn" id="get-num-btn" value="인증번호">
			        <input type="text" id="email-check" placeholder="인증번호 6자리">
			        <input type="button" class="check-btn" id="email-check-btn" value="확인">
			    </div>
            </div>
            <div id="ad">
				<input type="checkbox" id="user-ad" name="userAd" value="Y">
				<label for="userAd" style="color: rgb(92, 92, 92);">광고 메일 수신 여부</label>
            </div>
            <div class="button-group">
                <button type="submit" id="signup-button"  onclick="setUserAdValue()">회원가입</button>
                <button type="button" id="cancel-button">취소</button>
            </div>
            
        </form>
    </div>
    <script>
//         // 이미지 업로드 및 미리보기 관련 JavaScript
        const profileImageInput = document.getElementById('profile-image');
        const profileImagePreview = document.getElementById('profile-image-preview');
        const defaultProfileImage = 'default-profile-image.jpg';

        profileImageInput.addEventListener('change', (e) => {
            const file = e.target.files[0];

            if (file) {
                const reader = new FileReader();

                reader.onload = (e) => {
                    profileImagePreview.src = e.target.result;
                };

                reader.readAsDataURL(file);
            } else {
                // 이미지가 선택되지 않았을 때 디폴트 이미지로 변경
                profileImagePreview.src = defaultProfileImage;
            }
        });

        // 주소 api
		function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            const fullAddress = data.address; // 선택한 주소
            document.getElementById("user-addr").value = fullAddress; // 주소 입력란에 주소 설정
        },
    }).open();
}
        
		const idInput = document.getElementById("user-id");
		const emailInput = document.getElementById("user-email");
		const nicknameInput = document.getElementById("user-nickname");

		// 아이디 입력 필드가 변경될 때마다 중복 체크 요청을 보내는 함수
		idInput.addEventListener("input", function() {
		    const userId = this.value;

		    // 서버로 아이디 중복 체크 요청을 보내는 부분
		    checkDuplicate("user-id", userId, "아이디");
		});

		// 이메일 입력 필드가 변경될 때마다 중복 체크 요청을 보내는 함수
		emailInput.addEventListener("input", function() {
		    const userEmail = this.value;

		    // 이메일 형식 검사
		    const emailError = document.getElementById("email-error");
		    if (!validateEmail(userEmail)) {
		        emailError.textContent = "유효한 이메일 주소를 입력하세요.";
		        return;
		    } else {
		        emailError.textContent = "";
		    }

		    // 서버로 이메일 중복 체크 요청을 보내는 부분
		    checkDuplicate("user-email", userEmail, "이메일");
		});

		// 닉네임 입력 필드가 변경될 때마다 중복 체크 요청을 보내는 함수
		nicknameInput.addEventListener("input", function() {
		    const userNickname = this.value;

		    // 서버로 닉네임 중복 체크 요청을 보내는 부분
		    checkDuplicate("user-nickname", userNickname, "닉네임");
		});

		// 중복 체크 요청을 보내고 결과를 처리하는 함수
		function checkDuplicate(inputId, value, field) {
		    const errorElement = document.getElementById(inputId + "-error");

		    const xhr = new XMLHttpRequest();
		    xhr.open("GET", "/user/checkDuplicate.do?field=" + field + "&value=" + encodeURIComponent(value), true);

		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                const response = JSON.parse(xhr.responseText);
		                if (response.available) {
		                    errorElement.textContent = field + " 사용 가능합니다.";
		                } else {
		                    errorElement.textContent = field + " 이미 사용 중입니다.";
		                }
		            } else {
		            	const errorElement = document.getElementById(inputId + "-error");
		                if (errorElement) {
		                    errorElement.textContent = field + " 체크 중 오류가 발생했습니다.";
		                }
		            }
		        }
		    };
		    
		    xhr.send();
		}

		// 이메일 형식 검사 함수
		function validateEmail(email) {
		    const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		    return emailPattern.test(email);
		}
    </script>
</body>
</html>