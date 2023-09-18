<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>굿즈 게시글 작성</title>
	<link rel="stylesheet" href="/resources/css/goods/goodsWrite.css">
	</head>
	<body>
		<jsp:include page="../include/navHeader.jsp"></jsp:include>
		<div  class="goods-board">
			<form class="goods-form" action="/goods/insert.do" method="POST" enctype="multipart/form-data">
				<div class="goods-board-table">
					<table class="goods-write-table">
						<thead>
							<tr>							
								<td>제목</td>
								<td><input type="text" id="goods-name" name="productName" size="80"></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2">
									<label>설명</label>
									<textarea name="productContent"></textarea>
								</td>
								<td colspan="2">
									<label>가격</label>
									<input type="text" name="productPoint" />
								</td>
								<td colspan="2">
									<label>재고 수</label>
									<input type="text" name="productCount" />
								</td>
								<td colspan="2">
									<label>썸네일</label>
									<input type="file" name="productThumbnail">
								</td>
								<td colspan="2">
									<label>이미지</label>
									<input type="file" name="productImage">
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">
									<button class="writeBtn" >굿즈 올리기</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</form>
		</div>
	</body>
</html>