<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>공지 게시글 작성</title>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<link rel="stylesheet" href="/resources/css/tip/tipWrite.css">
	</head>
	<body>
		<jsp:include page="../include/navHeader.jsp"></jsp:include>
		<div  class="tip-board">
			<form class="tip-form" action="/tip/insert.do" method="POST" enctype="multipart/form-data">
				<div class="tip-board-table">
					<table class="tip-write-table">
						<thead>
							<tr>							
								<td>제목</td>
								<td><input type="text" id="tip-title" name="tipTitle" size="80"></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2">
<!-- 								<input type="hidden" id="tip-content" name="tipContent"> -->
									<textarea class="editor" id="editor" name="tipContent">
									</textarea>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">
								<input type="hidden" name="tipWriter" value="${sessionScope.userId }">
									<button class="writeBtn" >글 등록</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</form>
		</div>
		<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
		<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
		<script>
			ClassicEditor
			.create(document.querySelector('#editor'),{
				language: 'ko',
				ckfinder: {
					uploadUrl : '/tip/image.do'
				}

			})
			.catch(error => {
				console.error(error);
			});
			
		</script>
	</body>
</html>