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
            <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
        </head>
        <style>
            .headerMid .rightMenu {
                display: flex;
                margin-left: 254px;
                flex-direction: column;
                align-items: flex-end;
                margin-top: -30px;
            }

            .rightMenu .log {
                display: flex;
                margin-bottom: 10px;
            }

            .headerMid .rightMenu li .icon {
                font-size: var(--font-size20);
                color: var(--color-black);
                cursor: pointer;
            }

            .headerMid .rightMenu .log {
                font-size: var(--font-size12);
                margin-top: 5px;
                cursor: pointer;
            }

            /* Default style */
            .headerMid .menu {
                display: flex;
                justify-content: space-around;
                cursor: context-menu;
                margin-right: 24px;
            }

            /* Apply when logged-in class is present */
            .headerMid .menu.logged-in {
                margin-right: 14px;
            }

        </style>

        <body>

            <header>
                <div class="headerTop">
                    <h5>나성엽 [여덟을 꺼내는 시간] 8월 20일 경매 시작</h5>
                </div>
                <div class="headerMain">
                    <div class="headerMid">
                        <h5 class="logo">
                            <a href="main">
                                <img src="images/logo.png" alt="Logo">
                            </a>
                        </h5>
                        <ul class="menu" id="menu">
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
                            <div class="log">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.user}">
                                        <p class="logOut" onclick="logout()">로그아웃</p>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="loginPage">
                                            <p class="logIn" style="color: var(--color-black);">로그인</p>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <li>
                                <c:choose>
                                    <c:when test="${sessionScope.user.role == 1}">
                                        <a href="userInfo">
                                            <span class="icon">
                                                <i class="fa-solid fa-user"></i>
                                            </span>
                                        </a>
                                    </c:when>
                                    <c:when test="${sessionScope.user.role == 2}">
                                        <a href="managerAuction">
                                            <span class="icon">
                                                <i class="fa-solid fa-user"></i>
                                            </span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- role이 1 또는 2가 아닌 경우에 대한 처리 -->
                                        <a href="loginPage">
                                            <span class="icon">
                                                <i class="fa-solid fa-user"></i>
                                            </span>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </ul>
                    </div> <!--headerMid 끝-->
                </div>
                <div class="headerContent">
                    <div class="headerCon con1">
                        <div class="headerTab cp">
                            <a href="auctionProgress">
                                <p>진행 경매</p>
                            </a>
                        </div>
                        <div class="headerTab cp">
                            <a href="auctionScheduled">
                                <p>예정 경매</p>
                            </a>
                        </div>
                        <div class="headerTab cp">
                            <a href="auctionResult">
                                <p>경매 결과</p>
                            </a>
                        </div>
                        <div class="headerTab"></div>
                    </div>
                    <div class="headerCon con2">
                        <div class="headerTab cp">
                            <a href="guideAuction">
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
                            <a href="userCommission">
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
                            <a href="question">
                                <p>1:1 문의</p>
                            </a>
                        </div>
                        <div class="headerTab rt"></div>
                        <div class="headerTab rt"></div>
                    </div>
                </div>


                <!-- 응찰 모달 -->
                <div id="modalBid" class="modalBid">
                    <div class="modalBid-content">
                        <div class="bidHead"></div>
                        <span class="close-btn">&times;</span>
                        <div class="bidCon">
                            <div class="left">
                                <h5>LOT 1</h5>
                                <div class="auctionImg">
                                    <div class="uploadResult">
                                        <ul>
                                            <img src="images/auction1.jpg">
                                        </ul>
                                    </div>
                                </div> <!--auctionImg 끝-->
                                <h2>나성엽</h2>
                                <h3>여덟을 꺼내는 시간</h3>
                                <h4>캔버스에 유채</h4>
                                <h4 class="size">33 x 33 cm | 2020</h4>
                            </div> <!--left 끝-->

                            <div class="right">
                                <div class="time">
                                    <h5>남은시간 3일 05:20:03</h5>
                                    <h4>호가단위 : KRW 1,000,000</h4>
                                </div>
                                <div class="box">
                                    <div class="boxHead">
                                        <h4>현재가</h4>
                                        <div class="headCount">
                                            <h4>KRW 12,500,000</h4>
                                            <h4>(응찰 1)</h4>
                                        </div>
                                    </div>
                                    <div class="boxCon">
                                        <div class="boxList">
                                            <h3>하*수</h3>
                                            <h4 style="color: var(--color-burgundy);">12,500,000</h4>
                                            <h5>24.09.06</h5>
                                            <h5>13:56:31</h5>
                                        </div> <!--boxList 끝-->
                                        <div class="boxList">
                                            <h3>나*엽</h3>
                                            <h4>8,000,000</h4>
                                            <h5>24.09.06</h5>
                                            <h5>11:20:09</h5>
                                        </div> <!--boxList 끝-->

                                    </div> <!-- boxCon 끝-->
                                </div> <!--box 끝-->

                                <div class="bidType">
                                    <div class="type choice">
                                        1회 응찰
                                    </div>
                                    <div class="type">
                                        자동응찰
                                    </div>
                                </div>

                                <h5 class="red">* 응찰하기 버튼을 누르시면 취소가 불가능합니다.</h5>
                                <h5 class="gray">* 동시 응찰자 경우, 서버시각(KST) 기준 우선순위가 부여됩니다.</h5>

                                <div class="buttonBid">
                                    <select name="" id="">
                                        <option value="13,000,000">13,000,000</option>
                                        <option value="14,000,000">14,000,000</option>
                                        <option value="15,000,000">15,000,000</option>
                                    </select>
                                    <button class="bidBtn">응찰하기</button>
                                    <!-- <button class="bidBtn maximum">최고가 응찰 중</button> -->
                                </div>
                            </div> <!--right 끝-->

                        </div> <!--bidCon 끝-->

                    </div> <!--modalBid-content 끝-->
                </div> <!--modalBid 끝-->
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
        <script>
            //응찰 모달 팝업 스크립트
            document.addEventListener("DOMContentLoaded", function () {
                console.log("페이지가 로드되었습니다.");

                // "응찰하기" 버튼 존재 여부 확인
                var openModalBtn = document.getElementById("openModalBidBtn");
                if (openModalBtn) {
                    console.log("응찰하기 버튼이 있습니다.");

                    // 응찰하기 모달 열기
                    openModalBtn.addEventListener("click", function () {
                        console.log("응찰하기 버튼 클릭됨");
                        document.getElementById("modalBid").style.display = "block";
                    });

                    // 모달 닫기 버튼
                    document.querySelector(".close-btn").addEventListener("click", function () {
                        console.log("모달 닫기 버튼 클릭됨");
                        document.getElementById("modalBid").style.display = "none";
                    });

                    // 모달 외부 클릭 시 닫기
                    window.addEventListener("click", function (event) {
                        if (event.target.classList.contains('modalBid')) {
                            console.log("모달 외부 클릭됨");
                            document.getElementById("modalBid").style.display = "none";
                        }
                    });
                } else {
                    console.log("응찰하기 버튼을 찾을 수 없습니다.");
                }
            });

        </script>

        <script>
            function logout() {
                // 네이버 로그아웃 URL에 비동기 요청을 보내고, 페이지 전환을 막음
                const naverLogoutUrl = "https://nid.naver.com/nidlogin.logout";

                // 네이버 로그아웃 요청을 백그라운드에서 보내고, 사용자에게는 페이지 전환 없이 처리
                var logoutWindow = window.open(naverLogoutUrl, "_blank", "width=1,height=1");

                // 잠시 후 창을 닫음 (네이버 로그아웃 처리가 완료된 후 창을 닫기 위한 타이밍)
                setTimeout(function () {
                    logoutWindow.close();
                    // 로컬 로그아웃 처리 후 메인 페이지로 이동
                    $.post("${pageContext.request.contextPath}/logout", function () {
                        window.location.href = "${pageContext.request.contextPath}/main";
                    });
                }, 1000);  // 1초 정도 기다린 후 창 닫기
            }
        </script>

        <script>
            $(document).ready(function () {
                // 세션 정보가 있는지 확인하여 메뉴 스타일 변경
                var isLoggedIn = "${not empty sessionScope.user}";
                if (isLoggedIn === "true") {
                    $("#menu").addClass("logged-in");
                } else {
                    console.log("응찰하기 버튼을 찾을 수 없습니다.");
                }
            });
        </script>


