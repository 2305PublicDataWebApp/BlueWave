<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <img src="../resources/images/logo-img.png" id="logo-img" alt="로고이미지">
        <h1>BLUE WAVE</h1>
        <form action="/user/modify.do" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="userProfileName" value="${user.userProfileName }">
		<input type="hidden" name="userProfileRename" value="${user.userProfileRename }">
		<input type="hidden" name="userProfilePath" value="${user.userProfilePath }">
		<input type="hidden" name="userProfileLength" value="${user.userProfileLength }">
            <div id="img-div">
                <label for="profile-image"></label>
                <div class="profile-image-container">
                    <img src="../../resources/images/user/profile.png" id="profile-image-preview" alt="프로필 이미지">
                    <input type="file" id="profile-image" name="uploadFile" >
                    <label for="profile-image" class="upload-icon"><img src="../resources/images/user/camera.png" id="camera" class="upload-icon" alt=""></label>
                </div>
            </div>
            <div id="form-top-group">
                <div class="form-top-group">
                    <input type="text" id="user-id" name="userId" placeholder="아이디" value="${user.userId }" readonly>
                    <div class="result-message" id="id-error"></div>
                </div>
                <div class="form-top-group">
                    <input type="password" id="user-pw" name="userPw" placeholder="비밀번호" required>
                	<div class="result-message" id="pw-error"></div>
                </div>
                <div class="form-top-group">
                    <input type="password" id="confirm-pw" name="confirm-pw" placeholder="비밀번호 확인" required>
                	<div class="result-message" id="pw-match-error"></div>
                </div>
            </div>
            <div id="form-group">
                <input type="text" id="user-nickname" name="userNickName" placeholder="닉네임" value="${user.userNickName }" required>
                <div class="result-message" id="nickName-error"></div>
            </div>
            <div id="form-bottom-group">
                <div class="form-bottom-group">
                    <input type="text" id="user-name" name="userName" placeholder="이름" value="${user.userName }" readonly>
                	<div class="result-message" id="name-error"></div>
                </div>
                <div class="form-bottom-group">
                    <input type="text" id="user-phone" name="userPhone" placeholder="전화번호" value="${user.userPhone }" required>
                	<div class="result-message" id="phone-error"></div>
                </div>
                <div class="form-bottom-group" id="post-div">
			        <input type="text" id="user-addr" name="userAddr" placeholder="주소" value="${user.userAddr }" required>
			        <div class="result-message" id="phone-error"></div>
			        <input type="button" id="post-btn" onclick="sample4_execDaumPostcode();" value="우편번호 찾기">
			    </div>
			    <div class="form-bottom-group" id="email-div">
			        <input type="text" id="user-email" name="userEmail" placeholder="이메일" value="${user.userEmail }" required>
			        <div class="result-message" id="email-error"></div>
