<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
	<html>
	<head>
        <meta charset="UTF-8">
        <title>공지 게시판 리스트</title>
    </head>
    <style>
		.notice-container {
			width: 70%;
			height: 100vh;
			margin: 0 auto;
			background-color: #F8F8F8;
		}
		.notice-subject {
			padding-top: 150px;
		    width: 70%;
		    margin: 0 auto;
		}
        .notice-table{
            width: 70%;
            margin: 0 auto;
            --padding-top: 200px;
        }
        .notice-table td:last-child 
        , .notice-table td:nth-last-child(2)
        , .notice-table td:nth-last-child(3)
        , .notice-table td:first-child {
            width: 90px;
            height: 30px;
            text-align: center;
            
        }
        .notice-table th:last-child 
        , .notice-table th:nth-last-child(2)
        , .notice-table th:nth-last-child(3)
        , .notice-table th:first-child
        , .notice-paging {
        	text-align: center;
        }
        .notice-table th {
        	height: 40px;
        	border-radius: 3px;
        	border-top: 1px solid #ccc;
        	border-bottom: 2px solid #3881C5;
        	background-color: white;
        }
 		.notice-table td {
 			height: 40px;
 			border-bottom: 1px solid #ccc;
 			background-color: white;
 			border-radius: 3px;
 		}
 		.notice-paging a
 		, .notice-table a{
 			color: black;
 		}
    </style>
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
	                <c:url var="detailUrl" value="/noticeDetail.do">
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
				<c:url var="pageUrl" value="/noticeBoard.do">
                	<c:param name="page" value="${pInfo.startNavi -1 }"></c:param>
                </c:url>
                <c:if test="${pInfo.startNavi != 1 }">
                	<a href="${pageUrl }">[이전]</a>
                </c:if>	        	
	             <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
					<c:url var="pageUrl" value="/noticeBoard.do">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<a href="${pageUrl }">${p }</a>&nbsp;
				</c:forEach>
					<c:url var="pageUrl" value="/noticeBoard.do">
                <c:param name="page" value="${pInfo.startNavi +1 }"></c:param>
                </c:url>
                <c:if test="${pInfo.endNavi != pInfo.naviTotalCount}">
                	<a href="${pageUrl }">[다음]</a>
                </c:if>	
	        </div>
        </div>
    </body>
</html>