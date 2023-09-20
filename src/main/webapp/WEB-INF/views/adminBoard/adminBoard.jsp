<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
	<html>
	<head>
        <meta charset="UTF-8">
        <title>관리자 게시판 리스트</title>
    </head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
    	.admin-table-container {
    		width: 800px;
    		margin: 0 auto;
    		margin-top: 100px;
    	}
        .admin-table{
            width: 800px;
            border: 1px solid black;
            border-collapse: collapse;
            margin-top: 10px;
            background-color: white;
        }
        .admin-table th
        , .admin-table td{
            border: 1px solid black;
        }
        .admin-table td:last-child 
        , .admin-table td:nth-last-child(2)
        , .admin-table td:nth-last-child(3)
        , .admin-table td:first-child {
            width: 90px;
            height: 30px;
            text-align: center;
            
        }
        .admin-table th:last-child 
        , .admin-table th:nth-last-child(2)
        , .admin-table th:nth-last-child(3)
        , .admin-table th:first-child
        , .admin-paging {
        	text-align: center;
        }
        #admin-select {
        	border-radius: 5px;
        	width: 120px;
        	height: 30px;
        }
		.admin-paging a
		, .admin-table a {
			color: black;
		 }
    </style>
    <body>
    	<jsp:include page="../include/navHeader.jsp"></jsp:include>
        <div class="admin-table-container">
		    <select id="admin-select" onchange="selectOption(this)">
		    	<option value="none">=== 선택 ===</option>
		        <option value="notice">공지 리스트</option>
		        <option value="user">회원 리스트</option>
		        <option value="chall">챌린지 리스트</option>
		        <option value="tip">팁공유 리스트</option>
		        <option value="goods">굿즈 리스트</option>
		        <option value="report">신고글 리스트</option>
		    </select>
            <div id="admin-hidden-table">
	            <table id="admin-table" class="admin-table">
	            <c:if test="${selectedValue ne 'user' }">
		            <tr>
		                <th>번호</th>
		                <th>제목</th>
		                <th>작성자</th>
		                <th>작성일</th>
		                <th>조회수</th>
		                <th>관리자 권한</th>
		            </tr>
				</c:if>
				<c:if test="${selectedValue eq 'user' }">
					<tr>
		                <th>번호</th>
		                <th>아이디</th>
		                <th>닉네임</th>
		                <th>이름</th>
		                <th>전화번호</th>
		                <th>주소</th>
		                <th>이메일</th>
		                <th>관리자 권한</th>
		            </tr>
				</c:if>
		            <!-- 공지 리스트 -->
		            <c:forEach var="request" items="${nList }">
		            <tr>
		                <td>${request.noticeNo }</td>
		                <c:url var="detailUrl" value="/notice/detail.do">
	                		<c:param name="noticeNo" value="${request.noticeNo }" />
	                	</c:url>
		                <td>
		                <a href="${detailUrl}">${request.noticeTitle }</a>
		                </td>
		                <td>${request.noticeWriter }</td>
		                <td>${request.noticeCreateDate }</td>
		                <td>${request.noticeViewCount }</td>
		                <td>
		                	<a href="/notice/modify.do?noticeNo=${request.noticeNo }">수정</a>
		                	<a onclick="noticeDelete()">삭제</a>
		                </td>
		            </tr>
		            </c:forEach>
					<!-- 회원 리스트 -->
		            <c:forEach var="request" items="${uList }" varStatus="i">
		            <tr>
		                <td>${i.count }</td>
		                <c:url var="detailUrl" value="/user/myPage.do">
	                		<c:param name="userId" value="${request.userId }" />
	                	</c:url>
		                <td>${request.userId }</td>
		                <td>${request.userNickName }</td>
		                <td>${request.userName }</td>
		                <td>${request.userPhone }</td>
		                <td>${request.userAddr }</td>
		                <td>${request.userEmail }</td>
		                <td>
		                	<a href="/user/modify.do?userId=${request.userId }">수정</a>
		                	<a onclick="userDelete()">삭제</a>
		                </td>
		            </tr>
		            </c:forEach>
					<!-- 챌린지 리스트 해야함-->
		            <c:forEach var="request" items="${uList }" varStatus="i">
		            <tr>
		                <td>${i.count }</td>
		                <c:url var="detailUrl" value="/user/myPage.do">
	                		<c:param name="userId" value="${request.userId }" />
	                	</c:url>
		                <td>${request.userId }</td>
		                <td>${request.userNickName }</td>
		                <td>${request.userName }</td>
		                <td>${request.userPhone }</td>
		                <td>${request.userAddr }</td>
		                <td>${request.userEmail }</td>
		                <td>
		                	<a href="/user/modify.do?userId=${request.userId }">수정</a>
		                	<a onclick="userDelete()">삭제</a>
		                </td>
		            </tr>
		            </c:forEach>
	            </table>
		        <div class="admin-paging">
		             <c:url var="pageUrl" value="/admin/board.do">
                		<c:param name="page" value="${pInfo.startNavi -1 }"></c:param>
	                </c:url>
	                <c:if test="${pInfo.startNavi != 1 }">
	                	<a href="${pageUrl }">[이전]</a>
	                </c:if>	        	
		             <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
						<c:url var="pageUrl" value="/admin/board.do">
							<c:param name="page" value="${p }"></c:param>
						</c:url>
						<a href="${pageUrl }">${p }</a>&nbsp;
					</c:forEach>
						<c:url var="pageUrl" value="/admin/board.do">
	                <c:param name="page" value="${pInfo.startNavi +1 }"></c:param>
	                </c:url>
	                <c:if test="${pInfo.endNavi != pInfo.naviTotalCount}">
	                	<a href="${pageUrl }">[다음]</a>
	                </c:if>	
		        </div>
	        </div>
        </div>
        <script>
        function selectOption(obj) {
        	const selectVal = $(obj).val();
    		location.href="/admin/board.do?selectedValue="+selectVal;
        }
        
        </script>
    </body>
</html>