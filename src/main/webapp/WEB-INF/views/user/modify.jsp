<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/user/register.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>Document</title>
</head>
<body>
    <div class="container">
        <img src="../resources/images/user/로고.png" id="logo-img" alt="로고이미지">
        <h1>BLUE WAVE</h1>
        <form action="/user/modify.do" method="POST" enctype="multipart/form-data">
            <div id="img-div">
                <label for="profile-image"></label>
                <div class="profile-image-container">
                    <img src="${user.userProfilePath }" id="profile-image-preview" alt="프로필 이미지">
                    <input type="file" id="profile-image" name="uploadFile" >
                    <label for="profile-image" class="upload-icon"><img src="../resources/images/user/카메라아이콘.png" id="camera" class="upload-icon" alt=""></label>
                </div>
            </div>
            <div id="form-top-group">
                <div class="form-top-group">
                    <input type="text" id="user-id" name="userId" placeholder="아이디" value="${user.userId }" readonly>
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
                <input type="text" id="user-nickname" name="userNickName" placeholder="닉네임" value="${user.userNickName }" required>
                <input type="button" class="check-btn" id="nickname-check-btn" value="중복체크">
            </div>
            <div id="form-bottom-group">
                <div class="form-bottom-group">
                    <input type="text" id="user-name" name="userName" placeholder="이름" value="${user.userName }" readonly>
                	<div class="error-message" id="name-error"></div>
                </div>
                <div class="form-bottom-group">
                    <input type="text" id="user-phone" name="userPhone" placeholder="전화번호" value="${user.userPhone }" required>
                	<div class="error-message" id="phone-error"></div>
                </div>
                <div class="form-bottom-group" id="post-div">
			        <input type="text" id="user-addr" name="userAddr" placeholder="주소" value="${user.userAddr }" required>
			        <input type="button" id="post-btn" onclick="sample4_execDaumPostcode();" value="우편번호 찾기">
			    </div>
			    <div class="form-bottom-group" id="email-div">
			        <input type="text" id="user-email" name="userEmail" placeholder="이메일" value="${user.userEmail }" required>
			        <input type="button" class="check-btn" id="get-num-btn" value="인증번호">
			        <input type="text" id="email-check" placeholder="인증번호 6자리">
			        <input type="button" class="check-btn" id="email-check-btn" value="확인">
			    </div>
            </div>
            <div id="ad">
				<input type="checkbox" id="user-ad" name="userAd" value="${user.userAd }">
				<label for="userAd" style="color: rgb(92, 92, 92);">광고 메일 수신 여부</label>
            </div>
            <div class="button-group">
                <button type="submit" id="signup-button"  onclick="setUserAdValue()">수정하기</button>
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
        const pwInput = document.getElementById("user-pw");
        const pwCheckInput = document.getElementById("confirm-pw");
        const nickNameInput = document.getElementById("user-nickName");
        const nameInput = document.getElementById("user-name");
        const phoneInput = document.getElementById("user-phone");
        const addrInput = document.getElementById("user-addr");
        const emailInput = document.getElementById("user-email");
        
        let isIdChecked = false; // 아이디 중복 체크 상태를 나타내는 변수
        let isNickNameChecked = false; // 닉네임 중복 체크 상태를 나타내는 변수
        
     

        // 아이디 입력 시 오류 메시지 초기화
        idInput.addEventListener("input", function() {
            document.getElementById("id-error").textContent = "";
            isIdChecked = false; // 아이디가 변경되면 중복 체크 상태 초기화
        });
        // 비밀번호 입력 시 오류 메시지 초기화
        pwInput.addEventListener("input", function() {
            document.getElementById("pw-error").textContent = "";
        });

        // 비밀번호 확인 입력 시 오류 메시지 초기화
        pwCheckInput.addEventListener("input", function() {
            document.getElementById("pw-match-error").textContent = "";
        });
        // 닉네임 입력 시 오류 메시지 초기화
        nickNameInput.addEventListener("input", function() {
            document.getElementById("nickName-error").textContent = "";
            isNickNameChecked = false; // 닉네임이 변경되면 중복 체크 상태 초기화
        });

        // 이름 입력 시 오류 메시지 초기화
        nameInput.addEventListener("input", function() {
            document.getElementById("name-error").textContent = "";
        });

        // 연락처 입력 시 오류 메시지 초기화
        phoneInput.addEventListener("input", function() {
            document.getElementById("phone-error").textContent = "";
        });
        
        // 주소 입력 시 오류 메시지 초기화
        addrInput.addEventListener("input", function() {
            document.getElementById("phone-error").textContent = "";
        });
        
     // 이메일 입력 시 오류 메시지 초기화
        emailInput.addEventListener("input", function() {
            document.getElementById("email-error").textContent = "";
        });
     
     
      //중복 체크 버튼 클릭 시 아이디 중복 체크
        document.getElementById("id-check-btn").addEventListener("click", function() {
            const id = idInput.value;

            if (id === "") {
                alert("아이디를 입력하세요.");
                return;
            }

            const xhr = new XMLHttpRequest();
            xhr.open("GET", "/user/idCheck.do?user-id=" + encodeURIComponent(id), true);

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        const response = xhr.responseText;
                        if (response === "available") {
                            alert("사용 가능한 아이디입니다.");
                            isIdChecked = true; // 이메일 중복 체크 완료 상태로 설정
                        } else {
                            alert("이미 사용 중인 아이디입니다.");
                        }
                    } else {
                        alert("아이디 체크 중 오류가 발생했습니다.");
                    }
                }
            };
            
            xhr.send();
        });
      
      //중복 체크 버튼 클릭 시 닉네임 중복 체크
        document.getElementById("nickname-check-btn").addEventListener("click", function() {
            const nickName = nickNameInput.value;

            if (nickName === "") {
                alert("닉네임을 입력하세요.");
                return;
            }

            const xhr = new XMLHttpRequest();
            xhr.open("GET", "/user/nickNameCheck.do?user-nickName=" + encodeURIComponent(id), true);

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        const response = xhr.responseText;
                        if (response === "available") {
                            alert("사용 가능한 닉네임입니다.");
                            isNickNameChecked = true; // 닉네임 중복 체크 완료 상태로 설정
                        } else {
                            alert("이미 사용 중인 닉네임입니다.");
                        }
                    } else {
                        alert("닉네임 체크 중 오류가 발생했습니다.");
                    }
                }
            };
            
            xhr.send();
        });
      
     // 다른 필드들의 유효성 검사
        function validateOtherFields() {
            const password = pwInput.value;
            const passwordCheck = pwCheckInput.value;
            const pwError = document.getElementById("pw-error");
            const pwMatchError = document.getElementById("pw-match-error");
            if (!/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/.test(password)) {
                pwError.textContent = "비밀번호는 영문(대소문자)과 숫자, 특수 문자를 포함하여 8~20자여야 합니다.";
                return;
            } else if (password !== passwordCheck) {
                pwMatchError.textContent = "비밀번호가 일치하지 않습니다.";
                return;
            } else {
                pwError.textContent = "";
                pwMatchError.textContent = "";
            }
            
            const name = nameInput.value;
            const nameError = document.getElementById("name-error");
            if (!/^[가-힣]*$/.test(name)) {
                nameError.textContent = "한글만 입력 가능합니다.";
                return;
            } else {
                nameError.textContent = "";
            }

            const phone = phoneInput.value;
            const phoneError = document.getElementById("phone-error");
            if (!/^[0-9]{10,11}$/.test(phone)) {
                phoneError.textContent = "유효한 연락처를 입력하세요.";
                return;
            } else {
                phoneError.textContent = "";
            }
        }
		
     // 회원가입 버튼 클릭 시 실행되는 함수
        function setUserAdValue() {
            // userAd 체크박스 엘리먼트 가져오기
            const userAdCheckbox = document.getElementById("user-ad");

            // userAd 체크박스 상태에 따라 값을 설정
            const userAdValue = userAdCheckbox.checked ? "Y" : "N";

            // 값을 입력 필드에 설정하거나, 필요한 곳에 전달하십시오.
            // 예를 들어, 아래와 같이 폼의 숨겨진 필드에 설정할 수 있습니다.
            const hiddenUserAdField = document.getElementById("hidden-user-ad");
            hiddenUserAdField.value = userAdValue;


            
         // 폼을 서버로 제출
            const form = document.querySelector("form");
            form.submit();

        }



    </script>
</body>
</html>