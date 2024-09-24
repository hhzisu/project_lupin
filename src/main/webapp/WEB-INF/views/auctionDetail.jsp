<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auctionDetail.css">
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <!-- import js -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="mainSection">
    <section>
            <div class="control finish" style="justify-content: center">
                <h5>종료된 경매</h5>
            </div>
            <div class="control progress">
                <a href="javascript:void(0);" class="prevLink"><h5>< 이전</h5></a>
                <h5 class="finishTime">마감 3일 5시간 전</h5>
                <a href="javascript:void(0);" class="nextLink"><h5>다음 ></h5></a>
            </div>
            <div class="control schedule">
                <a href="javascript:void(0);" class="prevLink"><h5>< 이전</h5></a>
                <h5 class="startTime">경매 시작 3일 5시간 전</h5>
                <a href="javascript:void(0);" class="nextLink"><h5>다음 ></h5></a>
            </div>
        <div class="detailAuction">
            <div class="left">
                <div class="auctionImg">
                    <div class="leftImg">
                        <div class="preview">
                            <div class="uploadAuction uploadAuction1">
                                <ul class="uploadStyle">
                                    <img src="images/auction1.jpg">
                                </ul>
                            </div>
                        </div>
                        <div class="preview">
                            <div class="uploadAuction uploadAuction2">
                                <ul class="uploadStyle">
                                    <img src="images/auction1.jpg">
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="rightImg">
                        <div class="detail">
                            <img src="images/auction1.jpg">
                        </div>
                    </div>
                </div> <!--auctionImg 끝-->
                <div class="detailCon">
                    <h4>작품 정보</h4>
                    <h5>${auction.auction_author}</h5>
                    <h5>${auction.auction_title}</h5>
                    <h5>${auction.auction_materials}</h5>
                    <h5>${auction.auction_size} | ${auction.auction_madeDate}</h5>
                    <h5 class="sign">sign and dated on the reverse</h5>

                    <h4>작가 설명</h4>
                    <textarea name="" id="" readonly>${auction.auction_authorExp}</textarea>
                </div><!--detailCon 끝-->
            </div> <!--left 끝-->
            <div class="right">
                <div class="positionBox">
                    <div class="top">
                        <div class="wish">
                            <h5>LOT ${auction.auction_lot}</h5>
                            <button>WISH</button>
                        </div>
                        <h2>${auction.auction_author}</h2>
                        <h3>${auction.auction_title}</h3>
                        <h4>${auction.auction_materials}</h4>
                        <h4 class="size">${auction.auction_size} | ${auction.auction_madeDate}</h4>
                    </div>
                    <div class="mid">
                        <div class="auctionCost start">
                            <h5>추정가</h5>
                            <div class="money">
                                <h4>KRW</h4>
                                <h5><fmt:formatNumber value="${auction.auction_startPrice}" type="number" groupingUsed="true" /></h5>
                                <h4>~</h4>
                                <h5><fmt:formatNumber value="${auction.auction_guessPrice}" type="number" groupingUsed="true" /></h5>
                            </div>
                        </div>
                        <div class="auctionCost start">
                            <h5>시작가</h5>
                            <div class="money">
                                <h4>KRW</h4>
                                <h5 class="startPrice" data-price="${auction.auction_startPrice}"><fmt:formatNumber value="${auction.auction_startPrice}" type="number" groupingUsed="true" /></h5>
                            </div>
                        </div>
                        <div class="auctionCost progress">
                            <h5 style="color: #111;">현재가</h5>
                            <div class="money">
                                <h4>KRW</h4>
                                <h5 class="nowPrice">12,500,000</h5>
                            </div>
                        </div>
                        <div class="auctionCost finish">
                            <h5 style="color: #111;">낙찰가</h5>
                            <div class="money">
                                <h4>KRW</h4>
                                <h5 class="nowPrice">12,500,000</h5>
                            </div>
                        </div>
                    </div>
                    <div class="bottom">
                        <div class="buttons">
                            <div class="guidebtn">
                                <h5>낙찰 수수료</h5>
                                <h5>+</h5>
                            </div>
                            <div class="guidebtn">
                                <h5>경매 호가표</h5>
                                <h5>+</h5>
                            </div>
                        </div>
                        <div class="auctionButton">
                            <button class="progress" id="openModalBidBtn">응찰하기</button>
