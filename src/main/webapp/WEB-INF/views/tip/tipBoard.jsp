<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
	<html>
	<head>
        <meta charset="UTF-8">
        <title>공지 게시판 리스트</title>
        <link rel="stylesheet" href="/resources/css/tip/tipBoard.css">
    </head>
    <body>
    	<jsp:include page="../include/navHeader.jsp"></jsp:include>
        <div class="tip-container">
        	<div class="tip-subject"><h2>팁공유 게시판</h2></div>
            <table class="tip-table">
	            <tr>
	                <th>번호</th>
	                <th>제목</th>
	                <th>작성자</th>
	                <th>작성일</th>
	                <th>조회수</th>
	            </tr>
	            <c:forEach var="tip" items="${tList }" varStatus="i">
	            <tr>
	                <td>${i.count }</td>
	                <c:url var="detailUrl" value="/tip/detail.do">
	                	<c:param name="tipNo" value="${tip.tipNo }" />
	                </c:url>
	                <td>
	                	<a href="${detailUrl}">${tip.tipTitle }</a>
	                </td>
	                <td>${tip.tipWriter }</td>
	                <td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${tip.tipCreateDate }" />
					</td>
	                <td>${tip.tipViewCount }</td>
	            </tr>
	            </c:forEach>
            </table>
	        <div class="tip-paging">
				<c:url var="pageUrl" value="/tip/board.do">
                	<c:param name="page" value="${pInfo.startNavi -1 }"></c:param>
                </c:url>
                <c:if test="${pInfo.startNavi != 1 }">
                	<a href="${pageUrl }">[이전]</a>
                </c:if>	        	
	             <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
					<c:url var="pageUrl" value="/tip/board.do">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<a href="${pageUrl }">${p }</a>&nbsp;
				</c:forEach>
					<c:url var="pageUrl" value="/tip/board.do">
                <c:param name="page" value="${pInfo.startNavi +1 }"></c:param>
                </c:url>
                <c:if test="${pInfo.endNavi != pInfo.naviTotalCount}">
                	<a href="${pageUrl }">[다음]</a>
                </c:if>	
	        	<input type="button" onclick="goNoticeWrite()" value="글 등록">
	        </div>
        </div>
        <script>
        	function goNoticeWrite() {
        		location.href = "/tip/write.do";
        	}
        </script>
    </body>
</html>