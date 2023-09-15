<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../resources/css/challenge/chal.css">
        <link rel="stylesheet" href="../resources/css/font.css">
        <link rel="stylesheet" href="../resources/css/reset.css">  
        <title>챌린지 수정</title>
    </head>
    <body>
    	<jsp:include page="/WEB-INF/views/include/navHeader.jsp"></jsp:include>
<!--         <header></header> -->
        <main>
            <section id="main-container">
                <form action="/challenge/update.do" method="post" enctype="multipart/form-data">
                	<input type="hidden" name="chalNo" value="${ chal.chalNo }">
                	<input type="hidden" name="chalFileName" value="${ chal.chalFileName }">
					<input type="hidden" name="chalFileRename" value="${ chal.chalFileRename }">
					<input type="hidden" name="chalFilePath" value="${ chal.chalFilePath }">
					<input type="hidden" name="chalFileLength" value="${ chal.chalFileLength }">
                
                    <!-- 시작일, 종료일 -->
                    <section id="set-chal-date">
                        <input type="date" name="chalStartDate" id="chal-start-date" value="${ chal.chalStartDate }" disabled> ~
                        <!-- 기간제 챌린지 -->
                        <c:if test="${ chal.chalEndDate ne null }">
	                        <input type="date" name="chalEndDate" id="chal-end-date" value="${ chal.chalEndDate }" disabled>                                                  
                        </c:if>
                        <!-- 무기한 챌린지 어떻게 표시할지.. --> 
                        <c:if test="${ chal.chalEndDate eq null }">
                        	<input type="date" name="chalEndDate" id="chal-end-date" value="${ chal.chalEndDate }" disabled>          
                        </c:if>
                    </section>
                    
                    <!-- 챌린지 공개여부, 챌린지 명, 챌린지 방법 설명, 파일 첨부 -->
                    <section id="set-chal-info">
                        <div>
                            <select name="chalPublic" id="chal-public">
                                <option value="Y" <c:if test="${ fn:contains(chal.chalPublic, 'Y') }">selected</c:if>>공개</option>
                                <option value="N" <c:if test="${ fn:contains(chal.chalPublic, 'N') }">selected</c:if>>비공개</option>
                            </select>
                            <div>
                                <input type="text" name="chalTitle" id="chal-title" value="${ chal.chalTitle }" disabled>
                            </div>
                        </div>
                        <textarea name="chalContent" id="chal-content" cols="50" rows="5" placeholder="챌린지 방법을 간략하게 설명해주세요. (150자 이내)" required>${ chal.chalContent }</textarea>
                    </section>
                    
                    <!-- 수정 버튼 -->
                    <section id="set-btn">
                        <input type="file" name="uploadFile" id="chal-file-name">
                        <input type="submit" value="수정">
                    </section>
                </form>
            </section>
        </main>
        <footer></footer>
    </body>
</html>