<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>main</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
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
            <script src="${pageContext.request.contextPath}/js/index.js"></script>
        </head>

<style>
    .white {
        color: var(--color-white);
    }
</style>

        <header>

            <%@ include file="header.jsp" %>
        </header>

        <body>

            <main>
                <div class="banner1">
                    <div class="inner">
                        <img src="images/m5.jpg" alt="" class="slide" style="display: block;">
                        <!-- <img src="images/m5.jpg" alt="" class="slide" style="display: block;"> -->
                    </div>
                    <div class="inner">
                        <img src="images/ban4.jpg" alt="" class="slide" style="display: none;">
                        <!-- <img src="images/m4.jpg" alt="" class="slide" style="display: none;"> -->
                        <div class="slide_content" style="display: none;">
                            <div class="box_title">
                                <p>주요 출품작</p>
                            </div>
                            <div class="box_content">
                                <p>최고의 작품들이 준비되어 있습니다.</p>
                                <p>주요 출품작을 확인하고 경매에 참가하세요!</p>
                            </div>
                        </div>
                    </div>
                    <div class="inner">
                        <img src="images/main_3.jpg" alt="" class="slide" style="display: none;">
                        <div class="slide_content" style="display: none;">
                            <div class="box_title">
                                <p>응찰 안내</p>
                            </div>
                            <div class="box_content">
                                <p>루팡의 온라인 경매는 폭넓은 작가군과 합리적인 가격의 작품을 선보입니다.</p>
                            </div>
                            <div class="box_btn">
                                <a href="guideAuction">
                                    <p>바로가기</p>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="inner">
                        <img src="images/main_4.jpg" alt="" class="slide" style="display: none;">
                        <div class="slide_content" style="display: none;">
                            <div class="box_title">
                                <p>미술품 보관</p>
                            </div>
                            <div class="box_content">
                                <p>미술 작품을 안전하게 보관할 전문 서비스를 찾고 계신가요?</p>
                                <p>대한민국 대표 미술품 경매회사 Lupin에서 미술 작품 전문 수장고 서비스를 제공합니다.</p>
                            </div>
                            <div class="box_btn">
                                <a href="guideStorage">
                                    <p>바로가기</p>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="inner">
                        <img src="images/main_5.jpg" alt="" class="slide" style="display: none;">
                        <div class="slide_content">
                            <div class="box_title">
                                <p>위탁 안내</p>
                            </div>
                            <div class="box_content">
                                <p>한국 근현대 및 고미술 그리고 해외미술에 이르기까지 파트별 스페셜리스트들은</p>
                                <p>위탁 및 출품 과정을 고객의 관점에서 성심성의껏 진행하고 있습니다.</p>
                                <p>원하시는 작품을 출품하기 위해서는 위탁 신청을 진행해주셔야 합니다.</p>
                            </div>
                            <div class="box_btn">
                                <a href="guideCommission">
                                    <p>바로가기</p>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="inner">
                        <img src="images/ban3.jpg" alt="" class="slide" style="display: none;">
                        <div class="slide_content">
                            <div class="box_title white">
                                <p>전시회 안내</p>
                            </div>
                            <div class="box_content white">
                                <p>다양한 예술 작품과 문화 행사를 소개하는 공간입니다.</p>
                                <p>최신 전시 일정과 함께 각 전시의 테마와 특징을 확인해 보세요.</p>
                            </div>
                            <div class="box_btn">
                                <a href="performances">
                                    <p>바로가기</p>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="inner">
                        <img src="images/main_6.jpg" alt="" class="slide" style="display: none;">
                        <div class="slide_content">
                            <div class="box_title">
                                <p>FAQ</p>
                            </div>
                            <div class="box_content">
                                <p>궁금한 사항이 있으시다면 FAQ를 먼저 확인해 보세요.</p>
                                <p>필요한 답변을 즉시 찾으실 수 있습니다! 더 자세한 정보는 FAQ에서 확인하세요!</p>
                            </div>
                            <div class="box_btn">
                                <a href="faq">
                                    <p>바로가기</p>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="button-list">
                        <button class="button-left btnList">
                            <i class="fa-solid fa-chevron-left"></i>
                        </button>
                        <button class="button-right btnList">
                            <i class="fa-solid fa-chevron-right"></i>
                        </button>
                    </div>
                </div>
                <div class="mainContent">
                    <div class="conTitle">
                        <h1>오늘의 경매</h1>
                        <a href="auctionProgress">
                            <h5>더보기</h5>
                        </a>
                    </div>
                    <div class="con1">
                        <c:forEach items="${list}" var="list" begin="0" end="2">
                            <div class="auction" data-auction-id="${list.auction_id}">
                                <a
                                    href="auctionDetail?auction_lot=${list.auction_lot}&auctionSchedule_id=${list.auctionSchedule_id}">
                                    <div class="auctionToday">
                                        <div class="auctionImg">
                                            <div class="uploadResult">
                                                <ul class="uploadStyle">
                                                    <img src="images/auction1.jpg">
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="auctionCon">
                                            <h2>${list.auction_author}</h2>
                                            <h3>${list.auction_title}</h3>
                                            <h4>${list.auction_materials}</h4>
                                            <h5 class="finishTime">경매 마감 3일 5시간 전</h5>
                                        </div>
                                    </div> <!--auctionToday 끝-->
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="conTitle">
                        <h1>예정 출품작</h1>
                        <!-- <h5 class="startTime">경매 시작 3일 5시간 20분 3초 전</h5> -->
                        <a href="auctionScheduled">
                            <h5>더보기</h5>
                        </a>
                    </div>
                    <div class="con2">
                        <c:forEach items="${list2}" var="list" begin="0" end="4">
                            <div class="auction" data-auction-id="${list.auction_id}">
                                <a
                                    href="auctionDetail?auction_lot=${list.auction_lot}&auctionSchedule_id=${list.auctionSchedule_id}">
                                    <div class="mainAuction">
                                        <div class="auctionImg">
                                            <div class="uploadResult">
                                                <ul>
                                                    <img src="images/auction3.jpg">
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="mainAuctionCon">
                                            <h4>${list.auction_author}</h4>
                                            <h5>${list.auction_title}</h5>
                                        </div>
                                    </div> <!--mainAuction 끝-->
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div> <!-- mainContent 끝-->
                <div class="banner2">
                    <div class="banner2-title">
                        <h1>미술랭 가이드</h1>
                        <p style="font-size: var(--font-size16);">예술은 사실 맛있다!</p>
                    </div>
                    <div class="swiper-wrapper">
                        <!-- 슬라이드 1 -->
                        <div class="swiper-slide">
                            <a href="https://www.youtube.com/watch?v=hBfGT1vQbE0" target="_blank">
                                <img src="https://img.youtube.com/vi/hBfGT1vQbE0/maxresdefault.jpg" alt="Slide 1">
                            </a>
                        </div>
                        <!-- 슬라이드 2 -->
                        <div class="swiper-slide">
                            <a href="https://www.youtube.com/watch?v=Zou7y3zQE_0" target="_blank">
                                <img src="https://img.youtube.com/vi/Zou7y3zQE_0/maxresdefault.jpg" alt="Slide 2">
                            </a>
                        </div>
                        <!-- 슬라이드 3 -->
                        <div class="swiper-slide">
                            <a href="https://www.youtube.com/watch?v=o6EMCVSh8aI" target="_blank">
                                <img src="https://img.youtube.com/vi/o6EMCVSh8aI/maxresdefault.jpg" alt="Slide 3">
                            </a>
                        </div>
                        <!-- 슬라이드 4 -->
                        <div class="swiper-slide">
                            <a href="https://www.youtube.com/watch?v=a1xJonmeg34" target="_blank">
                                <img src="https://img.youtube.com/vi/a1xJonmeg34/maxresdefault.jpg" alt="Slide 4">
                            </a>
                        </div>
                        <!-- 슬라이드 5 -->
                        <div class="swiper-slide">
                            <a href="https://www.youtube.com/watch?v=m94ychYPoD0" target="_blank">
                                <img src="https://img.youtube.com/vi/m94ychYPoD0/maxresdefault.jpg" alt="Slide 5">
                            </a>
                        </div>
                        <!-- 슬라이드 6 -->
                        <div class="swiper-slide" target="_blank">
                            <a href="https://www.youtube.com/watch?v=u07400Zuzas" target="_blank">
                                <div class="picture">
                                    <img src="https://img.youtube.com/vi/u07400Zuzas/maxresdefault.jpg" alt="Slide 6">
                                </div>
                            </a>
                        </div>
                        <!-- 슬라이드 7 -->
                        <div class="swiper-slide" target="_blank">
                            <a href="https://www.youtube.com/watch?v=96IyDjL1m4U" target="_blank">
                                <div class="picture">
                                    <img src="https://img.youtube.com/vi/96IyDjL1m4U/maxresdefault.jpg" alt="Slide 7">
                                </div>
                            </a>
                        </div>
                        <!-- 슬라이드 8 -->
                        <div class="swiper-slide" target="_blank">
                            <a href="https://www.youtube.com/watch?v=nJDbjv_iJvg" target="_blank">
                                <div class="picture">
                                    <img src="https://img.youtube.com/vi/nJDbjv_iJvg/maxresdefault.jpg" alt="Slide 8">
                                </div>
                            </a>
                        </div>
                    </div>
                    <!-- Previous and Next Buttons -->
                    <div class="banner2-list">
                        <button class="banner2-left">
                            <i class="fa-solid fa-chevron-left"></i>
                        </button>
                        <button class="banner2-right">
                            <i class="fa-solid fa-chevron-right"></i>
                        </button>
                    </div>
                </div>

            </main>

            <%@ include file="footer.jsp" %>

        </body>

        </html>
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const slides = document.querySelectorAll('.banner1 .slide');
                const buttonLeft = document.querySelector('.button-left');
                const buttonRight = document.querySelector('.button-right');
                let currentIndex = 0;
                const totalSlides = slides.length;

                // 슬라이드 전환 함수
                function showSlide(index) {
                    slides.forEach((slide, i) => {
                        slide.style.display = i === index ? 'block' : 'none';
                        const slideContent = slide.closest('.inner').querySelector('.slide_content');
                        // slide_content가 존재할 경우에만 표시/숨기기
                        if (slideContent) {
                            slideContent.style.display = i === index ? 'block' : 'none';
                        }
                    });
                }

                // 3초마다 자동 슬라이드 전환
                let slideInterval = setInterval(() => {
                    currentIndex = (currentIndex + 1) % totalSlides;
                    showSlide(currentIndex);
                }, 3000);

                // 왼쪽 버튼 클릭 시 이전 슬라이드
                buttonLeft.addEventListener('click', () => {
                    clearInterval(slideInterval); // 자동 슬라이드 멈춤
                    currentIndex = (currentIndex === 0) ? totalSlides - 1 : currentIndex - 1;
                    showSlide(currentIndex);
                    slideInterval = setInterval(() => {
                        currentIndex = (currentIndex + 1) % totalSlides;
                        showSlide(currentIndex);
                    }, 3000); // 자동 슬라이드 다시 시작
                });

                // 오른쪽 버튼 클릭 시 다음 슬라이드
                buttonRight.addEventListener('click', () => {
                    clearInterval(slideInterval); // 자동 슬라이드 멈춤
                    currentIndex = (currentIndex + 1) % totalSlides;
                    showSlide(currentIndex);
                    slideInterval = setInterval(() => {
                        currentIndex = (currentIndex + 1) % totalSlides;
                        showSlide(currentIndex);
                    }, 3000); // 자동 슬라이드 다시 시작
                });

                // 처음 슬라이드 표시
                showSlide(currentIndex);
            });

        </script>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const slides = document.querySelectorAll('.swiper-slide');
                const prevButton = document.querySelector('.banner2-left');
                const nextButton = document.querySelector('.banner2-right');
                let currentIndex = 0;
                const slidesToShow = 3; // 한 번에 보여줄 슬라이드 개수
                const totalSlides = slides.length;

                // 슬라이드 업데이트 함수
                function updateSlides() {
                    slides.forEach((slide, i) => {
                        // 현재 인덱스 범위 내의 슬라이드만 표시
                        if (i >= currentIndex && i < currentIndex + slidesToShow) {
                            slide.style.display = 'block';
                        } else {
                            slide.style.display = 'none';
                        }
                    });
                }

                // 처음 슬라이드 설정
                updateSlides();

                // 다음 버튼 클릭 시
                nextButton.addEventListener('click', () => {
                    if (currentIndex + slidesToShow < totalSlides) {
                        currentIndex++; // 다음 슬라이드로 이동
                        updateSlides(); // 슬라이드 업데이트
                    }
                });

                // 이전 버튼 클릭 시
                prevButton.addEventListener('click', () => {
                    if (currentIndex > 0) {
                        currentIndex--; // 이전 슬라이드로 이동
                        updateSlides(); // 슬라이드 업데이트
                    }
                });
            });
        </script>

        <script>
            $(document).ready(function () {

                // auction클래스 반복하면서 데이터 가져옴
                $('.auction').each(function () {
                    // auction클래스 data-auction-id 속성에서 값을 가져옴
                    var auctionId = $(this).data('auction-id');

                    // 현재 auction클래스 .uploadResult 요소를 선택
                    var uploadResultContainer = $(this).find('.uploadResult ul');

                    if (auctionId) {
                        $.ajax({
                            url: '/auctionListGetFileList1',
                            type: 'GET',
                            data: { auction_id: auctionId },
                            dataType: 'json',
                            success: function (data) {
                                showUploadResult(data, uploadResultContainer);
                            },
                            error: function (xhr, status, error) {
                                console.error('Error fetching file list for notice_num ' + noticeNum + ':', error);
                            }
                        });
                    }
                });
            });

            function showUploadResult(uploadResultArr, uploadResultContainer) {
                if (!uploadResultArr || uploadResultArr.length == 0) {
                    return;
                }

                var str = "";
                uploadResultArr.forEach(function (obj) {
                    var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.fileName);  // 파일 경로 생성
                    str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
                    str += "<div>";
                    str += "<span style='display:none;'>" + obj.fileName + "</span>";
                    str += "<img src='/auctionListDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "' style='width: 220px; height: 250px;'>";
                    str += "</div></li>";
                });

                // 컨테이너를 비우고 파일 리스트 추가
                uploadResultContainer.empty().append(str);
            }

        </script>

        <script>
            $(document).ready(function () {

                // 남은 시간을 매초 업데이트
                let auctionEndTimer = new Date("${list[0].auctionSchedule_end}").getTime();  // 종료 시간 (ISO 형식으로 변환 가능)

                // 즉시 남은 시간을 한 번 계산하여 표시
                $('.finishTime').text("경매 마감 -" + calculateRemainingTime(auctionEndTimer));

                // 1초마다 업데이트
                setInterval(function () {
                    let remainingTime = calculateRemainingTime(auctionEndTimer);
                    $('.finishTime').text("경매 마감 -" + remainingTime);
                }, 1000);

            });
        </script>