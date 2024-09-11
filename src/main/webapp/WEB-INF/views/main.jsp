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
                            <div class="outer">
                                <div class="inner-list">
                                    <!-- 마지막 슬라이드를 복사해 맨 앞에 붙임 -->
                                    <div class="inner">
                                        <img src="${pageContext.request.contextPath}/images/main_6.jpg" alt="">
                                    </div>

                                    <!-- 원본 슬라이드 -->
                                    <div class="inner">
                                        <img src="${pageContext.request.contextPath}/images/main_1.jpg" alt="">
                                    </div>
                                    <div class="inner">
                                        <img src="${pageContext.request.contextPath}/images/main_2.jpg" alt="">
                                    </div>
                                    <div class="inner">
                                        <img src="${pageContext.request.contextPath}/images/main_3.jpg" alt="">
                                        <div class="slide_content">
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
                                        <img src="${pageContext.request.contextPath}/images/main_4.jpg" alt="">
                                        <div class="slide_content">
                                            <div class="box_title">
                                                <p>미술품 보관</p>
                                            </div>
                                            <div class="box_content">
                                                <p>미술 작품을 안전하게 보관할 전문 서비스를 찾고 계신가요?</p>
                                                <p>대한민국 대표 미술품 경매회사 Lupin에서 미술 작품 전문 수장고 서비스를 제공합니다.</p>
                                            </div>
                                            <div class="box_btn">
                                                <a href="">
                                                    <p>바로가기</p>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="inner">
                                        <img src="${pageContext.request.contextPath}/images/main_5.jpg" alt="">
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
                                                <a href="">
                                                    <p>바로가기</p>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="inner">
                                        <img src="${pageContext.request.contextPath}/images/main_6.jpg" alt="">
                                        <div class="slide_content">
                                            <div class="box_title">
                                                <p>FAQ</p>
                                            </div>
                                            <div class="box_content">
                                                <p>궁금한 사항이 있으시다면 FAQ를 먼저 확인해 보세요.</p>
                                                <p>필요한 답변을 즉시 찾으실 수 있습니다! 더 자세한 정보는 FAQ에서 확인하세요!</p>
                                            </div>
                                            <div class="box_btn">
                                                <a href="${pageContext.request.contextPath}/faq.html">
                                                    <p>바로가기</p>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- 첫 번째 슬라이드를 복사해 맨 뒤에 붙임 -->
                                    <div class="inner">
                                        <img src="${pageContext.request.contextPath}/images/main_1.jpg" alt="">
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
                                <h5>더보기</h5>
                            </div>
                            <div class="con1">
                                <div class="auctionToday">
                                    <div class="auctionImg">
                                        <div class="uploadResult">
                                            <ul>
                                                <img src="images/auction1.jpg">
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="auctionCon">
                                        <h2>나성엽</h2>
                                        <h3>여덟을 꺼내는 시간</h3>
                                        <h4>캔버스에 유채</h4>
                                        <h5>경매 마감 3일 5시간 전</h5>
                                    </div>
                                </div> <!--auctionToday 끝-->
                                <div class="auctionToday">
                                    <div class="auctionImg">
                                        <div class="uploadResult">
                                            <ul>
                                                <img src="images/auction2.jpg">
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="auctionCon">
                                        <h2>나성엽</h2>
                                        <h3>여덟을 꺼내는 시간</h3>
                                        <h4>캔버스에 유채</h4>
                                        <h5>경매 마감 3일 5시간 전</h5>
                                    </div>
                                </div> <!--auctionToday 끝-->
                                <div class="auctionToday">
                                    <div class="auctionImg">
                                        <div class="uploadResult">
                                            <ul>
                                                <img src="images/auction1.jpg">
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="auctionCon">
                                        <h2>나성엽</h2>
                                        <h3>여덟을 꺼내는 시간</h3>
                                        <h4>캔버스에 유채</h4>
                                        <h5>경매 마감 3일 5시간 전</h5>
                                    </div>
                                </div> <!--auctionToday 끝-->
                            </div> <!--con1 끝-->
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
                            <div class="michelinArtistVisual">
                                <h2 class="michelin_artist_title">미술랭 가이드</h2>
                                <p class="michelin_artist_sec_text">예술은 사실 맛있다!</p>
                                <div class="swiper-container">
                                    <div class="swiper-wrapper">
                                        <!-- 슬라이드 1 -->
                                        <div class="swiper-slide">
                                            <a href="https://www.youtube.com/watch?v=hBfGT1vQbE0" target="_blank">
                                                <img src="https://img.youtube.com/vi/hBfGT1vQbE0/maxresdefault.jpg"
                                                    alt="Slide 1">
                                            </a>
                                        </div>
                                        <!-- 슬라이드 2 -->
                                        <div class="swiper-slide">
                                            <a href="https://www.youtube.com/watch?v=Zou7y3zQE_0" target="_blank">
                                                <img src="https://img.youtube.com/vi/Zou7y3zQE_0/maxresdefault.jpg"
                                                    alt="Slide 2">
                                            </a>
                                        </div>
                                        <!-- 슬라이드 3 -->
                                        <div class="swiper-slide">
                                            <a href="https://www.youtube.com/watch?v=o6EMCVSh8aI" target="_blank">
                                                <img src="https://img.youtube.com/vi/o6EMCVSh8aI/maxresdefault.jpg"
                                                    alt="Slide 3">
                                            </a>
                                        </div>
                                        <!-- 슬라이드 4 -->
                                        <div class="swiper-slide">
                                            <a href="https://www.youtube.com/watch?v=a1xJonmeg34" target="_blank">
                                                <img src="https://img.youtube.com/vi/a1xJonmeg34/maxresdefault.jpg"
                                                    alt="Slide 4">
                                            </a>
                                        </div>
                                        <!-- 슬라이드 5 -->
                                        <div class="swiper-slide">
                                            <a href="https://www.youtube.com/watch?v=m94ychYPoD0" target="_blank">
                                                <img src="https://img.youtube.com/vi/m94ychYPoD0/maxresdefault.jpg"
                                                    alt="Slide 5">
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
                                        <div class="swiper-slide" target="_blank">
                                            <a href="https://www.youtube.com/watch?v=96IyDjL1m4U" target="_blank">
                                                <div class="picture">
                                                    <img src="https://img.youtube.com/vi/96IyDjL1m4U/maxresdefault.jpg"
                                                        alt="Slide 7">
                                                </div>
                                            </a>
                                        </div>
                                        <div class="swiper-slide" target="_blank">
                                            <a href="https://www.youtube.com/watch?v=nJDbjv_iJvg" target="_blank">
                                                <div class="picture">
                                                    <img src="https://img.youtube.com/vi/nJDbjv_iJvg/maxresdefault.jpg"
                                                        alt="Slide 8">
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="swiper_btn">
                                        <div class="swiper-button-prev">
                                            <i class="fa-solid fa-chevron-left"></i>
                                        </div>
                                        <div class="swiper-button-next">
                                            <i class="fa-solid fa-chevron-right"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </main>

                    <%@ include file="footer.jsp" %>

        </body>

        </html>
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const outer = document.querySelector('.outer');
                const innerList = document.querySelector('.inner-list');
                const inners = document.querySelectorAll('.inner');
                let currentIndex = 1; // 첫 번째 슬라이드로 시작 (클론된 슬라이드를 고려)
                let allowShift = true; // 중복 이동 방지 플래그

                function updateWidths() {
                    // 모든 inner의 width를 outer의 width로 설정
                    inners.forEach(inner => {
                        inner.style.width = `${outer.clientWidth}px`;
                    });
                    // innerList의 width를 inner의 width * inner의 개수로 설정
                    innerList.style.width = `${outer.clientWidth * inners.length}px`;
                    innerList.style.marginLeft = `-${outer.clientWidth}px`; // 첫 번째 슬라이드에 위치시키기
                }

                // 처음에 실행
                updateWidths();

                const buttonLeft = document.querySelector('.button-left');
                const buttonRight = document.querySelector('.button-right');

                function slide() {
                    if (!allowShift) return; // 중복 실행 방지
                    allowShift = false; // 슬라이드 이동 중 중복 실행 방지
                    innerList.style.transition = "margin-left 0.5s ease-out";
                    innerList.style.marginLeft = `-${outer.clientWidth * currentIndex}px`;

                    innerList.addEventListener('transitionend', checkIndex, { once: true });
                }

                function checkIndex() {
                    allowShift = true;

                    if (currentIndex === 0) {
                        // 마지막 슬라이드에서 첫 슬라이드로 이동
                        innerList.style.transition = "none";
                        currentIndex = inners.length - 2; // 마지막 슬라이드의 실제 인덱스
                        innerList.style.marginLeft = `-${outer.clientWidth * currentIndex}px`;
                    }

                    if (currentIndex === inners.length - 1) {
                        // 첫 번째 슬라이드에서 마지막 슬라이드로 이동
                        innerList.style.transition = "none";
                        currentIndex = 1; // 첫 번째 슬라이드의 실제 인덱스
                        innerList.style.marginLeft = `-${outer.clientWidth * currentIndex}px`;
                    }
                }

                if (buttonLeft && buttonRight) {
                    buttonLeft.addEventListener('click', () => {
                        if (allowShift) {
                            currentIndex--;
                            slide();
                        }
                    });

                    buttonRight.addEventListener('click', () => {
                        if (allowShift) {
                            currentIndex++;
                            slide();
                        }
                    });
                } else {
                    console.error("버튼을 찾을 수 없습니다.");
                }

                const getInterval = () => {
                    return setInterval(() => {
                        currentIndex++;
                        slide();
                    }, 5000);
                };

                let interval = getInterval(); // interval 등록

                window.addEventListener('resize', updateWidths);
            });
        </script>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const swiperWrapper = document.querySelector('.swiper-wrapper');
                const swiperSlides = document.querySelectorAll('.swiper-slide');
                const buttonNext = document.querySelector('.swiper-button-next');
                const buttonPrev = document.querySelector('.swiper-button-prev');

                let currentIndex = 0;
                const slideWidth = 520; // 슬라이드 폭 + 여백
                const totalSlides = swiperSlides.length;
                const slidesPerView = Math.min(3, totalSlides); // 슬라이드 수가 3보다 적을 경우, 그 수에 맞게 조정

                // 슬라이드 위치 업데이트 함수
                function updateSlidePosition() {
                    const maxTranslate = (totalSlides - slidesPerView) * slideWidth;
                    swiperWrapper.style.transform = `translateX(-${Math.min(currentIndex * slideWidth, maxTranslate)}px)`;
                }

                // 다음 슬라이드 버튼 클릭 시
                buttonNext.addEventListener('click', () => {
                    if (currentIndex < totalSlides - slidesPerView) {
                        currentIndex++;
                        updateSlidePosition();
                    }
                });

                // 이전 슬라이드 버튼 클릭 시
                buttonPrev.addEventListener('click', () => {
                    if (currentIndex > 0) {
                        currentIndex--;
                        updateSlidePosition();
                    }
                });

                // 윈도우 리사이즈 시 슬라이드 위치 재조정
                window.addEventListener('resize', updateSlidePosition);
            });

        </script>