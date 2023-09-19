<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../resources/css/challenge/chal.css">
        <link rel="stylesheet" href="../resources/css/font.css">
        <link rel="stylesheet" href="../resources/css/reset.css">  
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <title>챌린지 등록</title>
    </head>
    <body>
    	<jsp:include page="/WEB-INF/views/include/navHeader.jsp"></jsp:include>
<!--         <header></header> -->
        <main>
            <section id="main-container">
                <form action="" method="post" enctype="multipart/form-data">
                	<input type="hidden" name="chalUserId" value="${ sessionScope.userId }">
                    <!-- 시작일, 종료일 -->
                    <section id="set-chal-date">
                        <input type="date" name="chalStartDate" id="chal-start-date" min="${ sysdate }" required> ~ 
                        <input type="date" name="endDate" id="chal-end-date">
                    </section>
                    <!-- 챌린지 공개여부, 챌린지 명, 챌린지 방법 설명, 파일 첨부 -->
                    <section id="set-chal-info">
                        <div>
                            <select name="chalPublic" id="chal-public">
                                <option value="Y">공개</option>
                                <option value="N">비공개</option>
                            </select>
                            <div>
                                <input type="text" name="chalTitle" id="chal-title" placeholder="챌린지 이름을 적어주세요." onchange="duplicatedChalName();" required>
                                <div style="display: none;" id="warning-text">* 이미 참여중인 챌린지입니다. 다른 챌린지를 시작해주세요.</div>
                            </div>
                        </div>
                        <textarea name="chalContent" id="chal-content" cols="50" rows="5" placeholder="챌린지 방법을 간략하게 설명해주세요. (150자 이내)" required></textarea>
                    </section>
                    <!-- 등록 버튼 -->
                    <section id="set-btn">
                        <input type="file" name="uploadFile" id="chal-file-name">
                        <div>
	                        <input type="button" value="목록으로" onclick="goBack();">
	                        <input type="submit" value="등록">
                        </div>
                    </section>
                </form>
            </section>
        </main>
        <footer></footer>
		
		<!-- 종료일 최소일 지정 -->
		<script>
		    $(document).ready(function() {
		        // 오늘 날짜를 가져와서 하루를 더합니다.
		        var tomorrow = new Date();
		        tomorrow.setDate(tomorrow.getDate() + 1);
		
		        // 오늘보다 하루 다음 날을 문자열로 변환하여 최소값으로 설정합니다.
		        var tomorrowString = tomorrow.toISOString().split('T')[0];
		        $("#chal-end-date").attr("min", tomorrowString);
		
		        $("#chal-start-date").on("change", function() {
		            var startDate = $(this).val();
		            var endDate = $("#chal-end-date").val();
		
		            // 시작일 변경 시 종료일의 최소값 업데이트
		            var nextDate = new Date(startDate);
		            nextDate.setDate(nextDate.getDate() + 1);
		            var nextDateString = nextDate.toISOString().split('T')[0];
		            $("#chal-end-date").attr("min", nextDateString);
		
		            // 종료일이 시작일 이전이면 종료일 초기화
		            if (endDate < startDate) {
		                $("#chal-end-date").val("");
		            }
		        });
		
		        $("#chal-end-date").on("change", function() {
		            var startDate = $("#chal-start-date").val();
		            var endDate = $(this).val();
		
		            // 종료일을 선택한 후에 시작일을 선택한 경우 시작일 변경
		            if (endDate !== "" && endDate < startDate) {
		                $("#chal-start-date").val(endDate);
		                $("#chal-start-date").trigger("change"); // 시작일 변경 이벤트 트리거
		            }
		        });
		
		        // 페이지 로드 시 최소값 설정
		        $("#chal-start-date").trigger("change");
		    });
		</script>




		<!-- 챌린지 명 중복 체크 -->
		<script>
		$(document).ready(function() {
		    $("#chal-title").on("input", function() {
		        var chalTitle = $(this).val();
		        if (chalTitle !== "") {
		            checkDuplicateChalName(chalTitle);
		        }
		    });
		
		    function checkDuplicateChalName(chalTitle) {
		        $.ajax({
		            url: "/challenge/checkDuplicate.do",
		            type: "POST",
		            data: { chalTitle: chalTitle },
		            success: function(data) {
		                if (data === "true") {
		                    $("#warning-text").show();
		                    $("input[type='submit']").prop("disabled", true);
		                } else {
		                    $("#warning-text").hide();
		                    $("input[type='submit']").prop("disabled", false);
		                }
		            }
		        });
		    }
		});
		</script>
    </body>
</html>