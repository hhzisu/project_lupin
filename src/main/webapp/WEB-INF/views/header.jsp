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
                                        <div class="userinformationWrap">
                                            <a class="userInfomation" href="userInfo">
                                                <span class="icon">
                                                    <i class="fa-solid fa-user"></i>
                                                </span>
                                                <p>${sessionScope.user.name}님</p>
                                            </a>
                                        </div>
                                    </c:when>
                                    <c:when test="${sessionScope.user.role == 2}">
                                        <div class="userinformationWrap">
                                            <a class="userInfomation" href="managerAuction">
                                                <span class="icon">
                                                    <i class="fa-solid fa-user"></i>
                                                </span>
                                                <p>관리자님</p>
                                            </a>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- role이 1 또는 2가 아닌 경우에 대한 처리 -->
                                        <div class="userinformationWrap">
                                            <a class="userInfomation" href="loginPage">
                                            <p style="color: var(--color-white);">고객고객</p>
                                                <span class="icon">
                                                    <i class="fa-solid fa-user"></i>
                                                </span>
                                                <!-- <p>관리자님</p> -->
                                            </a>
                                        </div>
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
                                <p>위탁 안내</p>
                            </a>
                        </div>
                        <div class="headerTab"></div>
                        <div class="headerTab"></div>
                    </div>
                    <div class="headerCon con3">
                        <div class="headerTab cp">
                            <a href="performances">
                                <p>전시 정보</p>
                            </a>
                        </div>
                        <div class="headerTab cp">
                            <c:choose>
                                <c:when test="${sessionScope.user.role == 1}">
                                    <div class="userInfoWrap">
                                        <a href="userCommission">
                                            <p>위탁 신청</p>
                                        </a>
                                    </div>
                                </c:when>
                                <c:when test="${sessionScope.user.role == 2}">
                                    <div class="userInfoWrap">
                                        <a href="managerCommission">
                                            <p>위탁 신청</p>
                                        </a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <!-- role이 1 또는 2가 아닌 경우에 대한 처리 -->
                                    <div class="userInfoWrap">
                                        <a href="loginPage">
                                            <p>위탁 신청</p>
                                        </a>
                                    </div>
                                </c:otherwise>
                            </c:choose>
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
                            <c:choose>
                                <c:when test="${sessionScope.user.role == 1}">
                                    <div class="userInfoWrap">
                                        <a href="question">
                                            <p>1:1 문의</p>
                                        </a>
                                    </div>
                                </c:when>
                                <c:when test="${sessionScope.user.role == 2}">
                                    <div class="userInfoWrap">
                                        <a href="managerQuestion">
                                            <p>1:1 문의</p>
                                        </a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <!-- role이 1 또는 2가 아닌 경우에 대한 처리 -->
                                    <div class="userInfoWrap">
                                        <a href="loginPage">
                                            <p>1:1 문의</p>
                                        </a>
                                    </div>
                                </c:otherwise>
                            </c:choose>
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
                                            <!-- <img src="images/auction1.jpg"> -->
                                            <img src="">
                                        </ul>
                                    </div>
                                </div> <!--auctionImg 끝-->
                                <h2></h2>
                                <h3></h3>
                                <h4></h4>
                                <h4 class="size"></h4>
                            </div> <!--left 끝-->

                            <div class="right">
                                <div class="time">
                                    <h5></h5>
                                    <h4></h4>
                                </div>
                                <div class="box">
                                    <div class="boxHead">
                                        <h4>현재가</h4>
                                        <div class="headCount">
                                            <h4 class="boxCurrentPrice"></h4>
                                            <h4 class="boxHeadCount"></h4>
                                        </div>
                                    </div>
                                    <div class="boxCon">
                                        <!-- <div class="boxList">
                                            <h3>하*수</h3>
                                            <h4 style="color: var(--color-burgundy);">12,500,000</h4>
                                            <h5>24.09.06</h5>
                                            <h5>13:56:31</h5>
                                        </div>  -->
                                        <!--boxList 끝-->
                                        <!-- <div class="boxList">
                                            <h3>나*엽</h3>
                                            <h4>8,000,000</h4>
                                            <h5>24.09.06</h5>
                                            <h5>11:20:09</h5>
                                        </div>  -->
                                        <!--boxList 끝-->

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

                                <div class="buttonBid bidingPossible">
                                    <select name="" id="">
                                    </select>
                                    <button class="bidBtn onceBiding">응찰하기</button>
                                    <button class="bidBtn AutoBiding">자동응찰</button>
                                </div>
                                <div class="buttonBid bidingImpossible">
                                    최고가 응찰 중입니다
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
                        if(!userInfo) {
                            alert("로그인이 필요한 기능입니다.");
                            location='loginPage';
                        } else {
                            console.log("응찰하기 버튼 클릭됨");
                            console.log("@# 모달 열린 후 auctionId=>" + auctionId);
                            loadAuctionData(auctionId);
                            document.getElementById("modalBid").style.display = "block";
                        }
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
    
    let userInfo; // 로그인 유저정보 전역변수
    const auctionId = "${auction.auction_id}";  // 경매 ID 가져오기

    $(document).ready(function() {
        
        $('.bidBtn.AutoBiding').hide();
        $('.bidingImpossible').hide();
        
        // loadAuctionData(auctionId);

        $.ajax({
            url: "/api/auction/userInfo",
            method: "GET",
            success: function(data) {
                if (data) {
                    userInfo = data;  // 데이터를 전역 변수에 저장
                    // alert("환영합니다, " + userInfo.name);
                    console.log("@# userInfo.id=>"+userInfo.id);
                } else {
                    console.log("사용자 정보가 없습니다.");
                }
            },
            error: function(err) {
                console.log("Error:", err);
            }
        });
    });


 
    // 1회 응찰 / 자동응찰 선택

    $(document).ready(function() {
        // 1회 응찰과 자동응찰 버튼을 클릭할 때 클래스 변경 및 UI 업데이트
        $('.bidType .type').click(function() {
            // 기존 choice 클래스 제거
            $('.bidType .type').removeClass('choice');
            
            // 클릭한 버튼에 choice 클래스 추가
            $(this).addClass('choice');
            
            // 선택된 응찰 방식에 따른 UI 업데이트
            if ($(this).text().trim() === '1회 응찰') {
                // 1회 응찰이 선택된 경우
                $('.onceBiding').show();
                $('.AutoBiding').hide();
            } else {
                // 자동응찰이 선택된 경우
                $('.AutoBiding').show();
                $('.onceBiding').hide();
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

            loadAuctionData(auctionId);
        });
    });


    // STOMP 연결 후 '응찰하기' 버튼 클릭 시 서버로 메시지 전송
    document.querySelector('.onceBiding').addEventListener('click', function() {
        var selectedBid = document.querySelector('select').value;

        // 입찰 정보를 STOMP로 서버에 전송
        stompClient.send("/pub/bid", {}, JSON.stringify({
            userId: userInfo.id,  // 현재 사용자의 ID
            auctionId: auctionId,  // 경매 ID
            bidMoney: selectedBid // 입찰가
        }));
    });


    // STOMP 연결 후 '자동응찰' 버튼 클릭 시 서버로 메시지 전송
    document.querySelector('.AutoBiding').addEventListener('click', function() {
        var selectedBid = document.querySelector('select').value;

        // 입찰 정보를 STOMP로 서버에 전송
        stompClient.send("/pub/autoBid", {}, JSON.stringify({
            userId: userInfo.id,  // 현재 사용자의 ID
            auctionId: auctionId,  // 경매 ID
            maxBidLimit: selectedBid // 자동응찰 한도금액
        }));
    });



    function loadAuctionData(auctionId) {
        $.ajax({
            url: "/api/auction/" + auctionId,  // 서버의 경매 데이터를 가져오는 엔드포인트
            method: "GET",
            success: function(auction) {
                // let bidStartPrice = parseInt(auction.auction_startPrice.replace(/,/g, ''), 10);

                // 현재가 (bidHistory가 존재하지 않으면 startPrice 사용)
                let currentPrice = (auction.bidHistory && auction.bidHistory.length > 0)
                                 ? auction.bidHistory[0].bidMoney
                                 : auction.auction_startPrice;

                console.log('@# auction.bidHistory.length=>'+auction.bidHistory.length);
                console.log('@# auction.bidHistory=>'+auction.bidHistory);


                // 드롭박스에 호가 단위로 금액 추가
                const selectBox = $('.buttonBid select');
                selectBox.empty();  // 기존의 옵션 제거

                // let currentPriceDrop = parseInt(currentPrice.replace(/,/g, ''), 10);  // 문자열을 숫자로 변환

                // 호가 단위 계산 및 표시
                let bidIncrement = getBidIncrement(currentPrice);  // 호가 단위 결정

                // 응찰자 유무로 현재가/시작가 기준 바뀜
                if (!auction.bidHistory || auction.bidHistory.length == 0) {
                    console.log('시작가로 첫응찰 시작');

                    // 현재가에서 5단계 높은 가격까지 옵션 추가
                    for (let i = 0; i <= 4; i++) {
                        let newBidAmount = currentPrice + (i * bidIncrement);
                        let formattedBidAmount = newBidAmount.toLocaleString();  // 3자리마다 콤마 추가
                        selectBox.append(`<option value="\${newBidAmount}">KRW \${formattedBidAmount}</option>`);
                    }
                } else {
                    console.log('현재가로 응찰');

                    // 현재가에서 5단계 높은 가격까지 옵션 추가
                    for (let i = 1; i <= 5; i++) {
                        let newBidAmount = currentPrice + (i * bidIncrement);
                        let formattedBidAmount = newBidAmount.toLocaleString();  // 3자리마다 콤마 추가
                        selectBox.append(`<option value="\${newBidAmount}">KRW \${formattedBidAmount}</option>`);
                    }
                }


                if (auction.bidHistory.length > 0) {
                    // 드롭박스와 버튼을 숨길지 결정
                    console.log('@# auction.bidHistory=>', auction.bidHistory);
                    console.log('@# auction.bidHistory[0].userId=>', auction.bidHistory[0].userId);

                    let isHighestBidder = (auction.bidHistory[0].userId == userInfo.id);
                    console.log('@# isHighestBidder=>', isHighestBidder);

                    const bidingPossible = $('.bidingPossible');
                    const bidingImpossible = $('.bidingImpossible');

                    // 본인이 최고가 응찰자일 경우 버튼과 드롭박스를 숨기고 메시지 표시
                    if (isHighestBidder) {
                        bidingPossible.hide();  // 버튼 숨기기
                        bidingImpossible.show();  // 메시지 보이기
                    } else {
                        bidingImpossible.hide();  // 메시지 숨기기
                        bidingPossible.show();  // 버튼 보이기
                    }
                }


                // 이미지 경로 설정
                let imagePath = `\${auction.attachUploadpath1}/\${auction.attachFilename1}`;
                console.log("이미지 경로: " + imagePath);

                // 경매 모달 이미지 업데이트
                $('#modalBid .auctionImg img').attr('src', '/auctionListDisplay?fileName=' + encodeURIComponent(imagePath));


                // 가져온 경매 데이터를 모달에 반영
                $('#modalBid .left h5').text("LOT " + auction.auction_lot);
                $('#modalBid .left h2').text(auction.auction_author);
                $('#modalBid .left h3').text(auction.auction_title);
                $('#modalBid .left h4.size').text(auction.auction_size + " | " + auction.auction_madeDate);
                $('#modalBid .time h4').text("호가단위 : KRW " + bidIncrement.toLocaleString());
                $('#modalBid .headCount .boxCurrentPrice').text("KRW " + currentPrice.toLocaleString());
                $('#modalBid .headCount .boxHeadCount').text("(응찰 " + auction.bidHistory.length + ")");


                // 남은 시간을 매초 업데이트
                let auctionEndTime = new Date(auction.auction_end_time).getTime();  // 종료 시간 (ISO 형식으로 변환 가능)

                // 즉시 남은 시간을 한 번 계산하여 표시
                $('#modalBid .time h5').text("남은시간 " + calculateRemainingTime(auctionEndTime));
                // $('#auctionDDay').text("남은시간 " + calculateRemainingTime(auctionEndTime));

                // 1초마다 업데이트
                setInterval(function() {
                    let remainingTime = calculateRemainingTime(auctionEndTime);
                    $('#modalBid .time h5').text("남은시간 " + remainingTime);
                }, 1000);  

                
                // 기존 응찰 내역을 업데이트
                let bidHistory = '';
                auction.bidHistory.forEach(function(bid) {
                    const maskedUserName = maskUserName(bid.userName);  // 중간 글자를 *로 마스킹
                    const bidMoney = bid.bidMoney.toLocaleString();
                    bidHistory += `<div class="boxList">
                        <h3>\${maskedUserName}</h3>
                        <h4 style="color: var(--color-burgundy);">\${bidMoney}</h4>
                        <h5>\${formatBidTime(bid.bidTime)}</h5>
                    </div>`;
                });
                $('#modalBid .boxCon').html(bidHistory);

                // 경매 모달을 열기
                // $('#modalBid').show();
            },
            error: function(err) {
                console.log("Error:", err);
            }
        });
    }



    // 경매 남은 시간 계산 함수
    function calculateRemainingTime(endTime) {
        let now = new Date().getTime();  // 현재 시간
        let distance = endTime - now;  // 남은 시간 계산 (밀리초 단위)

        // console.log('@# now=>'+now);
        // console.log('@# distance=>'+distance);

        if (distance < 0) {
            return "경매 종료";  // 경매가 종료되었을 경우
        }

        let days = Math.floor(distance / (1000 * 60 * 60 * 24));
        let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        let seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // 한 자리 숫자일 때 앞에 0을 붙임
        hours = String(hours).padStart(2, '0');
        minutes = String(minutes).padStart(2, '0');
        seconds = String(seconds).padStart(2, '0');

        return `\${days}일 \${hours}:\${minutes}:\${seconds}`;
    }

    
    // 응찰 시간 포맷팅 함수
    function formatBidTime(bidTime) {
        const date = new Date(bidTime);
        const year = String(date.getFullYear()).substring(2);  // 연도의 마지막 두 자리만 표시
        const month = ('0' + (date.getMonth() + 1)).slice(-2); // 월을 두 자리로 표시
        const day = ('0' + date.getDate()).slice(-2);
        const hours = ('0' + date.getHours()).slice(-2);
        const minutes = ('0' + date.getMinutes()).slice(-2);
        const seconds = ('0' + date.getSeconds()).slice(-2);

        return `\${year}.\${month}.\${day} \${hours}:\${minutes}:\${seconds}`;
    }


    // 호가 단위 결정 함수
    function getBidIncrement(currentPrice) {
        if (currentPrice < 300000) {
            return 20000;  // 30만원 미만
        } else if (currentPrice < 1000000) {
            return 50000;  // 30만원 이상 ~ 100만원 미만
        } else if (currentPrice < 3000000) {
            return 100000; // 100만원 이상 ~ 300만원 미만
        } else if (currentPrice < 5000000) {
            return 200000; // 300만원 이상 ~ 500만원 미만
        } else if (currentPrice < 10000000) {
            return 500000; // 500만원 이상 ~ 1000만원 미만
        } else if (currentPrice < 30000000) {
            return 1000000; // 1000만원 이상 ~ 3000만원 미만
        } else if (currentPrice < 50000000) {
            return 2000000; // 3000만원 이상 ~ 5000만원 미만
        } else if (currentPrice < 200000000) {
            return 5000000; // 5000만원 이상 ~ 2억 미만
        } else if (currentPrice < 500000000) {
            return 10000000; // 2억 이상 ~ 5억 미만
        } else {
            return 20000000; // 5억 이상
        }
    }


    // 이름 *로 나오게하는 함수
    function maskUserName(userName) {
        if (userName.length <= 2) {
            // 이름이 2자 이하면 마지막 글자를 *로 대체
            return userName.charAt(0) + '*';
        } else {
            // 이름이 3자 이상일 경우 중간 글자를 *로 대체
            const firstChar = userName.charAt(0);
            const lastChar = userName.charAt(userName.length - 1);
            return firstChar + '*'.repeat(userName.length - 2) + lastChar;
        }
    }

// -----------------------------------------------------------------
// -----------------------------------------------------------------
//                           나성엽 끝
// -----------------------------------------------------------------
// -----------------------------------------------------------------

    // 경매 아이디로 현재가 불러오는 함수
    // function getNowPrice(auctionId) {
    //     var auctionElement = $(".auction[data-auction-id='" + auctionId + "']");
    //     var auctionCostElement = auctionElement.find('.nowPrice');  // 현재가가 표시될 요소 선택
    //     var startPriceElement = auctionElement.find('.startPrice'); // 시작가 요소 선택
    //     var startPrice = startPriceElement.data('price'); // 시작가 값

    //     $.ajax({
    //         url: '/auctionNowPrice',
    //         type: 'GET',
    //         data: { auction_id: auctionId },
    //         success: function (data) {
    //             if (data !== null && data !== 0) {
    //                 auctionCostElement.text(Number(data).toLocaleString());  // 현재가가 있으면 현재가 표시
    //             } else {
    //                 auctionCostElement.text(Number(startPrice).toLocaleString());  // 현재가가 없을 때는 시작가로 표시
    //             }
    //         },
    //         error: function (xhr, status, error) {
    //             console.error('Error fetching auction now price for auction_id ' + auctionId + ':', error);
    //             auctionCostElement.text(Number(startPrice).toLocaleString());  // 오류 발생 시에도 시작가로 표시
    //         }
    //     });
    // }
</script>