<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/tip/tipDetail.css">
	</head>
	<body>
		<jsp:include page="../include/navHeader.jsp"></jsp:include>
		<div class="tip-container">
			<table class="tip-table">
				<tr>
					<td>제목</td>
					<td colspan="2">${tip.tipTitle }</td>
				</tr>
				<tr>
					<td colspan="3">
						<div id="detail-img">${tip.tipContent }</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" onclick="showListPage();">목록으로</button>
					</td>
					<td>
						<c:if test="${sessionScope.userId eq tip.tipWriter }">
							<button type="button" onclick="showModifyPage();">수정</button>
							<button type="button" onclick="deleteNotice()">삭제</button>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		<script>
			const tipNo = "${tip.tipNo}";
			function showModifyPage() {
				location.href="/tip/modify.do?tipNo=" + tipNo;
			}
			
			function showListPage() {
				location.href="/tip/board.do";
			}
			
			function deleteNotice() {
				
				location.href="/tip/delete.do?tipNo=" + tipNo;
			}
		</script>
	</body>
</html>