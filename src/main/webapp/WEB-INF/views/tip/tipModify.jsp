<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>공지 게시글 수정</title>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<link rel="stylesheet" href="/resources/css/tip/tipModify.css">
	</head>
	<body>
		<jsp:include page="../include/navHeader.jsp"></jsp:include>
		<div  class="tip-board">
			<form class="tip-form" action="/tip/update.do" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="tipNo" value="${tip.tipNo }" />
				<div class="tip-board-table">
					<table class="tip-write-table">
						<thead>
							<tr>							
								<td>제목</td>
								<td>
									<input type="text" id="tip-title" name="tipTitle" size="80" value="${tip.tipTitle }">
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2">
									<textarea class="editor" id="editor" name="tipContent">
									${tip.tipContent }
									</textarea>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">
									<button class="updateBtn" >수정하기</button>
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