<%--                            <button class="bid" style="display: none;">입찰하기</button>--%>
                            <button class="disable finish" style="display: none;">경매 종료</button>
                            <button class="disable schedule" style="display: none;">경매 예정</button>
                        </div>
                    </div>
                </div> <!--positionBox 끝-->
            </div> <!--right 끝-->
        </div> <!--detailAuction 끝-->
    </section>

    <!-- 모달 구조 -->
    <div id="modal1" class="modal">
        <div class="modal-content" style="width: 450px; height: 370px;">
            <span class="close">&times;</span>
            <div class="modal-header">
                <h4>낙찰 수수료 안내</h4>
            </div>
            <div class="modal-body">
                <table>
                    <thead>
                    <tr>
                        <th>낙찰가 (원)</th>
                        <th>수수료율 (VAT 포함)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>일괄</td>
                        <td>낙찰가의 19.8%</td>
                    </tr>
                    </tbody>
                </table>
                <div class="notice">
                    <p>예시) 낙찰가 5,000만원일 경우</p>
                    <ul>
                        <li>· 낙찰 수수료 : <br>5,000만원 × 19.8%<br>= 9,900,000원</li>
                        <li>· 총 구매대금 : <br>낙찰가 + 낙찰수수료 = 59,900,000원</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div id="modal2" class="modal">
        <div class="modal-content" style="width: 580px; height: 530px;">
            <span class="close">&times;</span>
            <div class="modal-header">
                <h4>경매 호가표 안내</h4>
            </div>
            <div class="modal-body modal2-centered">
                <table>
                    <thead>
                    <tr>
                        <th>현재가 구간 (원)</th>
                        <th>호가 단위 (원)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>30만원 미만</td>
                        <td>20,000</td>
                    </tr>
                    <tr>
                        <td>30만원 이상 ~ 100만원 미만</td>
                        <td>50,000</td>
                    </tr>
                    <tr>
                        <td>100만원 이상 ~ 300만원 미만</td>
                        <td>100,000</td>
                    </tr>
                    <tr>
                        <td>300만원 이상 ~ 500만원 미만</td>
                        <td>200,000</td>
                    </tr>
                    <tr>
                        <td>500만원 이상 ~ 1,000만원 미만</td>
                        <td>500,000</td>
                    </tr>
                    <tr>
                        <td>1,000만원 이상 ~ 3,000만원 미만</td>
                        <td>1,000,000</td>
                    </tr>
                    <tr>
                        <td>3,000만원 이상 ~ 5,000만원 미만</td>
                        <td>2,000,000</td>
                    </tr>
                    <tr>
                        <td>5,000만원 이상 ~ 2억 미만</td>
                        <td>5,000,000</td>
                    </tr>
                    <tr>
                        <td>2억 이상 ~ 5억 미만</td>
                        <td>10,000,000</td>
                    </tr>
                    <tr>
                        <td>5억 이상</td>
                        <td>20,000,000</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div><!--모달 끝-->

</div><!--mainSection 끝-->

<%@ include file="footer.jsp" %>

