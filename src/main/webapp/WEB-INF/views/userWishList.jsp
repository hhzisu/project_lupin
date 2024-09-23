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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userWishListStyle.css">
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
                    <li><a href="userBidList">응찰 내역</a></li>
                    <li><a href="userBuyList">결제/구매 내역</a></li>
                    <li><a href="userCommissionList">위탁 문의 내역</a></li>
                    <li><a href="userQuestionList">1:1 문의 내역</a></li>
                    <li><a href="userWishList" style="color: black; font-weight: 700;">위시 리스트</a></li>
                </ul>
            </div>
            <!-- userNav 끝 -->
            <div class="userInfoInfo">
                <div class="userInfoTitle">
                    <h3>위시 리스트</h3>
                </div>
                <hr>
                <div class="userWishList">
                    <div class="wishListHeader">
                        <h5 class="auctionDate">24.09.01 온라인 경매</h5>
                        <button class="currentAuctionBtn">진행경매보기</button>
                    </div>
                    <div class="wishList">
                        <div class="wishListImg">
                            <div class="uploadResult">
                                <ul>
                                    <img src="images/auction1.jpg">
                                </ul>
                            </div>
                        </div>
                        <div class="wishListExplain">
                            <div class="WishListLotNum">LOT2</div>
                            <div class="authorName">나성엽</div>
                            <div class="workName">여덟을 꺼내는 시간</div>
                        </div>
                        <div class="wishListEnd">
                            <div>
                                <button>WISH</button>
                            </div>
                            <div class="wishListPrices">
                                <div class="startPrice">
                                    <div>
                                        <span class="span1">시작가</span>
                                        <span class="span2">KRW</span>
                                    </div>
                                    <div>800,000</div>
                                </div>
                                <div class="currentPrice">
                                    <div>
                                        <span class="span1">현재가</span>
                                        <span class="span2">KRW</span>
                                    </div>
                                    <div>8,000,000</div>
                                </div>
                            </div>
                        </div>
                    </div>
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
</script>
