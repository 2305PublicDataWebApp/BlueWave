<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/findId1.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <title>findId1</title>
</head>
<body>
    <div class="container">
        <img src="../resources/images/로고.png" id="logo-img" alt="로고이미지">
        <div id="order">
            <span id="order-1">본인확인</span> > 
            <span id="order-2">아이디 조회</span>
        </div>
        <form action="/user/findId1.do" method="POST">
            <div id="email-input" class="form-group">
                <input type="text" id="user-name" name="userName" placeholder="이름" required>
                <input type="text" id="user-email" name="userEmail" placeholder="이메일" required>
                <button id="getNoBtn">인증번호받기</button>
            </div>
            <div id="check-input">
                <input type="text" id="confirm-no" placeholder="인증번호" required>
                <button id="ConfirmBtn">확인</button>
            </div>
            <button type="submit" id="next-button" style="display: block;">확인</button>
        </form>
    </div>
    <script>
//     $('#mail-Check-Btn').click(function() {
// 		const email = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
// 		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
// 		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
// 		$.ajax({
// 			type : 'get',
// 			url: '/user/mailCheck.do?email=' + email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
// 			success : function (data) {
// 				console.log("data : " +  data);
// 				checkInput.attr('disabled',false);
// 				code =data;
// 				alert('인증번호가 전송되었습니다.')
// 			}			
// 		}); // end ajax
// 	}); // end send eamil
	
// 	// 인증번호 비교 
// 	// blur -> focus가 벗어나는 경우 발생
// 	$('.mail-check-input').blur(function () {
// 		const inputCode = $(this).val();
// 		const $resultMsg = $('#mail-check-warn');
		
// 		if(inputCode === code){
// 			$resultMsg.html('인증번호가 일치합니다.');
// 			$resultMsg.css('color','green');
// 			$('#mail-Check-Btn').attr('disabled',true);
// 			$('#userEamil1').attr('readonly',true);
// 			$('#userEamil2').attr('readonly',true);
// 			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
// 	         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
// 		}else{
// 			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
// 			$resultMsg.css('color','red');
// 		}
// 	});
    </script>
</body>
</html>
