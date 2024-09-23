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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userBidListStyle.css">
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

    <div class="pageFixSize">
        <div class="userInfo">
            <div class="userNav">
                <h3 class="navUserName">${sessionScope.user.name} 님</h3>
                <ul>
                    <li><a href="userInfo">회원정보관리</a></li>
                    <li><a href="userBidList" style="color: black; font-weight: 700;">응찰 내역</a></li>
                    <li><a href="userBuyList">결제/구매 내역</a></li>
                    <li><a href="userCommissionList">위탁 문의 내역</a></li>
                    <li><a href="userQuestionList">1:1 문의 내역</a></li>
                    <li><a href="userWishList">위시 리스트</a></li>
                </ul>
            </div>
            <!-- userNav 끝 -->
            <div class="userInfoInfo">
                <div class="userInfoTitle">
                    <h3>응찰 내역</h3>
                </div>
                <hr>
                <div class="userBidList">

                    <div class="bidListHeader">
                        <h5 class="auctionDate">24.09.01 온라인 경매</h5>
                        <button class="currentAuctionBtn" onclick="location='auctionProgress'">진행경매보기</button>
                    </div>

                    <div class="bidList">
                        <div class="bidListImg">
                            <div class="uploadResult">
                                <ul>
                                    <img src="images/auction1.jpg">
                                </ul>
                            </div>
                        </div>
                        <div class="bidListExplain">
                            <div class="WishListLotNum">LOT2</div>
                            <div class="authorName">나성엽</div>
                            <div class="workName">여덟을 꺼내는 시간</div>
                        </div>
                        <div class="bidListEnd">
                            <div class="bidListPrices">
                                <div class="bidPrice">
                                    <div>응찰가</div>
                                    <div>KRW &nbsp; 800,000</div>
                                </div>
                                <div class="bidDate">
                                    <div class="bidDateTitle">응찰일</div>
                                    <div>2024.08.28 21:25:31</div>
                                </div>
                                <div class="currentPrice">
                                    <div>현재가</div>
                                    <div>KRW &nbsp; 8,000,000</div>
                                </div>
                            </div>
                            <div>
                                <button class="bidDetailBtn">상세보기</button>
                            </div>
                        </div>
                        <!-- bidListEnd 끝 -->
                    </div>
                    <!-- bidList 끝 -->

                    <div class="bidList">
                        <div class="bidListImg">
                            <div class="uploadResult">
                                <ul>
                                    <img src="images/auction1.jpg">
                                </ul>
                            </div>
                        </div>
                        <div class="bidListExplain">
                            <div class="WishListLotNum">LOT2</div>
                            <div class="authorName">나성엽</div>
                            <div class="workName">여덟을 꺼내는 시간</div>
                        </div>
                        <div class="bidListEnd">
                            <div class="bidListPrices">
                                <div class="bidPrice">
                                    <div class="span1">응찰가</div>
                                    <div>KRW &nbsp; 800,000</div>
                                </div>
                                <div class="bidDate">
                                    <div class="bidDateTitle">응찰일</div>
                                    <div>2024.08.28 21:25:31</div>
                                </div>
                                <div class="endPrice">
                                    <div>낙찰가</div>
                                    <div>KRW &nbsp; 8,000,000</div>
                                </div>
                            </div>
                            <div>
                                <button class="bidDetailBtn">상세보기</button>
                            </div>
                        </div>
                        <!-- bidListEnd 끝 -->
                    </div>
                    <!-- bidList 끝 -->

                </div>
                <!-- userBidList끝 -->
                <hr>

            </div>
            <!-- userInfoInfo 끝 -->
        </div>
        <!-- userInfo 끝 -->
    </div>


    <div id="modalBackground" class="modalBackground"></div>


    <!-- 상세보기 모달 -->
    <div id="bidDetailModal" class="bidDetailModal">
        <span class="closeBtn">&times;</span>
        <div class="modalContent">
            <h2>응찰 상세 정보</h2>
            <hr>
            <div class="bidDetailColunm">
                <div class="bidingPrice">응찰가</div>
                <div class="bidingDate">응찰일자</div>
                <div class="bidingMethod">응찰방법</div>
                <div class="bidingNote">비고</div>
            </div>
            <div class="bidDetailContent">
                <div class="bidingPrice">KRW 10,000,000</div>
                <div class="bidingDate">2024.08.28 21:25:31</div>
                <div class="bidingMethod">1회 응찰</div>
                <div class="bidingNote">낙찰</div>
            </div>
            <div class="bidDetailContent">
                <div class="bidingPrice">KRW 10,000,000</div>
                <div class="bidingDate">2024.08.28 21:25:31</div>
                <div class="bidingMethod">1회 응찰</div>
                <div class="bidingNote"></div>
            </div>
            <div class="bidDetailContent">
                <div class="bidingPrice">KRW 10,000,000</div>
                <div class="bidingDate">2024.08.28 21:25:31</div>
                <div class="bidingMethod">1회 응찰</div>
                <div class="bidingNote"></div>
            </div>
            <div class="bidDetailContent">
                <div class="bidingPrice">KRW 10,000,000</div>
                <div class="bidingDate">2024.08.28 21:25:31</div>
                <div class="bidingMethod">자동 응찰</div>
                <div class="bidingNote"></div>
            </div>
            <hr>
        </div>
    </div>
    <%@ include file="footer.jsp" %> 

</body>
</html>

<script>
    // 모달 가져오기
    var modal = document.getElementById("bidDetailModal");
    // 모달을 여는 버튼들 가져오기
    var btns = document.getElementsByClassName("bidDetailBtn");
    // <span> 요소(닫기 버튼)를 가져오기
    var span = document.getElementsByClassName("closeBtn")[0];
    // 사용자가 버튼을 클릭했을 때 모달 열기
    for (let i = 0; i < btns.length; i++) {
        btns[i].onclick = function() {
            modal.style.display = "block";
            modalBackground.style.display = "block";
        };
    }
    // 사용자가 <span> (x) 을 클릭했을 때 모달 닫기
    span.onclick = function() {
        modal.style.display = "none";
        modalBackground.style.display = "none";
    }
    // 사용자가 모달 외부를 클릭했을 때 모달 닫기
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
            modalBackground.style.display = "none";
        }
    }
</script>
