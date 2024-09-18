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

        <header>

            <%@ include file="header.jsp" %>
        </header>

        <body>

            <%@ include file="sidebar.jsp" %>

                <main>
                    <div class="banner1">
                        <div class="inner">
                            <img src="images/main_1.jpg" alt="" class="slide" style="display: block;">
                        </div>
                        <div class="inner">
                            <img src="images/main_2.jpg" alt="" class="slide" style="display: none;">
                        </div>
                        <div class="inner">
                            <img src="images/main_3.jpg" alt="" class="slide" style="display: none;">
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
                                <a
                                    href="auctionDetail?auction_lot=${list.auction_lot}&auctionSchedule_id=${list.auctionSchedule_id}">
                                    <div class="auctionToday">
                                        <div class="auctionImg">
                                            <div class="uploadResult">
                                                <ul>
                                                    <c:forEach items="${list.auctionAttachList}" var="attach">
                                                        <li>
                                                            <img src="/auctionMainDisplay?fileName=${attach.uploadPath}/s_${attach.uuid}_${attach.fileName}"
                                                                style="width: 220px; height: 220px;">
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="auctionCon">
                                            <h2>${list.auction_author}</h2>
                                            <h3>${list.auction_title}</h3>
                                            <h4>${list.auction_authorExp}</h4>
                                            <h5>경매 마감 3일 5시간 전</h5>
                                        </div>
                                    </div> <!--auctionToday 끝-->
                                </a>
                            </c:forEach>

                        </div>
                        <div class="conTitle">
                            <h1>주요 출품작</h1>
                            <h5>더보기</h5>
                        </div>
                        <div class="con2">
                            <div class="mainAuction">
                                <div class="auctionImg">
                                    <div class="uploadResult">
                                        <ul>
                                            <img src="images/auction3.jpg">
                                        </ul>
                                    </div>
                                </div>
                                <div class="mainAuctionCon">
                                    <h4>최민중</h4>
                                    <h5>작은 바람들</h5>
                                </div>
                            </div> <!--mainAuction 끝-->
                            <div class="mainAuction">
                                <div class="auctionImg">
                                    <div class="uploadResult">
                                        <ul>
                                            <img src="images/auction4.jpg">
                                        </ul>
                                    </div>
                                </div>
                                <div class="mainAuctionCon">
                                    <h4>최민중</h4>
                                    <h5>작은 바람들</h5>
                                </div>
                            </div> <!--mainAuction 끝-->
                            <div class="mainAuction">
                                <div class="auctionImg">
                                    <div class="uploadResult">
                                        <ul>
                                            <img src="images/auction3.jpg">
                                        </ul>
                                    </div>
                                </div>
                                <div class="mainAuctionCon">
                                    <h4>최민중</h4>
                                    <h5>작은 바람들</h5>
                                </div>
                            </div> <!--mainAuction 끝-->
                            <div class="mainAuction">
                                <div class="auctionImg">
                                    <div class="uploadResult">
                                        <ul>
                                            <img src="images/auction3.jpg">
                                        </ul>
                                    </div>
                                </div>
                                <div class="mainAuctionCon">
                                    <h4>최민중</h4>
                                    <h5>작은 바람들</h5>
                                </div>
                            </div> <!--mainAuction 끝-->
                            <div class="mainAuction">
                                <div class="auctionImg">
                                    <div class="uploadResult">
                                        <ul>
                                            <img src="images/auction3.jpg">
                                        </ul>
                                    </div>
                                </div>
                                <div class="mainAuctionCon">
                                    <h4>최민중</h4>
                                    <h5>작은 바람들</h5>
                                </div>
                            </div> <!--mainAuction 끝-->
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
                                        <img src="https://img.youtube.com/vi/u07400Zuzas/maxresdefault.jpg"
                                            alt="Slide 6">
                                    </div>
                                </a>
                            </div>
                            <!-- 슬라이드 7 -->
                            <div class="swiper-slide" target="_blank">
                                <a href="https://www.youtube.com/watch?v=96IyDjL1m4U" target="_blank">
                                    <div class="picture">
                                        <img src="https://img.youtube.com/vi/96IyDjL1m4U/maxresdefault.jpg"
                                            alt="Slide 7">
                                    </div>
                                </a>
                            </div>
                            <!-- 슬라이드 8 -->
                            <div class="swiper-slide" target="_blank">
                                <a href="https://www.youtube.com/watch?v=nJDbjv_iJvg" target="_blank">
                                    <div class="picture">
                                        <img src="https://img.youtube.com/vi/nJDbjv_iJvg/maxresdefault.jpg"
                                            alt="Slide 8">
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
            $(document).ready(function (e) {
                // 업로드된 파일 목록 표시 함수
                function showUploadResult(uploadResultArr, resultSelector) {
                    if (!uploadResultArr || uploadResultArr.length == 0) {
                        return;
                    }

                    var uploadUL = $(resultSelector + " ul");
                    var str = "";

                    $(uploadResultArr).each(function (i, obj) {
                        if (obj.image) { // 이미지 파일의 경우
                            var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
                            str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
                            str += "<div><img style='width: 90px; height: 90px;' src='/auctionMainDisplay?fileName=" + fileCallPath + "'></div></li>";
                        } else { // 이미지 외 파일의 경우
                            var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
                            str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
                            str += "<div><span>" + obj.fileName + "</span></div></li>";
                        }
                    });

                    uploadUL.append(str); // 파일 목록 추가
                }

                // 이미지 목록을 추가하는 부분
                showUploadResult(yourUploadResultArray, ".uploadResult");
            });

        </script>