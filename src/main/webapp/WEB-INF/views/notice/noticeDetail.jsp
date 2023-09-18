<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<style>
	.notice-container {
		width: 70%;
		height: 100vh;
		margin: 0 auto;
		background-color: #EEF1F4;
	}
	.notice-table {
		width: 70%;
    	--height: 300px;
		margin: 0 auto;
		padding-top: 100px;
	}
	tr:last-child td{
		height: 60px;
	}
	tr:last-child>td:last-child {
		width: 210px;
	}
	.notice-table tr:first-child>td {
		height: 40px;
		border: 1px solid #ccc;
    	border-radius: 5px;
    	background-color: white;
	}
	.notice-table tr:first-child>td:last-Child {
		padding-left: 10px;
	}
	tr:first-child>td:first-child {
		text-align: center;
		width: 80px;
	}
	td>div {
		width: 100%;
		height: auto;
		border: 1px solid #ccc;
		border-radius: 5px;
		background-color: white;
	}
	.notice-table button {
		 background-color: #3881C5;
         color: #F3F3F3;
         width: 100px;
         height: 40px;
         margin: 0px;
         border: none;
         border-radius: 8px;
         font-size: 0.9em;
         cursor:pointer;
         text-align: center;
         font-weight: bolder;
	}
	#detail-img img {
		width: 90%;
		padding: 10px;
	}
	
	</style>
	<body>
		<jsp:include page="../include/navHeader.jsp"></jsp:include>
		<div class="notice-container">
			<table class="notice-table">
				<tr>
					<td>제목</td>
					<td colspan="2">${noticeDetail.noticeTitle }</td>
				</tr>
				<tr>
					<td colspan="3">
						<div id="detail-img">${noticeDetail.noticeContent }</div>
					</td>
				</tr>
				<tr>
					<td colspan="2"><button>목록으로</button></td>
					<td>
						<button>수정</button>
						<button>삭제</button>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>