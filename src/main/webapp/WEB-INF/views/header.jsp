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
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
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

            <header>
                <div class="headerTop">
                    <h5>나성엽 [여덟을 꺼내는 시간] 8월 20일 경매 시작</h5>
                </div>
                <div class="headerMain">
                    <div class="headerMid">
                        <h5 class="logo">
                            <a href="main">
                                <img src="images/logo.svg" alt="Logo">
                            </a>
                        </h5>
                        <ul class="menu">
                            <li class="tab t1">
                                <h5>경매</h5>
                            </li>
                            <li class="tab t2">
                                <h5>참여안내</h5>
                            </li>
                            <li class="tab t3">
                                <h5>서비스</h5>
                            </li>
                            <li class="tab t4">
                                <h5>고객지원</h5>
                            </li>
                        </ul>
                        <ul class="rightMenu">
                            <li>
                                <a href="#">
                                    <span class="icon">
                                        <i class="fa-solid fa-user"></i>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </div> <!--headerMid 끝-->
                </div>
                <div class="headerContent">
                    <div class="headerCon con1">
                        <div class="headerTab cp">
                            <a href="">
                                <p>진행 경매</p>
                            </a>
                        </div>
                        <div class="headerTab cp">
                            <a href="">
                                <p>예정 경매</p>
                            </a>
                        </div>
                        <div class="headerTab cp">
                            <a href="">
                                <p>경매 결과</p>
                            </a>
                        </div>
                        <div class="headerTab"></div>
                    </div>
                    <div class="headerCon con2">
                        <div class="headerTab cp">
                            <a href="">
                                <p>응찰 안내</p>
                            </a>
                        </div>
                        <div class="headerTab cp">
                            <a href="guideCommission">
                                <p>위탁안내</p>
                            </a>
                        </div>
                        <div class="headerTab"></div>
                        <div class="headerTab"></div>
                    </div>
                    <div class="headerCon con3">
                        <div class="headerTab cp">
                            <a href="">
                                <p>전시 정보</p>
                            </a>
                        </div>
                        <div class="headerTab cp">
                            <a href="">
                                <p>위탁 신청</p>
                            </a>
                        </div>
                        <div class="headerTab cp">
                            <a href="guideStorage">
                                <p>미술품 보관</p>
                            </a>
                        </div>
                        <div class="headerTab"></div>
                    </div>
                    <div class="headerCon con4">
                        <div class="headerTab rt cp">
                            <a href="faq">
                                <p>FAQ</p>
                            </a>
                        </div>
                        <div class="headerTab rt cp">
                            <a href="">
                                <p>1:1 문의</p>
                            </a>
                        </div>
                        <div class="headerTab rt"></div>
                        <div class="headerTab rt"></div>
                    </div>
                </div>
            </header>

        </body>

        </html>
        <script>
            $(document).ready(function () {
                // 메뉴에 hover했을 때 headerContent를 표시
                $('.menu').hover(
                    function () {
                        $('.headerContent').css('display', 'flex');
                    },
                    function () {
                        $('.headerContent').css('display', 'none');
                    }
                );

                $('.headerContent').hover(
                    function () {
                        $(this).css('display', 'flex');
                    },
                    function () {
                        $(this).css('display', 'none');
                    }
                );
            });
        </script>
        <script>
            $(document).ready(function () {
                // 각 탭에 hover 시 관련된 con 요소의 배경색을 변경
                $('.t1').hover(
                    function () {
                        $('.con1').css('background-color', 'var(--color-white)');
                    },
                    function () {
                        $('.con1').css('background-color', ''); // 원래 상태로 복귀
                    }
                );

                // con1에 hover 시 t1의 border-bottom 스타일을 변경
                $('.con1').hover(
                    function () {
                        $('.t1').css('border-bottom', '2.5px solid var(--color-black)');
                        $('.t1').css('padding-bottom', '4px');
                    },
                    function () {
                        $('.t1').css('border-bottom', '');
                    }
                );

                // 각 탭에 hover 시 관련된 con 요소의 배경색을 변경
                $('.t2').hover(
                    function () {
                        $('.con2').css('background-color', 'var(--color-white)');
                    },
                    function () {
                        $('.con2').css('background-color', ''); // 원래 상태로 복귀
                    }
                );

                // con1에 hover 시 t1의 border-bottom 스타일을 변경
                $('.con2').hover(
                    function () {
                        $('.t2').css('border-bottom', '2.5px solid var(--color-black)');
                        $('.t2').css('padding-bottom', '4px');
                    },
                    function () {
                        $('.t2').css('border-bottom', '');
                    }
                );

                // 각 탭에 hover 시 관련된 con 요소의 배경색을 변경
                $('.t3').hover(
                    function () {
                        $('.con3').css('background-color', 'var(--color-white)');
                    },
                    function () {
                        $('.con3').css('background-color', ''); // 원래 상태로 복귀
                    }
                );

                // con1에 hover 시 t1의 border-bottom 스타일을 변경
                $('.con3').hover(
                    function () {
                        $('.t3').css('border-bottom', '2.5px solid var(--color-black)');
                        $('.t3').css('padding-bottom', '4px');
                    },
                    function () {
                        $('.t3').css('border-bottom', '');
                    }
                );

                // 각 탭에 hover 시 관련된 con 요소의 배경색을 변경
                $('.t4').hover(
                    function () {
                        $('.con4').css('background-color', 'var(--color-white)');
                    },
                    function () {
                        $('.con4').css('background-color', ''); // 원래 상태로 복귀
                    }
                );

                // con1에 hover 시 t1의 border-bottom 스타일을 변경
                $('.con4').hover(
                    function () {
                        $('.t4').css('border-bottom', '2.5px solid var(--color-black)');
                        $('.t4').css('padding-bottom', '4px');
                    },
                    function () {
                        $('.t4').css('border-bottom', '');
                    }
                );
            });

        </script>