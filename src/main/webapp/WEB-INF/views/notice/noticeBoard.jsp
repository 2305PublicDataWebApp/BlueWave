<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
	<html>
	<head>
        <meta charset="UTF-8">
        <title>공지 게시판 리스트</title>
        <link rel="stylesheet" href="/resources/css/notice/noticeBoard.css">
    </head>
    <body>
    	<jsp:include page="../include/navHeader.jsp"></jsp:include>
        <div class="notice-container">
        	<div class="notice-subject"><h2>공지 게시판</h2></div>
            <table class="notice-table">
	            <tr>
	                <th>번호</th>
	                <th>제목</th>
	                <th>작성자</th>
	                <th>작성일</th>
	                <th>조회수</th>
	            </tr>
	            <c:forEach var="notice" items="${nList }" varStatus="i">
	            <tr>
	                <td>${i.count }</td>
	                <c:url var="detailUrl" value="/notice/detail.do">
	                	<c:param name="noticeNo" value="${notice.noticeNo }" />
	                </c:url>
	                <td>
	                	<a href="${detailUrl}">${notice.noticeTitle }</a>
	                </td>
	                <td>${notice.noticeWriter }</td>
	                <td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.noticeCreateDate }" />
					</td>
	                <td>${notice.noticeViewCount }</td>
	            </tr>
	            </c:forEach>
            </table>
	        <div class="notice-paging">
				<c:url var="pageUrl" value="/notice/board.do">
                	<c:param name="page" value="${pInfo.startNavi -1 }"></c:param>
                </c:url>
                <c:if test="${pInfo.startNavi != 1 }">
                	<a href="${pageUrl }">[이전]</a>
                </c:if>	        	
	             <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
					<c:url var="pageUrl" value="/notice/board.do">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<a href="${pageUrl }">${p }</a>&nbsp;
				</c:forEach>
					<c:url var="pageUrl" value="/notice/board.do">
                <c:param name="page" value="${pInfo.startNavi +1 }"></c:param>
                </c:url>
                <c:if test="${pInfo.endNavi != pInfo.naviTotalCount}">
                	<a href="${pageUrl }">[다음]</a>
                </c:if>	
                <c:if test="${userId eq 'admin' }">
	        		<input type="button" onclick="goNoticeWrite()" value="글 등록">
	        	</c:if>
	        </div>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        <script>
        	function goNoticeWrite() {
        		location.href = "/notice/write.do";
        	}
        </script>
    </body>
</html>