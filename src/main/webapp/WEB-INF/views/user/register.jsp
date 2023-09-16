<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/user/register.css">
    <title>Document</title>
</head>
<body>
    <div class="container">
        <img src="../resources/images/user/로고.png" id="logo-img" alt="로고이미지">
        <h1>BLUE WAVE</h1>
        <form action="/user/register.do" method="POST">
            <div id="img-div">
                <label for="profile-image"></label>
                <div class="profile-image-container">
                    <img src="../resources/images/user/프로필이미지.png" id="profile-image-preview" alt="프로필 이미지">
                    <input type="file" id="profile-image" name="profile-image" accept="image/*" style="display: none;">
                    <label for="profile-image" class="upload-icon"><img src="../resources/images/카메라아이콘.png" id="camera" class="upload-icon" alt=""></label>
                </div>
            </div>
            <div id="form-top-group">
                <div class="form-top-group">
                    <input type="text" id="user-id" name="userId" placeholder="아이디" required>
                    <input type="button" class="check-btn" id="id-check-btn" value="중복체크">
                </div>
                <div class="form-top-group">
                    <input type="password" id="user-pw" name="userPw" placeholder="비밀번호" required>
                </div>
                <div class="form-top-group">
                    <input type="password" id="confirm-pw" name="confirm-pw" placeholder="비밀번호 확인" required>
                </div>
            </div>
            <div id="form-group">
                <input type="text" id="user-nickname" name="userNickname" placeholder="닉네임" required>
                <input type="button" class="check-btn" id="nickname-check-btn" value="중복체크">
            </div>
            <div id="form-bottom-group">
                <div class="form-bottom-group">
                    <input type="text" id="user-name" name="userName" placeholder="이름" required>
                </div>
                <div class="form-bottom-group">
                    <input type="text" id="user-phone" name="userPhone" placeholder="전화번호" required>
                </div>
                <div class="form-bottom-group">
                    <input type="text" id="user-addr" name="userAddr" placeholder="주소" required>
                    <input type="button" id="post-btn" onclick="sample4_execDaumPostcode();" value="우편번호 찾기">
                </div>
                <div class="form-bottom-group">
				    <input type="email" id="user-email" name="userEmail" placeholder="이메일" required>
				</div>
				
				<!-- 이메일 인증 관련 폼 -->
				<div class="form-bottom-group">
				    <input type="text" id="email-check" placeholder="인증번호 6자리" >
				    <input type="button" class="check-btn" id="email-check-btn" value="확인">
				    <div>
				        <span id="mail-check-warn"></span>
				    </div>
				</div>
            </div>
            <div id="ad">
                <input type="checkbox" id="user-ad" name="userAd">
                <label for="userAd" style="color: rgb(92, 92, 92);">광고 메일 수신 여부</label>
            </div>
            <div class="button-group">
                <button type="submit" id="signup-button">회원가입</button>
                <button type="button" id="cancel-button">취소</button>
            </div>
            
        </form>
    </div>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        // 이미지 업로드 및 미리보기 관련 JavaScript
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
        function sample4_execDaumPostcode(){
            new daum.Postcode({
                oncomplete : function(data){
                    document.querySelector("#memberAddress")
                    .value = "(" + data.zonecode + ") " + data.jibunAddress + ", " + data.buildingName;
                }
            }).open();
        }


//         // 아이디 중복 체크 상태 변수
//         let isIdChecked = false;

//         // 아이디 중복 체크 버튼 클릭 시 동작
//         document.getElementById("id-check-btn").addEventListener("click", function() {
//             const idInput = document.getElementById("user-id");
//             const id = idInput.value;

//             // 입력값이 비어있는지 확인
//             if (id === "") {
//                 alert("아이디를 입력하세요.");
//                 return;
//             }

//             // 아이디 중복 체크를 이미 한 경우 다시 체크할 수 없도록
//             if (isIdChecked) {
//                 alert("이미 아이디 중복 체크를 완료했습니다.");
//                 return;
//             }

//             // AJAX를 사용하여 서버로 아이디 중복 체크 요청 보내기
//             const xhr = new XMLHttpRequest();
//             xhr.open("GET", "/member/idSameCheck.do?memberId=" + encodeURIComponent(id), true);

//             xhr.onreadystatechange = function() {
//                 if (xhr.readyState === XMLHttpRequest.DONE) {
//                     if (xhr.status === 200) {
//                         const response = xhr.responseText;
//                         if (response === "available") {
//                             alert("사용 가능한 아이디입니다.");
//                             isIdChecked = true; // 아이디 중복 체크 완료 상태로 설정
//                         } else {
//                             alert("이미 사용 중인 아이디입니다.");
//                         }
//                     } else {
//                         alert("아이디 체크 중 오류가 발생했습니다.");
//                     }
//                 }
//             };
            
//             xhr.send();
//         });

//         // 비밀번호와 비밀번호 확인 일치 여부 검사
//         const passwordInput = document.getElementById("user-pw");
//         const confirmPasswordInput = document.getElementById("confirm-pw");

//         confirmPasswordInput.addEventListener("blur", function() {
//             const password = passwordInput.value;
//             const confirmPassword = confirmPasswordInput.value;

//             if (password !== confirmPassword) {
//                 alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
//                 confirmPasswordInput.focus();
//             }
//         });

//         // 비밀번호 유효성 검사: 영문(대소문자)와 숫자, 특수 문자 포함, 8~20자
//         passwordInput.addEventListener("blur", function() {
//             const password = passwordInput.value;
//             const passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;

//             if (!passwordPattern.test(password)) {
//                 alert("비밀번호는 영문(대소문자)와 숫자, 특수 문자를 포함하여 8~20자여야 합니다.");
//                 passwordInput.focus();
//             }
//         });

//         // 연락처 유효성 검사: 숫자만 허용
//         const phoneInput = document.getElementById("user-phone");
//         phoneInput.addEventListener("blur", function() {
//             const phone = phoneInput.value;
//             const phonePattern = /^\d+$/;

//             if (!phonePattern.test(phone)) {
//                 alert("올바른 연락처를 입력하세요.");
//                 phoneInput.focus();
//             }
//         });

//         // 이름 유효성 검사: 한글만 허용
//         const nameInput = document.getElementById("user-name");
//         nameInput.addEventListener("blur", function() {
//             const name = nameInput.value;
//             const namePattern = /^[가-힣]+$/;

//             if (!namePattern.test(name)) {
//                 alert("이름은 한글만 허용됩니다.");
//                 nameInput.focus();
//             }
//         });

	        // 이메일 본인 인증
			$('#mail-Check-Btn').click(function() {
			const eamil = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
			console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
			const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
			
			$.ajax({
				type : 'get',
				url : '<c:url value ="/user/mailCheck?email="/>'+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
				success : function (data) {
					console.log("data : " +  data);
					checkInput.attr('disabled',false);
					code =data;
					alert('인증번호가 전송되었습니다.')
				}			
			}); // end ajax
		}); // end send e
    </script>
</body>
</html>