<script>
// -----------------------------------------------------------------
// -----------------------------------------------------------------
//                             나성엽
// -----------------------------------------------------------------
// -----------------------------------------------------------------
    
    let userInfo;

    $(document).ready(function() {
        $.ajax({
            url: "/api/auction/userInfo",
            method: "GET",
            success: function(data) {
                if (data) {
                    userInfo = data;  // 데이터를 전역 변수에 저장
                } else {
                    console.log("사용자 정보가 없습니다.");
                }
            },
            error: function(err) {
                console.log("Error:", err);
            }
        });
    });



    // STOMP 클라이언트 설정
    var socket = new SockJS('/auction-websocket');  // 서버에 설정한 엔드포인트
    var stompClient = Stomp.over(socket);

    // STOMP 연결
    stompClient.connect({}, function (frame) {
        console.log('STOMP 연결됨: ' + frame);

        // 서버로부터 경매 업데이트 메시지를 받으면 처리
        stompClient.subscribe('/sub/auctionUpdates', function (message) {
            var auctionUpdate = JSON.parse(message.body);
            console.log('경매 업데이트: ', auctionUpdate);

            // 예시: 현재가 업데이트
            document.querySelector('.headCount h4').textContent = 'KRW ' + auctionUpdate.lateBidMoney;
        });
    });

    // 경매 참여 버튼 클릭 시 서버로 메시지 전송
    // document.querySelector('.bidBtn').addEventListener('click', function() {
    //     var selectedBid = document.querySelector('select').value;
    //     stompClient.send("/app/bid", {}, JSON.stringify({ bidAmount: selectedBid }));
    // });

    // STOMP 연결 후 응찰하기 버튼 클릭 시 서버로 메시지 전송
    document.querySelector('.bidBtn').addEventListener('click', function() {
        var selectedBid = document.querySelector('select').value;

        // 입찰 정보를 STOMP로 서버에 전송
        stompClient.send("/pub/bid", {}, JSON.stringify({
            userId: userInfo.id,  // 현재 사용자의 ID
            auctionId: "${auction.auction_id}",  // 경매 ID
            bidMoney: selectedBid
        }));
    });


// -----------------------------------------------------------------
// -----------------------------------------------------------------
//                           나성엽 끝
// -----------------------------------------------------------------
// -----------------------------------------------------------------
</script>


