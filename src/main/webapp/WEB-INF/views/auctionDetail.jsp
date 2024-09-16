<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@ include file="sidebar.jsp" %>

<div class="mainSection">
    <section>
        <div class="control">
            <a href="javascript:void(0);" id="prevLink"><h5>< 이전</h5></a>
            <h5>마감 3일 5시간 전</h5>
            <a href="javascript:void(0);" id="nextLink"><h5>다음 ></h5></a>
        </div>
        <div class="detailAuction">
            <div class="left">
                <div class="auctionImg">
                    <div class="leftImg">
                        <div class="preview">
                            <div class="uploadResult">
                                <ul>
                                    <img src="images/auction1.jpg">
                                </ul>
                            </div>
                        </div>
                        <div class="preview">
                            <div class="uploadResult">
                                <ul>
                                    <img src="images/auction2.jpg">
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
                                <h5>${auction.auction_startPrice}</h5>
                                <h4>~</h4>
                                <h5>${auction.auction_guessPrice}</h5>
                            </div>
                        </div>
                        <div class="auctionCost start">
                            <h5>시작가</h5>
                            <div class="money">
                                <h4>KRW</h4>
                                <h5>${auction.auction_startPrice}</h5>
                            </div>
                        </div>
                        <div class="auctionCost">
                            <h5 style="color: #111;">현재가</h5>
                            <div class="money">
                                <h4>KRW</h4>
                                <h5>12,500,000</h5>
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
                            <button id="openModalBidBtn">응찰하기</button>
                            <button class="bid" style="display: none;">입찰하기</button>
                            <button class="disable" style="display: none;">경매 종료</button>
                            <button class="disable" style="display: none;">경매 예정</button>
                        </div>
                    </div>
                </div> <!--positionBox 끝-->
            </div> <!--right 끝-->
        </div> <!--detailAuction 끝-->
    </section>

    <!-- 모달 구조 -->
    <div id="modal1" class="modal">
        <div class="modal-content" style="width: 450px; height: 420px;">
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
                        <td>~10,000,000</td>
                        <td>낙찰가의 19.8%</td>
                    </tr>
                    <tr>
                        <td>10,000,001 ~</td>
                        <td>1,000만원의 19.8% +<br>(낙찰가 - 1,000만원) × 16.5%</td>
                    </tr>
                    </tbody>
                </table>
                <div class="notice">
                    <p>예시) 낙찰가 5,000만원일 경우</p>
                    <ul>
                        <li>· 낙찰 수수료 : <br>198만원 + (5,000만원 - 1,000만원) × 16.5%<br>= 8,580,000원</li>
                        <li>· 총 구매대금 : <br>낙찰가 + 낙찰수수료 = 58,580,000원</li>
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
        var currentLot = ${auction.auction_lot};
        var auctionScheduleId = ${auction.auctionSchedule_id};
        var totalLots = ${totalLots}; // 전체 경매 항목 수

        // 이전 및 다음 링크 설정
        var prevLink = document.getElementById("prevLink");
        var nextLink = document.getElementById("nextLink");

        // 이전 링크 클릭 이벤트
        prevLink.onclick = function() {
            if (currentLot > 1) { // 이전 항목이 존재한다고 가정
                window.location.href = "auctionDetail?auction_lot=" + (currentLot - 1) + "&auctionSchedule_id=" + auctionScheduleId;
            } else {
                alert("이전 경매 항목이 없습니다.");
            }
        };

        // 다음 링크 클릭 이벤트
        nextLink.onclick = function() {
            if (currentLot < totalLots) { // 다음 항목이 존재한다고 가정
                window.location.href = "auctionDetail?auction_lot=" + (currentLot + 1) + "&auctionSchedule_id=" + auctionScheduleId;
            } else {
                alert("다음 경매 항목이 없습니다.");
            }
        };

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
</script>
</body>
</html>