<!-- 			        <input type="text" id="email-check" placeholder="인증번호 6자리"> -->
			    </div>
            </div>
            <div id="ad">
				<input type="checkbox" id="user-ad" name="userAd" value="Y">
				<label for="userAd" style="color: rgb(92, 92, 92);">광고 메일 수신 여부</label>
            </div>
            <div class="button-group">
                <button type="submit" id="signup-button"  onclick="setUserAdValue()">회원정보 수정</button>
                <button type="button" id="cancel-button" onclick="goBack()">취소</button>
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
        
		document.addEventListener("DOMContentLoaded", function () {
		    const idInput = document.getElementById("user-id");
		    const passwordInput = document.getElementById("user-pw");
		    const confirmPwInput = document.getElementById("confirm-pw");
		    const nicknameInput = document.getElementById("user-nickname");
		    const emailInput = document.getElementById("user-email");
		    const nameInput = document.getElementById("user-name");
		    const phoneInput = document.getElementById("user-phone");
		    const addrInput = document.getElementById("user-addr");
		    const signupButton = document.getElementById("signup-button");

		    // 아이디 중복 체크 여부 변수
		    let isIdChecked = false;
		    // 닉네임 중복 체크 여부 변수
		    let isNickNameChecked = false;
		    // 이메일 중복 체크 여부 변수
		    let isEmailChecked = false;

		    // 비밀번호 유효성 검사 함수
		    function isPasswordValid(password) {
		        // 비밀번호는 8~20자의 대소문자를 포함해야 합니다.
		        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z]).{8,20}$/;
		        return passwordRegex.test(password);
		    }

		    // 비밀번호와 비밀번호 확인 일치 여부 확인 함수
		    function doPasswordsMatch(password, confirmPassword) {
		        return password === confirmPassword;
		    }

		    // 입력란에서 입력이 발생할 때 비밀번호 유효성 검사
		    passwordInput.addEventListener("input", function () {
		        const password = passwordInput.value;
		        const passwordError = document.getElementById("pw-error");

		        // 비밀번호 유효성 검사
		        if (!isPasswordValid(password)) {
		            passwordError.textContent = "비밀번호는 8~20자의 대소문자를 포함해야 합니다.";
		        } else {
		            passwordError.textContent = "";
		        }
		    });

		    // 입력란에서 입력이 발생할 때 비밀번호 확인 일치 여부 확인
		    confirmPwInput.addEventListener("input", function () {
		        const password = passwordInput.value;
		        const confirmPassword = confirmPwInput.value;
		        const pwMatchError = document.getElementById("pw-match-error");

		        // 비밀번호 확인과 비교하여 일치 여부 확인
		        if (!doPasswordsMatch(password, confirmPassword)) {
		            pwMatchError.textContent = "비밀번호와 비밀번호 확인이 일치하지 않습니다.";
		        } else {
		            pwMatchError.textContent = "";
		        }
		    });
		    
		 // 입력란에서 입력이 발생할 때 이름 유효성 검사
	        nameInput.addEventListener("input", function () {
	            const name = nameInput.value;
	            const nameError = document.getElementById("name-error");

	            // 이름 유효성 검사 (예: 최소 2자 이상)
	            if (name.length < 2) {
	                nameError.textContent = "이름은 최소 2자 이상 입력해주세요.";
	            } else {
	                nameError.textContent = "";
	            }
	        });

	        // 입력란에서 입력이 발생할 때 전화번호 유효성 검사
	        phoneInput.addEventListener("input", function () {
	            const phone = phoneInput.value;
	            const phoneError = document.getElementById("phone-error");

	            // 전화번호 유효성 검사 (예: 숫자로만 이루어져야 함)
	            if (!/^\d+$/.test(phone)) {
	                phoneError.textContent = "숫자만 입력 가능합니다.";
	            } else {
	                phoneError.textContent = "";
	            }
	        });

	        // 입력란에서 입력이 발생할 때 주소 유효성 검사
	        addrInput.addEventListener("input", function () {
	            const address = addrInput.value;
	            const addrError = document.getElementById("addr-error");

	            // 주소 유효성 검사 (예: 최소 5자 이상)
	            if (address.length < 5) {
	                addrError.textContent = "주소는 최소 5자 이상 입력해주세요.";
	            } else {
	                addrError.textContent = "";
	            }
	        });

		    // 아이디 중복 체크
		    idInput.addEventListener("input", function () {
		        const id = idInput.value;
		        const idError = document.getElementById("id-error");
		        idError.textContent = ""; // 에러 메시지 초기화

		        if (id === "") {
		            return; // 아이디가 입력되지 않았을 때 체크 중단
		        }

		        const xhr = new XMLHttpRequest();
		        xhr.open("GET", "/user/idCheck.do?userId=" + encodeURIComponent(id), true);

		        xhr.onreadystatechange = function () {
		            if (xhr.readyState === XMLHttpRequest.DONE) {
		                if (xhr.status === 200) {
		                    const response = xhr.responseText;
		                    if (response === "alreadyTaken") {
		                        idError.textContent = "이미 사용 중인 아이디입니다.";
		                    } else if (response === "available") {
		                        idError.textContent = "";
		                        isIdChecked = true; // 아이디 중복 체크 완료
		                    } else {
		                        idError.textContent = "아이디 체크 중 오류가 발생했습니다.";
		                    }
		                } else {
		                    idError.textContent = "아이디 체크 중 오류가 발생했습니다.";
		                }
		            }
		        };

		        xhr.send();
		    });

		 // 닉네임 중복 체크 및 유효성 검사 함수
		    function checkNicknameValidity(nickName) {
		        const nickNameError = document.getElementById("nickName-error");
		        nickNameError.textContent = ""; // 에러 메시지 초기화

		        const xhr = new XMLHttpRequest();
		        xhr.open("GET", "/user/nickNameCheck.do?userNickName=" + encodeURIComponent(nickName), true);

		        xhr.onreadystatechange = function () {
		            if (xhr.readyState === XMLHttpRequest.DONE) {
		                if (xhr.status === 200) {
		                    const response = xhr.responseText;
		                    if (response === "alreadyTaken") {
		                        nickNameError.textContent = "이미 사용 중인 닉네임입니다.";
		                    } else if (response === "available") {
		                        nickNameError.textContent = "";
		                        isNickNameChecked = true; // 닉네임 중복 체크 완료
		                    } else {
		                        nickNameError.textContent = "닉네임 체크 중 오류가 발생했습니다.";
		                    }
		                } else {
		                    nickNameError.textContent = "닉네임 체크 중 오류가 발생했습니다.";
		                }
		            }
		        };

		        xhr.send();
		    }

		    // 입력란에서 입력이 발생할 때 닉네임 중복 체크 및 유효성 검사
		    nicknameInput.addEventListener("input", function () {
		        const nickName = nicknameInput.value;
		        checkNicknameValidity(nickName);
		    });


		    // 입력란에서 입력이 발생할 때 이메일 중복 체크
		    emailInput.addEventListener("input", function () {
		        const email = emailInput.value;
		        const emailError = document.getElementById("email-error");
		        emailError.textContent = ""; // 에러 메시지 초기화

		        const xhr = new XMLHttpRequest();
		        xhr.open("GET", "/user/emailCheck.do?userEmail=" + encodeURIComponent(email), true);

		        xhr.onreadystatechange = function () {
		            if (xhr.readyState === XMLHttpRequest.DONE) {
		                if (xhr.status === 200) {
		                    const response = xhr.responseText;
		                    if (response === "alreadyTaken") {
		                        emailError.textContent = "이미 사용 중인 이메일입니다.";
		                    } else if (response === "available") {
		                        emailError.textContent = "사용 가능한 이메일입니다.";
		                        isEmailChecked = true; // 이메일 중복 체크 완료
		                    } else {
		                        emailError.textContent = "이메일 체크 중 오류가 발생했습니다.";
		                    }
		                } else {
		                    emailError.textContent = "이메일 체크 중 오류가 발생했습니다.";
		                }
		            }
		        };

		        xhr.send();
		    });

		    // 회원가입 버튼 클릭 시 유효성 검사 및 중복 체크 여부 확인
		    signupButton.addEventListener("click", function (event) {
		        // 기본 동작 중지 (폼 전송 방지)
		        event.preventDefault();

		        // 아이디 중복 체크 여부 확인
		        if (!isIdChecked) {
		            idError.textContent = "아이디 중복 체크를 먼저 진행해주세요.";
		            return;
		        }

		        // 닉네임 중복 체크 여부 확인
		        if (!isNickNameChecked) {
		            nickNameError.textContent = "닉네임 중복 체크를 먼저 진행해주세요.";
		            return;
		        }

		        // 이메일 중복 체크 여부 확인
		        if (!isEmailChecked) {
		            emailError.textContent = "이메일 중복 체크를 먼저 진행해주세요.";
		            return;
		        }

		     

		        // 회원가입 버튼 클릭 시 모든 필드의 유효성 검사 및 중복 체크 여부 확인
		        signupButton.addEventListener("click", function (event) {
		            // 기본 동작 중지 (폼 전송 방지)
		            event.preventDefault();

		            // 아이디 중복 체크 여부 확인
		            if (!isIdChecked) {
		                idError.textContent = "아이디 중복 체크를 먼저 진행해주세요.";
		                return;
		            }

		            // 닉네임 중복 체크 여부 확인
		            if (!isNickNameChecked) {
		                nickNameError.textContent = "닉네임 중복 체크를 먼저 진행해주세요.";
		                return;
		            }

		            // 이메일 중복 체크 여부 확인
		            if (!isEmailChecked) {
		                emailError.textContent = "이메일 중복 체크를 먼저 진행해주세요.";
		                return;
		            }

		           

		            // 모든 유효성 검사를 통과하면 폼을 서버로 제출합니다.
		            event.target.form.submit();
		        });
		    });
		});
		
		 function goBack() {
	            window.history.back();
	        }
    </script>
</body>
</html>