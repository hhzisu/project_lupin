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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userCommissionStyle.css">
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
                    <h3>위탁 문의</h3>
                </div>
                <hr>
                <form action="insertCommission" method="post">
                    <div class="userCommission">
                        <div class="commissionContent commissionContentTop">
                            <div class="commissionContentTitle">이메일</div>
                            <input class="commissionContentText" type="text" maxlength="26" name="commission_email">
                        </div>
                        <div class="commissionContent">
                            <div class="commissionContentTitle">전화번호</div>
                            <input class="commissionContentText" type="text" maxlength="26" name="commission_phone">
                        </div>
                        <div class="commissionContent">
                            <div class="commissionContentTitle">작품명</div>
                            <input class="commissionContentText" type="text" maxlength="26" name="commission_title">
                        </div>
                        <div class="commissionContent">
                            <div class="commissionContentTitle">작가명</div>
                            <input class="commissionContentText" type="text" maxlength="26" name="commission_author">
                        </div>
                        <div class="commissionContent">
                            <div class="commissionContentTitle">작품크기</div>
                            <input class="commissionContentText" type="text" maxlength="26" name="commission_size">
                        </div>
                        <div class="commissionContent">
                            <div class="commissionContentTitle">구입가</div>
                            <input class="commissionContentText" type="text" maxlength="26" name="purchasePrice">
                            <span class="currencyUnit">KRW</span>
                        </div>
                        <div class="commissionContent">
                            <div class="commissionContentTitle">소장경위</div>
                            <textarea class="commissionContentTextBox1" name="commission_collection"></textarea>
                        </div>
                        <div class="commissionContent">
                            <div class="commissionContentTitle">희망가</div>
                            <input class="commissionContentText" type="text" maxlength="26" name="wishPrice">
                            <span class="currencyUnit">KRW</span>
                        </div>
                        <div class="commissionContent">
                            <div class="commissionContentTitle">기타</div>
                            <textarea class="commissionContentTextBox2" name="commission_etc"></textarea>
                        </div>
                        <div class="commissionContent">
                            <div class="commissionContentTitle">첨부파일</div>
                            <div class="commissionAttach">
                                <button class="commissionAttachBtn">파일첨부</button>
                                <span class="commissionAttachEX">파일은 이미지(JPG, JPEG, PNG, BMP) / 서류(PDF) / 압축파일(ZIP)로 첨부 바랍니다.</span>
                                <span class="commissionAttachEX">위탁문의 시 작품 이미지가 첨부 되어야 정확한 답변이 가능합니다.</span>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="commissionBtns">
                        <button type="reset" class="commissionCancleBtn">취소</button>
                        <button type="submit" class="commissionBtn">위탁 신청</button>
                    </div>
                </form>
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