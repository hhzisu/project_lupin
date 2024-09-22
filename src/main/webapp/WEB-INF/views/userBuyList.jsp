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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userBuyListStyle.css">
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

    <div class="pageFixSize">
        <div class="userInfo">
            <div class="userNav">
                <h3 class="navUserName">나성엽 님</h3>
                <ul>
                    <li><a href="userInfo">회원정보관리</a></li>
                    <li><a href="userBidList">응찰 내역</a></li>
                    <li><a href="userBuyList" style="color: black; font-weight: 700;">결제/구매 내역</a></li>
                    <li><a href="userCommissionList">위탁 문의 내역</a></li>
                    <li><a href="userQuestionList">1:1 문의 내역</a></li>
                    <li><a href="userWishList">위시 리스트</a></li>
                </ul>
            </div>
            <!-- userNav 끝 -->
            <div class="userInfoInfo">
                <div class="userInfoTitle">
                    <h3>구매 내역</h3>
                </div>
                <hr>

                <div class="userBuyList">

                    <div class="buyListHeader">
                        <h5 class="auctionDate">24.09.01 온라인 경매</h5>
                        <button class="currentAuctionBtn" onclick="location='auctionProgress'">진행경매보기</button>
                    </div>

                    <input type="hidden" name="user_id" value="${loginUser.id}">
                    <c:forEach items="${buyList}" var="buyList">
                    <div class="buyListBody">
                        <div class="paystate">결제 대기중</div>
                        <div class="buyList">
                            <div class="buyListImg">
                                <div class="uploadResult">
                                    <ul>
                                        <img src="images/auction1.jpg">
                                    </ul>
                                </div>
                            </div>
                            <div class="buyListExplain">
                                <div class="WishListLotNum">LOT2</div>
                                <div class="authorName">나성엽</div>
                                <div class="workName">여덟을 꺼내는 시간</div>
                            </div>
                            <div class="buyListEnd">
                                <div class="buyListPrices">
<%--                                    <div class="bidPrice">--%>
<%--                                        <div>응찰가</div>--%>
<%--                                        <div>KRW &nbsp; ${buyList.bid_money}</div>--%>
<%--                                    </div>--%>
                                    <div class="bidDate">
                                        <div class="bidDateTitle">응찰일</div>
                                        <div>${buyList.bid_time}</div>
                                    </div>
                                    <div class="endPrice">
                                        <div>낙찰가</div>
                                        <div>KRW &nbsp; ${buyList.bid_money}</div>
                                    </div>
                                    <div class="bidFee">
                                        <div>낙찰 수수료</div>
                                        <div>KRW &nbsp; <span class="bid_fee" data-money="${buyList.bid_money}"></span></div>
                                    </div>
                                </div>
                                <div>
                                    <button class="payBtn">결제하기</button>
                                </div>
                            </div>
                            <!-- bidListEnd 끝 -->
                        </div>
                    </div>
                    </c:forEach>
                    <!-- bidList 끝 -->
                </div>
                <hr>
            </div>
            <!-- userInfoInfo 끝 -->
        </div>
        <!-- userInfo 끝 -->
    </div>

    <%@ include file="footer.jsp" %> 

</body>
</html>
<script>
    $(document).ready(function() {
        // 페이지가 로드된 후 수수료 계산
        $(".bid_fee").each(function() {
            // 콤마를 제거하고 숫자로 변환
            var bidMoneyStr = $(this).data("money").toString();
            var bidMoney = parseInt(bidMoneyStr.replace(/,/g, '')); // 콤마 제거 후 숫자로 변환
            var fee = bidMoney * 0.198;
            $(this).text(fee.toLocaleString());  // 결과를 다시 콤마 포맷으로 표시
        });
    });
</script>
</script>

