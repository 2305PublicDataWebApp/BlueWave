<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>굿즈 게시글 수정</title>
	<link rel="stylesheet" href="/resources/css/goods/goodsWrite.css">
	</head>
	<body>
		<jsp:include page="../include/navHeader.jsp"></jsp:include>
		<div  class="goods-board">
			<form class="goods-form" action="/goods/modify.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="productNo" value="${goods.productNo }">
			<!-- 기존 업로드 파일 체크할 때 사용 -->
			<input type="hidden" name="productThumbnail" value="${goods.productThumbnail }">
			<input type="hidden" name="productThumbnailRename" value="${goods.productThumbnailRename }">
			<input type="hidden" name="productThumbnailPath" value="${goods.productThumbnailPath }">
			<input type="hidden" name="productThumbnailLength" value="${goods.productThumbnailLength }">
			<input type="hidden" name="productImage" value="${goods.productImage }">
			<input type="hidden" name="productImageRename" value="${goods.productImageRename }">
			<input type="hidden" name="productImagePath" value="${goods.productImagePath }">
			<input type="hidden" name="productImageLength" value="${goods.productImageLength }">
				<div class="goods-board-table">
					<table class="goods-write-table">
						<thead>
							<tr>							
								<td>제목</td>
								<td><input type="text" id="goods-name" name="productName" size="80" value="${goods.productName }"></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2">
									<label>설명</label>
									<textarea name="productContent">${goods.productContent }</textarea>
								</td>
								<td colspan="2">
									<label>가격</label>
									<input type="text" name="productPoint" value="${goods.productPoint }"/>
								</td>
								<td colspan="2">
									<label>재고 수</label>
									<input type="text" name="productCount" value="${goods.productCount }"/>
								</td>
								<td colspan="2">
									<label>썸네일</label>
									<input type="file" name="pThumbnail" value="${goods.productThumbnailRename }">
								</td>
								<td colspan="2">
									<label>이미지</label>
									<input type="file" name="pImage" value="${goods.productImageRename }">
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">
									<button type="submit" class="writeBtn" >굿즈 올리기</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</form>
		</div>
	</body>
</html>