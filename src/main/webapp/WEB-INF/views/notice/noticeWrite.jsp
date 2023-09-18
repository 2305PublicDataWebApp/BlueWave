<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>공지 게시글 작성</title>
	<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/ckeditor/translations/ko.js"></script> --%>
	<style>
		.notice-write-table {
			width: 100%;
		}
		.notice-write-table #title{
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
			width: 700px;
			height: 500px; 
			margin: 0 auto;
		}
		.notice-form {
			width: 60%;
			--height: 100%;
			margin: 0 auto;
			padding-top: 150px;
			--background-color: white;
		}
	</style>
	</head>
	<body>
		<jsp:include page="../include/navHeader.jsp"></jsp:include>
		<div>
			<form class="notice-form">
				<div class="notice-board">
					<table class="notice-write-table">
						<thead>
							<tr>							
								<td>제목</td>
								<td><input type="text" id="title" name="title" size="80"></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2">
									<input type="hidden" id="content" name="content">
									<textarea rows="30" cols="80" name="editor" id="editor">
									</textarea>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4" class="align-center">
									<button id="writeBtn" >공지 올리기</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</form>
		</div>
		<script>
			ClassicEditor
			.create(document.querySelector('#editor'),{
				language: 'ko'
			})
			.catch( error => {
				console.log( error );
			});
		</script>
	</body>
</html>