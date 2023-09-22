<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>공지 게시글 작성</title>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<link rel="stylesheet" href="/resources/css/notice/noticeWrite.css">
	</head>
	<body>
		<jsp:include page="../include/navHeader.jsp"></jsp:include>
		<div  class="notice-board">
			<form class="notice-form" id="notice-form" action="/notice/insert.do" method="POST" enctype="multipart/form-data">
				<div class="notice-board-table">
					<table class="notice-write-table">
						<thead>
							<tr>							
								<td>제목</td>
								<td><input type="text" id="notice-title" name="noticeTitle" size="80" required></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2">
<!-- 								<input type="hidden" id="notice-content" name="noticeContent"> -->
									<textarea class="editor" id="editor" name="noticeContent">
									</textarea>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">
									<button type="submit" class="writeBtn" >공지 올리기</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</form>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
		<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
		<script>
			ClassicEditor
			.create(document.querySelector('#editor'),{
				language: 'ko',
				ckfinder: {
					uploadUrl : '/notice/image.do'
				}

			})
			.catch(error => {
				console.error(error);
			});
			
			$(document).ready(function() {
	            $("#notice-form").submit(function(e) {
	                let pmContent = $("#editor");
	                let regContent = pmContent.val().replace(/<[^>]*>/g, '');
	                if (regContent === null || regContent.trim().length === 0) {
	                    e.preventDefault();
	                    alert("내용을 입력해주세요");
	                } else {
	                    submit(); // submit 함수 호출 (변경된 코드에는 없지만 필요한 경우 추가하세요)
	                }
	            });
	        }); 
		</script>
	</body>
</html>