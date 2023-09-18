<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>공지 게시글 작성</title>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<style>
		.notice-write-table {
			width: 100%;
		}
		.notice-write-table #notice-title{
			width: auto;
		}
		.notice-write-table thead tr{
			line-height: 30px;
		}
		.notice-write-table tbody tr{
			line-height: auto;
		}	
		.ck-editor__editable_inline {
	    	min-height: 400px;
		}
		.notice-board {
			width: 70%;
			height: 100vh; 
			margin: 0 auto;
			background-color: #F8F8F8;
		}
		.notice-form {
			width: 70%;
			height: 100%;
			margin: 0 auto;
			padding-top: 100px;
		}
		.notice-board-table {
			padding: 10px;
		    background-color: white;
		    border-radius: 10px;
		}
		.notice-write-table tr:first-child input {
			height: 30px;
			border: 1px solid #ccc;
	    	border-radius: 5px;
		}
		.notice-write-table tr:first-child td:first-child {
			width: 60px;
			height: 30px;
			text-align: center;
		}
		.writeBtn {
			 background-color: #3881C5;
	         color: #F3F3F3;
	         width: 100px;
	         height: 40px;
	         margin-top: 10px;
	         border: none;
	         border-radius: 8px;
	         font-size: 0.9em;
	         cursor:pointer;
	         float: right;
	         font-weight: bolder;
		}
	</style>
	</head>
	<body>
		<jsp:include page="../include/navHeader.jsp"></jsp:include>
		<div  class="notice-board">
			<form class="notice-form" action="insertNotice.do" method="POST" enctype="multipart/form-data">
				<div class="notice-board-table">
					<table class="notice-write-table">
						<thead>
							<tr>							
								<td>제목</td>
								<td><input type="text" id="notice-title" name="noticeTitle" size="80"></td>
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
									<button class="writeBtn" >공지 올리기</button>
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
					uploadUrl : '/ajax/image.do'
				}

			})
			.catch(error => {
				console.error(error);
			});
			
		</script>
	</body>
</html>