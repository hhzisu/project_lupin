<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title></title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/managerAuction.css">
            <!-- import font-awesome, line-awesome -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
            <!-- import pretendard font -->
            <link rel="stylesheet" as="style" crossorigin
                href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css" />
            <!-- import js -->
            <script src="https://code.jquery.com/jquery-3.6.3.min.js"
                integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        </head>

        <body>

            <%@ include file="header.jsp" %>
                <%@ include file="sidebar.jsp" %>

                    <div class="pageFixSize">
                        <div class="userInfo">
                            <div class="userNav">
                                <h3 class="navUserName">관리자</h3>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/managerQuestion">1:1 문의 내역</a></li>
                                    <li><a href="${pageContext.request.contextPath}/managerCommission">위탁 관리</a></li>
                                    <li><a href="${pageContext.request.contextPath}/managerAuction"
                                            style="color: black; font-weight: 700;">경매 관리</a></li>
                                    <li><a href="${pageContext.request.contextPath}/managerAuctionRegist">경매 물품 등록</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- userNav 끝 -->
                            <div class="auctionInfoInfo">
                                <div class="auctionInfoTitle">
                                    <h3>경매 관리</h3>
                                </div>
                                <hr class="auctionInfoLine">
                                <div class="auctionTabWrap">
                                    <div class="tab active dateManagement">일정 관리</div>
                                    <div class="tab addDate">일정 등록</div>
                                </div>
                                <div class="dateManagementWrap active">
                                    <c:forEach var="dto" items="${scheduleList}">
                                        <c:choose>
                                            <c:when
                                                test="${currentDateTime >= dto.auctionSchedule_start && currentDateTime <= dto.auctionSchedule_end}">
                                                <div class="progressiveAuction">
                                                    <div class="leftBox">
                                                        <p>진행 경매</p>
                                                        <p>${dto.auctionSchedule_start} 12:00 ~
                                                            ${dto.auctionSchedule_end} 18:00</p>
                                                    </div>
                                                    <div class="rightBox">
                                                        <a href="auctionProgress">
                                                            <div class="reading btn">
                                                                <p>열람</p>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </c:when>

                                            <c:otherwise>
                                                <div class="expectAuction">
                                                    <div class="leftBox">
                                                        <p>예정 경매</p>
                                                        <p>${dto.auctionSchedule_start} 12:00 ~
                                                            ${dto.auctionSchedule_end} 18:00</p>
                                                    </div>
                                                    <div class="rightBox">
                                                        <div class="management btn">
                                                            <p>관리</p>
                                                        </div>
                                                        <div class="modify btn" onclick="location.href='managerAuctionModify?auctionSchedule_id=${dto.auctionSchedule_id}'">
                                                            <p>수정</p>
                                                        </div>
                                                        <div class="delete btn" data-id="${dto.auctionSchedule_id}">
                                                            <p>삭제</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <!-- <div class="expectAuction">
                                        <div class="leftBox">
                                            <p>예정 경매</p>
                                            <p>24.09.16 12:00 ~ 24.09.20 18:00</p>
                                        </div>
                                        <div class="rightBox">
                                            <div class="management btn">
                                                <p>관리</p>
                                            </div>
                                            <div class="modify btn">
                                                <p>수정</p>
                                            </div>
                                            <div class="delete btn">
                                                <p>삭제</p>
                                            </div>
                                        </div>
                                    </div> -->
                                </div>
                                <div class="dateRegisterWrap">
                                    <hr>
                                    <form id="auctionForm" action="${pageContext.request.contextPath}/insertSchedule"
                                        method="post">
                                        <!-- 폼 안에 있는 기존 날짜 선택 필드들 -->
                                        <div class="startAuction">
                                            <p>경매 시작일</p>
                                            <div class="startYear">
                                                <select name="auctionSchedule_startYear" id="startYear"
                                                    style="cursor: pointer;">
                                                    <option value=""></option>
                                                </select>
                                                <p>년</p>
                                            </div>
                                            <div class="startMonth">
                                                <select name="auctionSchedule_startMonth" id="startMonth"
                                                    style="cursor: pointer;">
                                                    <option disabled selected></option>
                                                </select>
                                                <p>월</p>
                                            </div>
                                            <div class="startDay">
                                                <select name="auctionSchedule_startDay" id="startDay"
                                                    style="cursor: pointer;">
                                                    <option disabled selected></option>
                                                </select>
                                                <p>일</p>
                                            </div>
                                        </div>

                                        <hr>

                                        <div class="endAuction">
                                            <p>경매 종료일</p>
                                            <div class="endYear">
                                                <select name="auctionSchedule_endYear" id="endYear"
                                                    style="cursor: pointer;">
                                                    <option value=""></option>
                                                </select>
                                                <p>년</p>
                                            </div>
                                            <div class="endMonth">
                                                <select name="auctionSchedule_endMonth" id="endMonth"
                                                    style="cursor: pointer;">
                                                    <option disabled selected></option>
                                                </select>
                                                <p>월</p>
                                            </div>
                                            <div class="endDay">
                                                <select name="auctionSchedule_endDay" id="endDay"
                                                    style="cursor: pointer;">
                                                    <option disabled selected></option>
                                                </select>
                                                <p>일</p>
                                            </div>
                                        </div>

                                        <hr>

                                        <!-- 등록 버튼을 통해 form 데이터 전송 -->
                                        <div class="dateRegisterBtnWrap">
                                            <div class="cancel btn2">
                                                <p>취소</p>
                                            </div>
                                            <button type="submit" class="register btn2">
                                                <p>등록</p>
                                            </button>
                                        </div>

                                        <!-- hidden 필드에 조합된 날짜 값 저장 -->
                                        <input type="hidden" id="auctionSchedule_start" name="auctionSchedule_start">
                                        <input type="hidden" id="auctionSchedule_end" name="auctionSchedule_end">
                                    </form>
                                </div>
                                <hr>
                            </div> <!-- auctionInfoInfo 끝 -->
                        </div> <!-- userInfo 끝 -->
                    </div>

                    <%@ include file="footer.jsp" %>

        </body>

        </html>
        <script>
            // startYear
            // 현재 연도 가져오기
            var currentStartYear = new Date().getFullYear();

            // select 요소 참조
            var startYearSelect = document.getElementById("startYear");

            // 현재 연도부터 10년 후까지 옵션 추가
            for (var i = currentStartYear; i <= currentStartYear + 2; i++) {
                var option = document.createElement("option");
                option.value = i;
                option.text = i;
                startYearSelect.appendChild(option);
            }

            // endYear
            // 현재 연도 가져오기
            var currentEndYear = new Date().getFullYear();

            // select 요소 참조
            var endYearSelect = document.getElementById("endYear");

            // 현재 연도부터 10년 후까지 옵션 추가
            for (var i = currentEndYear; i <= currentEndYear + 2; i++) {
                var option = document.createElement("option");
                option.value = i;
                option.text = i;
                endYearSelect.appendChild(option);
            }
        </script>

        <script>
            // '출생 연도' 셀렉트 박스 option 목록 동적 생성
            const startMonth = document.querySelector('#startMonth');
            let startMonthOptionExisted = false;
            startMonth.addEventListener('focus', function () {
                if (!startMonthOptionExisted) {
                    startMonthOptionExisted = true;
                    for (var i = 1; i <= 12; i++) {
                        const monthOption = document.createElement('option');
                        monthOption.setAttribute('value', i);
                        monthOption.innerText = i;
                        this.appendChild(monthOption);
                    }
                }
            });

            const endMonth = document.querySelector('#endMonth');
            let endMonthOptionExisted = false;
            endMonth.addEventListener('focus', function () {
                if (!endMonthOptionExisted) {
                    endMonthOptionExisted = true;
                    for (var i = 1; i <= 12; i++) {
                        const monthOption = document.createElement('option');
                        monthOption.setAttribute('value', i);
                        monthOption.innerText = i;
                        this.appendChild(monthOption);
                    }
                }
            });
        </script>

        <script>
            // '출생 연도' 셀렉트 박스 option 목록 동적 생성
            const startDay = document.querySelector('#startDay');
            let startDayOptionExisted = false;
            startDay.addEventListener('focus', function () {
                if (!startDayOptionExisted) {
                    startDayOptionExisted = true;
                    for (var i = 1; i <= 31; i++) {
                        const startDayOption = document.createElement('option');
                        startDayOption.setAttribute('value', i);
                        startDayOption.innerText = i;
                        this.appendChild(startDayOption);
                    }
                }
            });

            const endDay = document.querySelector('#endDay');
            let endDayOptionExisted = false;
            endDay.addEventListener('focus', function () {
                if (!endDayOptionExisted) {
                    endDayOptionExisted = true;
                    for (var i = 1; i <= 31; i++) {
                        const endDayOption = document.createElement('option');
                        endDayOption.setAttribute('value', i);
                        endDayOption.innerText = i;
                        this.appendChild(endDayOption);
                    }
                }
            });
        </script>

        <script>
            $(document).ready(function () {
                $('.tab').click(function () {
                    $('.tab').removeClass('active');
                    $(this).addClass('active');

                    // 모든 섹션을 숨기고 클릭된 탭에 해당하는 섹션만 보이기
                    $('.dateManagementWrap, .dateRegisterWrap').removeClass('active');

                    // 클래스 이름을 이용해 해당 섹션을 보이게 처리
                    if ($(this).hasClass('dateManagement')) {
                        $('.dateManagementWrap').addClass('active');
                    } else if ($(this).hasClass('addDate')) {
                        $('.dateRegisterWrap').addClass('active');
                    }
                });
            });
        </script>

        <script>
            $(document).ready(function () {
                // 폼 제출 시 경매 시작일과 종료일을 하나의 문자열로 결합해서 전송
                $('form').on('submit', function (event) {
                    // 시작일 조합
                    var startYear = $('#startYear').val();
                    var startMonth = $('#startMonth').val().padStart(2, '0');
                    var startDay = $('#startDay').val().padStart(2, '0');
                    var auctionSchedule_start = startYear + '-' + startMonth + '-' + startDay;

                    // 종료일 조합
                    var endYear = $('#endYear').val();
                    var endMonth = $('#endMonth').val().padStart(2, '0');
                    var endDay = $('#endDay').val().padStart(2, '0');
                    var auctionSchedule_end = endYear + '-' + endMonth + '-' + endDay;

                    // hidden input에 값 설정
                    $('#auctionSchedule_start').val(auctionSchedule_start);
                    $('#auctionSchedule_end').val(auctionSchedule_end);
                });
            });
        </script>

        <script>
            $('#auctionForm').on('submit', function (event) {
                console.log("폼 제출 이벤트 발생");

                // 각 날짜 필드가 비어있는지 확인
                if ($('#startYear').val() === "" || $('#startMonth').val() === "" || $('#startDay').val() === "" ||
                    $('#endYear').val() === "" || $('#endMonth').val() === "" || $('#endDay').val() === "") {
                    console.log("날짜 필드가 비어있음");
                    alert('모든 날짜 항목을 선택해주세요.');
                    event.preventDefault();  // 폼 제출 중단
                } else {
                    console.log("날짜 필드 정상 입력됨");
                }
            });

        </script>

        <script>
            $(document).ready(function () {
                $('.delete').click(function () {
                    var scheduleId = $(this).data('id');  // 클릭한 버튼의 auctionSchedule_id 가져오기

                    if (confirm('정말로 이 일정을 삭제하시겠습니까?')) {
                        $.ajax({
                            type: 'POST',
                            url: '${pageContext.request.contextPath}/deleteSchedule',
                            data: { auctionSchedule_id: scheduleId },
                            success: function (response) {
                                alert('일정이 삭제되었습니다.');
                                location.reload();  // 페이지 새로고침
                            },
                            error: function (error) {
                                alert('일정 삭제 중 오류가 발생했습니다.');
                                console.error(error);
                            }
                        });
                    }
                });
            });
        </script>