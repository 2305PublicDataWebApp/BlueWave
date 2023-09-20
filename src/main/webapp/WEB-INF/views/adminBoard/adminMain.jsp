<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        #admin-img{
        	width: 800px;
        	height: auto;
        	margin-top: 10px;
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
		    <img id="admin-img" alt="관리자이미지" src="../resources/images/admin-img.png">
        </div>
        <script>
        function selectOption(obj) {
        	const selectVal = $(obj).val();
    		location.href="/admin/board.do?selectedValue="+selectVal;
        }
        </script>
    </body>
</html>