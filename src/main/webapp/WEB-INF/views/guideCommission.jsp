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
             <link rel="stylesheet" href="${pageContext.request.contextPath}/css/guideCommission.css"> 
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

                    <div class="commissionContainer">
                        <div class="commissionContent">
                            <div class="headBox">
                                <div class="commission_img">
                                    <img src="${pageContext.request.contextPath}/images/Commission.png" alt="commission">
                                </div>
                                <div class="commission_text">
                                    <p class="text_top">How To Sell</p>
                                    <p class="text_bottom">위탁 안내</p>
                                </div>
                                <div class="headText">
                                    <p class="smallgray">한국 근현대 및 고미술 그리고 해외미술에 이르기까지 파트별 스페셜리스트들은 위탁 및 출품 과정을 고객의 관점에서
                                        성심성의껏 진행하고 있습니다.
                                    </p>
                                    <p class="smallgray">분기별 1회이상 진행하는 메이져경매를 비롯하여 온라인경매, 기획경매 등 다양한 경매를 통해 고객님의 소중한 작품을
                                        모시고자 합니다.</p>
                                    <p class="smallgray">원하시는 작품을 출품하기 위해서는 위탁 신청을 진행해주셔야 합니다.</p>
                                </div>
                                <hr class="headLine">
                            </div>
                            <div class="commissionWrap">
                                <div class="board">
                                    <div class="title">
                                        <div class="vertical-line"></div>
                                        <div class="title_text">
                                            <p class="title_text_top">step 01</p>
                                            <p class="title_text_bottom">신청접수</p>
                                        </div>
                                    </div>
                                    <div class="content">
                                        <p>· Lupin 홈페이지의 서비스 > “위탁 신청” 을 클릭해 주세요.</p>
                                    </div>
                                </div>
                                <div class="board">
                                    <div class="title">
                                        <div class="vertical-line"></div>
                                        <div class="title_text">
                                            <p class="title_text_top">step 02</p>
                                            <p class="title_text_bottom">심의</p>
                                        </div>
                                    </div>
                                    <div class="content">
                                        <p>· 접수된 작품은 각 파트별 스페셜리스트를 통해 서면심의가 진행되며 접수일로부터 7일정도에 보내주신 이메일 또는 1대1문의로 결과를
                                            통보하게 됩니다.</p>
                                    </div>
                                </div>
                                <div class="board">
                                    <div class="title">
                                        <div class="vertical-line"></div>
                                        <div class="title_text">
                                            <p class="title_text_top">step 03</p>
                                            <p class="title_text_bottom">감정 및 계약</p>
                                        </div>
                                    </div>
                                    <div class="content">
                                        <p>· 서면 심의를 마친 작품에 대해 담당자 확인 후 실물을 Lupin 입고 (위탁자 운송하며 운송비는 위탁자가 부담합니다.)</p>
                                        <div class="box">
                                            <div class="minibox">
                                                <div class="radius">
                                                    <div class="radiusIcon">
                                                        <i class="fa-regular fa-comments"></i>
                                                    </div>
                                                </div>
                                                <p class="num">01</p>
                                                <p class="box_content">서면 심의를 마친 작품에 대해</p>
                                                <p class="box_content">담당자와 상의</p>
                                            </div>
                                            <div class="minibox">
                                                <div class="radius">
                                                    <div class="radiusIcon">
                                                        <i class="fa-solid fa-truck-fast"></i>
                                                    </div>
                                                </div>
                                                <p class="num">02</p>
                                                <p class="box_content">실물을 Lupin에 입고</p>
                                            </div>
                                            <div class="minibox">
                                                <div class="radius">
                                                    <div class="radiusIcon">
                                                        <i class="fa-solid fa-magnifying-glass"></i>
                                                    </div>
                                                </div>
                                                <p class="num">03</p>
                                                <p class="box_content">실물 감정절차</p>
                                            </div>
                                            <div class="minibox">
                                                <div class="radius">
                                                    <div class="radiusIcon">
                                                        <i class="fa-regular fa-pen-to-square"></i>
                                                    </div>
                                                </div>
                                                <p class="num">04</p>
                                                <p class="box_content">위탁자와 함께 출품가(내정가)를</p>
                                                <p class="box_content">결정하며 위탁계약서를 작성</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="board">
                                    <div class="title">
                                        <div class="vertical-line"></div>
                                        <div class="title_text">
                                            <p class="title_text_top">step 04</p>
                                            <p class="title_text_bottom">대금 지급</p>
                                        </div>
                                    </div>
                                    <div class="content">
                                        <p>· 서면 경매를 통해 출품작이 낙찰되면 출품 담당자를 통해 위탁자와 낙찰자 동시에 낙찰통보서를 발송하게 됩니다.</p>
                                        <p>· 낙찰자를 통해 낙찰 대금이 완납되면 작품은 낙찰자에게 인도되며 위탁대금을 지급하게 됩니다. 낙찰된 작품에는 소정의 위탁수수료가
                                            부과됩니다. </p>
                                        <div class="box2">
                                            <div class="radius2">
                                                <div class="radiusIcon2">
                                                    <i class="fa-solid fa-sack-dollar"></i>
                                                </div>
                                            </div>
                                            <div class="minibox2">
                                                <div class="minibox2_con_1">
                                                    <p>위탁수수료</p>
                                                </div>
                                                <div class="minibox2_con_2">
                                                    <p>낙찰가의 10%(부가가치세 별도)를 적용합니다.</p>
                                                </div>
                                                <div class="minibox2_con_3">
                                                    <p>(양도세 부과: 2013년도부터 양도가액 6,000만원 이상인 것을 대상으로 하며, 단, 양도일 현재 생존해 있는
                                                        국내 작가의 작품은 제외됩니다.</p>
                                                    <p>자세한 사항은 서울옥션 약관(제 9조)을 참조해주시기 바랍니다.)</p>
                                                </div>
                                            </div>
                                        </div>
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