<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
        <meta charset="UTF-8">
        <title>관리자 게시판 리스트</title>
    </head>
    <style>
    	.admin-table-container {
    		width: 800px;
    		--height: 800px;
    		margin: 0 auto;
    		margin-top: 200px;
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
        .admin-select {
        	border-radius: 5px;
        	width: 120px;
        	height: 30px;
        }
    </style>
    <body>
    	<jsp:include page="../include/navHeader.jsp"></jsp:include>
        <div class="admin-table-container">
	            <select id="admin-select" onchange="selectOption();">
	                <option value="notice">공지 리스트</option>
	                <option value="user">회원 리스트</option>
	                <option value="chall">챌린지 리스트</option>
	                <option value="tip">팁공유 리스트</option>
	                <option value="goods">굿즈 리스트</option>
	                <option value="report">신고글 리스트</option>
	            </select>
            <table class="admin-table">
	            <tr>
	                <th>번호</th>
	                <th>제목</th>
	                <th>작성자</th>
	                <th>작성일</th>
	                <th>조회수</th>
	            </tr>
	            <tr>
	                <td>1</td>
	                <td>제목제목</td>
	                <td>admin</td>
	                <td>2023-09-11</td>
	                <td>524</td>
	            </tr>
	            <tr>
	                <td>2</td>
	                <td>제목제목</td>
	                <td>admin</td>
	                <td>2023-09-11</td>
	                <td>524</td>
	            </tr>
	            <tr>
	                <td>3</td>
	                <td>제목제목</td>
	                <td>admin</td>
	                <td>2023-09-11</td>
	                <td>524</td>
	            </tr>
	            <tr>
	                <td>4</td>
	                <td>제목제목</td>
	                <td>admin</td>
	                <td>2023-09-11</td>
	                <td>524</td>
	            </tr>
	            <tr>
	                <td>5</td>
	                <td>제목제목</td>
	                <td>admin</td>
	                <td>2023-09-11</td>
	                <td>524</td>
	            </tr>
	            <tr>
	                <td>6</td>
	                <td>제목제목</td>
	                <td>admin</td>
	                <td>2023-09-11</td>
	                <td>524</td>
	            </tr>
	            <tr>
	                <td>7</td>
	                <td>제목제목</td>
	                <td>admin</td>
	                <td>2023-09-11</td>
	                <td>524</td>
	            </tr>
            </table>
	        <div class="admin-paging">
	             [페이징 처리]
	        </div>
        </div>
        <script>
        	function selectOption() {
        		const opt = document.getElementById("admin-select");
        		const optVal = opt.options[opt.selectedIndex].value;
        		
        		location.href="/admin/board.do?optVal="+optVal;
        	}
        </script>
    </body>
</html>