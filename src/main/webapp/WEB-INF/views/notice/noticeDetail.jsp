<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/notice/noticeDetail.css">
	</head>
	<body>
		<jsp:include page="../include/navHeader.jsp"></jsp:include>
		<div class="notice-container">
			<table class="notice-table">
				<tr>
					<td>제목</td>
					<td colspan="2">${notice.noticeTitle }</td>
				</tr>
				<tr>
					<td colspan="3">
						<div id="detail-img">${notice.noticeContent }</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" onclick="showListPage();">목록으로</button>
					</td>
					<td>
						<c:if test="${sessionScope.userId eq 'admin' }">
							<button type="button" onclick="showModifyPage();">수정</button>
							<button type="button" onclick="deleteNotice()">삭제</button>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		<script>
			const noticeNo = "${notice.noticeNo}";
			function showModifyPage() {
				location.href="/notice/modify.do?noticeNo=" + noticeNo;
			}
			
			function showListPage() {
				location.href="/notice/board.do";
			}
			
			function deleteNotice() {
				
				location.href="/notice/delete.do?noticeNo=" + noticeNo;
			}
		</script>
	</body>
</html>