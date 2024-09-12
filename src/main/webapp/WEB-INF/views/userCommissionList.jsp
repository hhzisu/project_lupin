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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userCommissionListStyle.css">
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
                    <li><a href="userBuyList">구매 내역</a></li>
                    <li><a href="userCommissionList" style="color: black; font-weight: 700;">위탁 문의 내역</a></li>
                    <li><a href="userQuestionList">1:1 문의 내역</a></li>
                    <li><a href="userWishList">위시 리스트</a></li>
                </ul>
            </div>
            <!-- userNav 끝 -->
            <div class="userInfoInfo">
                <div class="userInfoTitle">
                    <h3>위탁 문의 내역</h3>
                    <button class="commissionBtn" onclick="location='userCommission'">위탁문의</button>
                </div>
                <hr>
                <div class="userCommissionList">
                    <div class="commissionListColunmNames">
                        <!-- <h5 class="inquiryTitle">제목</h5> -->
                        <h5 class="authorName">작가명</h5>
                        <h5 class="workName">작품명</h5>
                        <h5 class="inquiryDate">문의일</h5>
                        <h5 class="deliveryStat">상태</h5>
                    </div>
                    <div class="commissionList">
                        <!-- <div class="inquiryTitle">위탁 문의드립니다.</div> -->
                        <div class="authorName">나성엽</div>
                        <div class="workName">여덟을 꺼내는 시간</div>
                        <div class="inquiryDate">24.08.30</div>
                        <div class="deliveryStat" style="color: gray;">대기중</div>
                    </div>
                    <div class="commissionList">
                        <!-- <div class="inquiryTitle">위탁 문의드립니다.</div> -->
                        <div class="authorName">나성엽</div>
                        <div class="workName">여덟을 꺼내는 시간</div>
                        <div class="inquiryDate">24.08.30</div>
                        <div class="deliveryStat" style="color: #800020;">위탁불가</div>
                    </div>
                    <div class="commissionList">
                        <!-- <div class="inquiryTitle">위탁 문의드립니다.</div> -->
                        <div class="authorName">나성엽</div>
                        <div class="workName">여덟을 꺼내는 시간</div>
                        <div class="inquiryDate">24.08.30</div>
                        <div class="deliveryStat" style="color: #17517E;">위탁가능</div>
                    </div>
                    <div class="commissionList">
                        <!-- <div class="inquiryTitle">위탁 문의드립니다.</div> -->
                        <div class="authorName">나성엽</div>
                        <div class="workName">여덟을 꺼내는 시간</div>
                        <div class="inquiryDate">24.08.30</div>
                        <div class="deliveryStat" style="color: #17517E;">위탁가능</div>
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