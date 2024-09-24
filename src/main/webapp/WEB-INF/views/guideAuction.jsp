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
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/guideAuction.css">
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

                <div class="commissionContainer">
                    <div class="commissionContent">
                        <div class="headBox">
                            <div class="commission_img">
                                <img src="images/guideAuction.jpg" alt="commission">
                            </div>
                            <div class="commission_text">
                                <p class="text_top">How To Bid</p>
                                <p class="text_bottom">응찰 안내</p>
                            </div>
                            <div class="headText">
                                <p class="smallgray">루팡의 온라인 경매는 폭넓은 작가군과 합리적인 가격의 작품을 선보입니다.
                                </p>
                            </div>
                            <hr class="headLine">
                        </div>
                        <div class="commissionWrap">
                            <div class="board">
                                <div class="title">
                                    <div class="vertical-line"></div>
                                    <div class="title_text">
                                        <p class="title_text_top">step 01</p>
                                        <p class="title_text_bottom">로그인</p>
                                    </div>
                                </div>
                                <div class="content">
                                    <p>· 루팡 미술품 온라인 경매는 별도의 가입비 없이 홈페이지에서 로그인 후 경매 전 인증을 마치면 누구나 참여 가능합니다.
                                    </p>
                                </div>
                            </div>
                            <div class="board">
                                <div class="title">
                                    <div class="vertical-line"></div>
                                    <div class="title_text">
                                        <p class="title_text_top">step 02</p>
                                        <p class="title_text_bottom">응찰 방법</p>
                                    </div>
                                </div>
                                <div class="content">
                                    <p>· 일정 기간 동안 홈페이지를 통해 응찰 가능하며, 경매 마감 시간부터 lot 번호 순차적으로 마감됩니다.</p>
                                    <p>· 경매 마감시간 30초 전에 응찰이 있을 경우, 자동으로 30초 연장 됩니다.</p>
                                    <p>· 온라인 경매 회차에 따라 위 마감 시간이 다를 수 있습니다.</p>
                                    <p>· 동의 절차를 거친 뒤 온라인 응찰을 진행하실 수 있습니다.</p>
                                    <div class="box">
                                        <div class="minibox">
                                            <div class="images">
                                                <img src="images/guideAuction01.png" alt="">
                                            </div>
                                            <div class="box_content">
                                                <p class="num">1회 응찰</p>
                                                <p class="box_content">주어진 금액에 따라 1회씩 수동응찰</p>
                                            </div>
                                        </div>
                                        <div class="minibox">
                                            <div class="images">
                                                <img src="images/guideAuction02.png" alt="">
                                            </div>
                                            <div class="box_content">
                                                <p class="num">자동응찰</p>
                                                <p>작품의 한도액을 미리 설정해 자동으로 응찰</p>
                                                <p>자동응찰의 경우 상대 응찰자가 없으면 최소금액으로 낙찰됩니다.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="board">
                                <div class="title">
                                    <div class="vertical-line"></div>
                                    <div class="title_text">
                                        <p class="title_text_top">step 03</p>
                                        <p class="title_text_bottom">낙찰확인 및 결제</p>
                                    </div>
                                </div>
                                <div class="content">
                                    <br>
                                    <h3>1. 낙찰 및 우선순위</h3><br>
                                    <p>· 경매 낙찰은 시작 후 최고가를 제시한 응찰자에게 경매작품이 낙찰됩니다.</p>
                                    <p>· 동일한 금액의 응찰이 발생할 경우 서버시각에 따라 먼저 응찰금액을 입력하신 분에게 우선 순위가 주어집니다.</p>
                                    <p>· 응찰 시 응찰 단위 기준으로 금액이 상승합니다.</p>
                                    <br>
                                    <h3>2. 낙찰 확인</h3><br>
                                    <p>· 낙찰 시, 홈페이지 로그인 > 마이페이지 > 결제/구매내역에서 낙찰 금액 및 수수료를 확인 하실 수 있습니다.</p>
                                    <p>! 낙찰자는 낙찰을 철회할 수 없습니다. 부득이 철회를 하는 경우에는 낙찰일로부터 7일 이내에 서면으로 철회의사를 통보하고, 위약벌로 낙찰가의
                                        30%에 해당하는 금액을 낙찰일로부터 7일 이내에 납부하여야 합니다.</p>
                                    <br>
                                    <h3>3. 구매 수수료</h3><br>
                                    <p>· 낙찰가에 따른 낙찰수수료는 기본적으로 아래의 방침을 따릅니다. 단, 내부정책에 따라 다른 수수료율이 적용되는 경우가 있습니다.</p>
                                    <p>· 온라인 경매 일괄 : 19.8%</p>
                                    <br>
                                    <h3>4. 결제 안내</h3><br>
                                    <p>· 온라인 경매의 작품은 홈페이지 내에서 카드결제 또는 가상계좌 입금이 가능합니다.</p>
                                    <p>· 낙찰자는 로그인 후, 마이페이지 → 결제/구매내역 에서 낙찰내역 확인과 결제를 진행해 주시기 바랍니다.</p>


                                </div>
                            </div>
                            <div class="board">
                                <div class="title">
                                    <div class="vertical-line"></div>
                                    <div class="title_text">
                                        <p class="title_text_top">step 04</p>
                                        <p class="title_text_bottom">수령 및 배송</p>
                                    </div>
                                </div>
                                <div class="content">
                                    <p>1. 경매의 낙찰작품은 구매자 직접 작품수령을 원칙으로 합니다.</p><br>
                                    <p>2. 작품 직접 수령장소 : 서울시 종로구 평창30길 24 (평창동98번지) 서울옥션하우스 지하1층 수장고에서만 가능합니다.</p><br>
                                    <p>3. 낙찰 작품의 희망 수령 날짜 하루 전까지 '판매 담당자'와 방문일자 예약 필히 하신 후 방문 부탁드립니다.</p>
                                    <p>&nbsp;&nbsp;&nbsp;&nbsp;전일 방문 예약제로 운영하오니, 예약없이 당일 방문시 작품 수령 불가능합니다.</p><br>
                                    <p>4. 작품수령 가능 요일, 시간 : 월요일 ~ 금요일(법정 공휴일 제외) / 당사 업무시간 9시 ~ 18시 (점심시간 12시~13시 제외.)
                                    </p>
                                    <p>&nbsp;&nbsp;&nbsp;&nbsp;낙찰자 승용차에 작품 상차시 참고 : 작품 전체 크기 90 * 118cm까지 가능함(캔버스 50호
                                        크기)</p><br>
                                    <p>5. 낙찰자 직접 작품 수령이 어려울 경우 당사는 낙찰자의 책임과 비용부담 하에 작품의 운송(미술품운송 전문업체)을 주선해드립니다.</p>
                                    <p>&nbsp;&nbsp;&nbsp;&nbsp;작품 파손, 분실의 위험이 크므로 택배업체는 주선 안함</p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%@ include file="footer.jsp" %>

        </body>

        </html>
        <script>

        </script>