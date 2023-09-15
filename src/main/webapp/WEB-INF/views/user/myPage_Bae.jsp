<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/myPage.css">
    <link rel="stylesheet" href="../../resources/css/calendar.css">
    <title>myPage</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

    <script>
    $(document).ready(function(){
    $(".slider").bxSlider();
    });
    </script>
</head>
<body>
    <div class="container">
        <div class="mini-container">
            <div id="mypage-header">
                <div id="profile-div">
                    <img src="../../resources/images/프로필이미지.png" alt="">
                </div>
                <img id="modify-icon" src="../../resources/images/설정아이콘.png" alt="">
                <div id="userInfo-div">
                    <div>
                        <div id="nickname">바소잔</div>
                    </div>
                    <div>
                        <div>
                            <span>팔로워23 | 팔로잉43</span>
                        </div>                                
                    </div>
                </div>
                <div id="uiInfo-div">
                    <div class="ui-item">
                        <img class="ui-icon" src="../../resources/images/공식(달성,진행)아이콘.png" alt="">
                        <span class="ui-text">15/30</span>
                    </div>
                    <div class="ui-item">
                        <img class="ui-icon" src="../../resources/images/개인(달성,진행)아이콘.png" alt="">
                        <span class="ui-text">3/5</span>
                    </div>
                    <div class="ui-item">
                        <img class="ui-icon" src="../../resources/images/게시물아이콘.png" alt="">
                        <span class="ui-text">43개</span>
                    </div>
                    <div class="ui-item">
                        <img class="ui-icon" src="../../resources/images/포인트아이콘.png" alt="">
                        <span class="ui-text">1234p</span>
                    </div>
                </div>                         
            </div>
            <img id="dot" src="../../resources/images/dot.png" onclick="toggleReportDiv()" alt="">
            <div id="report-div" style="display: none;">
                <div id="report-img-div"><img id="report-img" src="../../resources/images/경고아이콘.png" alt=""></div>
                <div id="report-text">신고하기</div>
            </div> 
            <div id="chal">
                <div id="blue-wave">
                    <div class="calendar">
                        <div class="calendar-header">
                            <button class="nav-button" id="prevMonth">&lt; 이전 달</button>
                            <span class="current-month" id="currentMonth"></span>
                            <button class="nav-button" id="nextMonth">다음 달 &gt;</button>
                        </div>
                        <table class="calendar-table" id="calendarTable">
                            <!-- 캘린더 표가 여기에 생성됩니다. -->
                        </table>
                    </div>
                </div>
                <div id="todo-chal">
                    <span id="todo-title"><오늘의 챌린지></span>
                    <hr>
                    <table>
                        <tr>
                            <td>식물 기르기</td>
                            <td>
                                <span id="percent-text">50%</span><progress id="progress" value="50" min="0" max="100"></progress>
                            </td>
                        </tr>
                    </table>
                    <hr>
                </div>
            </div>
            <div id="list-count">굿즈 목록 | 5개</div>
            <div id="goods-img-div">
                <div class="slider-container">
                    <div class="slider1">
                        <!-- 이곳에 추가 이미지를 슬라이드로 넣어줍니다. -->
                        <div class="slide">
                            <img src="../../resources/images/배경.jpg" alt="">
                            <div class="goods-name-overlay">
                                <div class="goods-name">굿즈 이름1</div>
                            </div>
                        </div>
                        <div class="slide">
                            <img src="../../resources/images/배경.jpg" alt="">
                            <div class="goods-name-overlay">
                                <div class="goods-name">굿즈 이름2</div>
                            </div>
                        </div>
                        <div class="slide">
                            <img src="../../resources/images/배경.jpg" alt="">
                            <div class="goods-name-overlay">
                                <div class="goods-name">굿즈 이름3</div>
                            </div>
                        </div>
                        <div class="slide">
                            <img src="../../resources/images/배경.jpg" alt="">
                            <div class="goods-name-overlay">
                                <div class="goods-name">굿즈 이름4</div>
                            </div>
                        </div>
                        <!-- 추가 이미지 -->
                        <div class="slide">
                            <img src="../../resources/images/배경.jpg" alt="">
                            <div class="goods-name-overlay">
                                <div class="goods-name">굿즈 이름5</div>
                            </div>
                        </div>
                        <div class="slide">
                            <img src="../../resources/images/배경.jpg" alt="">
                            <div class="goods-name-overlay">
                                <div class="goods-name">굿즈 이름6</div>
                            </div>
                        </div>
                        <div class="slide">
                            <img src="../../resources/images/배경.jpg" alt="">
                            <div class="goods-name-overlay">
                                <div class="goods-name">굿즈 이름7</div>
                            </div>
                        </div>
                        <div class="slide">
                            <img src="../../resources/images/배경.jpg" alt="">
                            <div class="goods-name-overlay">
                                <div class="goods-name">굿즈 이름8</div>
                            </div>
                        </div>
                        <!-- 추가 이미지 끝 -->
                    </div>
                </div>                
            </div>
        </div>
    </div>
    <script>
        // // 프로그레스 바 엘리먼트 선택
        // const progressBar = document.querySelector(".progress-fill");

        // // 진행 상태 설정 (60%로 설정)
        // const progress = 60;

        // // 프로그레스 바 업데이트
        // progressBar.style.width = `${progress}%`;
        function toggleReportDiv() {
            var reportDiv = document.getElementById("report-div");

            if (reportDiv.style.display === "none" || reportDiv.style.display === "") {
                reportDiv.style.display = "block";
            } else {
                reportDiv.style.display = "none";
            }
        }
        
        $(document).ready(function(){
        $('.slider1').bxSlider({
        slideWidth: 215,
        minSlides: 2,
        maxSlides: 4,
        slideMargin: 20
        });
    });


    const calendarTable = document.getElementById("calendarTable");
        const currentMonthHeader = document.getElementById("currentMonth");
        const prevMonthButton = document.getElementById("prevMonth");
        const nextMonthButton = document.getElementById("nextMonth");
        let currentDate = new Date();

        function updateCalendar() {
            const year = currentDate.getFullYear();
            const month = currentDate.getMonth();
            const daysInMonth = new Date(year, month + 1, 0).getDate();
            const firstDay = new Date(year, month, 1).getDay();

            // 현재 월 표시
            currentMonthHeader.textContent = `${year}년 ${month + 1}월`;

            // 캘린더 표 초기화
            calendarTable.innerHTML = "";

            // 날짜 표시
            let date = 1;
            for (let i = 0; i < 6; i++) {
                const row = document.createElement("tr");
                for (let j = 0; j < 7; j++) {
                    const td = document.createElement("td");
                    if (i === 0 && j < firstDay) {
                        // 빈 셀
                    } else if (date <= daysInMonth) {
                        td.textContent = date;
                        date++;
                    }
                    row.appendChild(td);
                }
                calendarTable.appendChild(row);
                if (date > daysInMonth) {
                    break;
                }
            }
        }

        prevMonthButton.addEventListener("click", () => {
            currentDate.setMonth(currentDate.getMonth() - 1);
            updateCalendar();
        });

        nextMonthButton.addEventListener("click", () => {
            currentDate.setMonth(currentDate.getMonth() + 1);
            updateCalendar();
        });

        // 특정 날짜를 파란색으로 표시
        function highlightDate(dateToHighlight) {
            const year = currentDate.getFullYear();
            const month = currentDate.getMonth();
            const tableRows = calendarTable.querySelectorAll("tr");

            for (let i = 1; i < tableRows.length; i++) {
                const row = tableRows[i];
                const cells = row.querySelectorAll("td");

                for (let j = 0; j < cells.length; j++) {
                    const cell = cells[j];
                    const cellDate = parseInt(cell.textContent);

                    if (!isNaN(cellDate) && cellDate === dateToHighlight) {
                        cell.style.backgroundColor = "#3d9ff6"; // 파란색으로 설정
                    }
                }
            }
        }

        // 초기 캘린더 업데이트
        updateCalendar();

        // 9월 29일을 파란색으로 표시
        highlightDate(29);  
        highlightDate(2);  
        highlightDate(3);  
    </script>
    </script>
</body>
</html>