<!-- 추가된 자바스크립트 -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // 현재 auction_lot 및 auctionSchedule_id 값을 자바스크립트로 받아옵니다.
        var currentLot = parseInt("${auction.auction_lot}");
        var auctionScheduleId = "${auction.auctionSchedule_id}";
        var totalLots = parseInt("${totalLots}");

        console.log("currentLot:", currentLot);
        console.log("totalLots:", totalLots);

        // // 이전 및 다음 링크 설정
        // var prevLink = document.getElementById("prevLink");
        // var nextLink = document.getElementById("nextLink");
        //
        // // 이전 링크 클릭 이벤트
        // prevLink.onclick = function() {
        //     if (currentLot > 1) { // 이전 항목이 존재한다고 가정
        //         window.location.href = "auctionDetail?auction_lot=" + (currentLot - 1) + "&auctionSchedule_id=" + auctionScheduleId;
        //     } else {
        //         alert("이전 경매 항목이 없습니다.");
        //     }
        // };
        //
        // // 다음 링크 클릭 이벤트
        // nextLink.onclick = function() {
        //     if (currentLot < totalLots) { // 다음 항목이 존재한다고 가정
        //         window.location.href = "auctionDetail?auction_lot=" + (currentLot + 1) + "&auctionSchedule_id=" + auctionScheduleId;
        //     } else {
        //         alert("다음 경매 항목이 없습니다.");
        //     }
        // };

        // 이전 및 다음 링크 설정
        var prevLinks = document.querySelectorAll(".prevLink");
        var nextLinks = document.querySelectorAll(".nextLink");

        // 이전 링크 클릭 이벤트
        prevLinks.forEach(function(prevLink) {
            prevLink.onclick = function() {
                if (currentLot > 1) { // 이전 항목이 존재한다고 가정
                    window.location.href = "auctionDetail?auction_lot=" + (currentLot - 1) + "&auctionSchedule_id=" + auctionScheduleId;
                } else {
                    alert("이전 경매 항목이 없습니다.");
                }
            };
        });

        // 다음 링크 클릭 이벤트
        nextLinks.forEach(function(nextLink) {
            nextLink.onclick = function() {
                if (currentLot < totalLots) { // 다음 항목이 존재한다고 가정
                    window.location.href = "auctionDetail?auction_lot=" + (currentLot + 1) + "&auctionSchedule_id=" + auctionScheduleId;
                } else {
                    alert("다음 경매 항목이 없습니다.");
                }
            };
        });


        // "낙찰 수수료" 버튼 클릭 시 모달1 표시
        document.querySelector(".guidebtn:first-child").onclick = function() {
            document.getElementById("modal1").style.display = "block";
        }

        // "경매 호가표" 버튼 클릭 시 모달2 표시
        document.querySelector(".guidebtn:last-child").onclick = function() {
            document.getElementById("modal2").style.display = "block";
        }

        // 모든 닫기 버튼 클릭 시 모달 닫기
        var closeButtons = document.getElementsByClassName("close");
        for (var i = 0; i < closeButtons.length; i++) {
            closeButtons[i].onclick = function() {
                this.closest('.modal').style.display = "none";
            }
        }

        // 모달 밖을 클릭하면 닫기
        window.onclick = function(event) {
            if (event.target.className === 'modal') {
                event.target.style.display = "none";
            }
        }
    });

    $(document).ready(function () {

        var auctionEndTime = new Date("${auction.auction_end_time}").getTime(); // auction_end_time 가져오기
        var auctionStartTime = new Date("${auction.auctionSchedule_start}").getTime(); // auctionSchedule_start 가져오기
        var currentTime = new Date().getTime(); // 현재 시간

        if (currentTime >= auctionEndTime) {
            // 경매가 종료되었을 경우
            $('.progress').css('display', 'none'); // 진행중인 내용 숨기기
            $('.finish').css('display', 'flex'); // 종료된 내용 보이기
            $('.schedule').css('display', 'none'); // 예정 내용 숨기기
        }else if(currentTime <= auctionStartTime){
            // 경매 시작 전일 경우
            $('.progress').css('display', 'none'); // 진행중인 내용 숨기기
            $('.finish').css('display', 'none'); // 종료된 내용 보이기
            $('.schedule').css('display', 'flex'); // 예정 내용 숨기기
        }else {
            // 경매가 아직 진행 중일 경우
            $('.progress').css('display', 'flex'); // 진행중인 내용보이기
            $('.finish').css('display', 'none'); // 종료된 내용 숨기기
            $('.schedule').css('display', 'none'); // 예정 내용 숨기기
        }

        // auction_id 값을 가져옴
        var auctionId = "<c:out value='${auction.auction_id}'/>";


        // 남은 시간을 매초 업데이트
        let auctionEndTimer = new Date("${auction.auction_end_time}").getTime();  // 종료 시간 (ISO 형식으로 변환 가능)

        // 즉시 남은 시간을 한 번 계산하여 표시
        $('.finishTime').text("남은시간 " + calculateRemainingTime(auctionEndTimer));

        // 1초마다 업데이트
        setInterval(function() {
            let remainingTime = calculateRemainingTime(auctionEndTimer);
            $('.finishTime').text("남은시간 " + remainingTime);
        }, 1000);

        // 남은 시간을 매초 업데이트
        let auctionStartTimer = new Date("${auction.auctionSchedule_start}").getTime();  // 종료 시간 (ISO 형식으로 변환 가능)

        // 즉시 남은 시간을 한 번 계산하여 표시
        $('.startTime').text("경매 시작 -" + calculateRemainingTime(auctionStartTimer));

        // 1초마다 업데이트
        setInterval(function() {
            let remainingTime = calculateRemainingTime(auctionStartTimer);
            $('.startTime').text("경매 시작 -" + remainingTime);
        }, 1000);// -----------------------------------------------------------------
//                           위시 버튼
// -----------------------------------------------------------------

        let userInfoId;

        // 사용자 정보를 가져오는 AJAX 요청
        $.ajax({
            url: "/api/auction/userInfo",
            method: "GET",
            success: function(data) {
                console.log("API 호출 성공:", data); // API 성공 여부 확인
                if (data) {
                    userInfoId = data;  // 데이터를 전역 변수에 저장
                    console.log("user_id =>", userInfoId.id); // ID 출력

                    // 위시 상태 확인 및 버튼 상태 설정
                    $.ajax({
                        url: '/wish/state',
                        type: 'GET',
                        data: { auction_id: auctionId, user_id: userInfoId.id },
                        success: function(data) {
                            if (data) {
                                // 사용자가 이미 위시를 눌렀다면 active 클래스 추가
                                $('.wish button').addClass('active');
                            } else {
                                $('.wish button').removeClass('active');
                            }
                        },
                        error: function(xhr, status, error) {
                            console.error('Error checking wish state:', error);
                        }
                    });

                } else {
                    console.log("사용자 정보가 없습니다.");
                }
            },
            error: function(err) {
                console.error("API 호출 실패:", err); // API 에러 확인
            }
        });

        // WISH 버튼 클릭 시 이벤트 처리
        $(document).on('click', '.wish button', function() {
            var isWish = $(this).hasClass('active');  // 현재 active 클래스가 있는지 확인
            console.log("버튼 클릭됨, isWish 상태:", isWish); // 클릭 여부 확인

            if (isWish) {
                // 위시 삭제 요청
                $.ajax({
                    url: '/unwish',
                    type: 'POST',
                    data: { auction_id: auctionId, user_id: userInfoId.id },
                    success: function(response) {
                        if (response === 'OK') {
                            $('.wish button').removeClass('active');  // active 클래스 제거
                            // alert('위시 목록에서 제거되었습니다.');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error removing wish:', error);
                    }
                });
            } else {
                // 위시 추가 요청
                $.ajax({
                    url: '/wish',
                    type: 'POST',
                    data: { auction_id: auctionId, user_id: userInfoId.id },
                    success: function(response) {
                        if (response === 'OK') {
                            $('.wish button').addClass('active');  // active 클래스 추가
                            // alert('위시 목록에 추가되었습니다.');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error adding wish:', error);
                    }
                });
            }
        });

// -----------------------------------------------------------------
//                           위시 버튼 끝
// -----------------------------------------------------------------

        // 현재가를 표시할 요소와 시작가 요소를 가져옵니다.
        var auctionCostElement = $(".nowPrice");  // 현재가가 표시될 요소
        var startPriceElement = $(".startPrice"); // 시작가가 표시될 요소
        var startPrice = startPriceElement.data('price'); // 시작가 값

        // 현재가 가져오기
        $.ajax({
            url: '/auctionNowPrice',
            type: 'GET',
            data: { auction_id: auctionId },
            success: function (data) {
                if (data !== null && data !== 0) {
                    auctionCostElement.text(Number(data).toLocaleString());  // 현재가가 있으면 현재가 표시
                } else {
                    auctionCostElement.text(Number(startPrice).toLocaleString());  // 현재가가 없을 때는 시작가로 표시
                }
            },
            error: function (xhr, status, error) {
                console.error('Error fetching auction now price for auction_id ' + auctionId + ':', error);
                auctionCostElement.text(Number(startPrice).toLocaleString());  // 오류 발생 시에도 시작가로 표시
            }
        });

// -----------------------------------------------------------------
//                           이미지 불러오기
// -----------------------------------------------------------------

        // 업로드 컨테이너 및 URL로 이미지 리스트를 표시하는 함수를 정의
        function loadAuctionImages(url, uploadResultContainer) {
            if (auctionId) {
                $.ajax({
                    url: url,
                    type: 'GET',
                    data: { auction_id: auctionId },
                    dataType: 'json',
                    success: function(data) {
                        showUploadResult(data, uploadResultContainer);

                        // uploadAuction1에 이미지를 불러왔을 때 첫 번째 이미지를 detail에 기본으로 설정
                        if (uploadResultContainer.is($('.uploadAuction1 ul')) && data.length > 0) {
                            var firstImageSrc = encodeURIComponent(data[0].uploadPath + "/s_" + data[0].fileName);
                            $('.detail img').attr('src', '/auctionListDisplay?fileName=' + firstImageSrc);
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error fetching file list for auction_id ' + auctionId + ':', error);
                    }
                });
            }
        }

        // 첫 번째 이미지 리스트 불러오기
        var uploadResultContainer1 = $('.uploadAuction1 ul');
        loadAuctionImages('/auctionListGetFileList1', uploadResultContainer1);

        // 두 번째 이미지 리스트 불러오기
        var uploadResultContainer2 = $('.uploadAuction2 ul');
        loadAuctionImages('/auctionListGetFileList2', uploadResultContainer2);

        // 이미지 클릭 시 detail 클래스에 이미지 표시
        $(document).on('click', '.uploadAuction img', function() {
            var imgSrc = $(this).attr('src');  // 클릭한 이미지의 src 속성을 가져옴
            $('.detail img').attr('src', imgSrc);  // detail 클래스의 이미지 src를 업데이트
        });
    });

    // 이미지 목록을 각 컨테이너에 표시
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
            str += "<img src='/auctionListDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>";
            str += "</div></li>";
        });

        // 컨테이너를 비우고 파일 리스트 추가
        uploadResultContainer.empty().append(str);
    }

// -----------------------------------------------------------------
//                           이미지 불러오기 끝
// -----------------------------------------------------------------




</script>
</body>
</html>
