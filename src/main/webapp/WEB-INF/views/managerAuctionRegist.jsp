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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/managerAuctionRegist.css">
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
                <h3 class="navUserName">관리자</h3>
                <ul>
                    <li><a href="#">1:1 문의 내역</a></li>
                    <li><a href="#">위탁 관리</a></li>
                    <li><a href="managerAuction">경매 관리</a></li>
                    <li><a href="managerAuctionRegist" style="color: black; font-weight: 700;">경매 물품 등록</a></li>
                </ul>
            </div>
            <!-- userNav 끝 -->
            <div class="userInfoInfo">
                <div class="userInfoTitle">
                    <h3>경매 물품 등록</h3>
                </div>
                <hr>
                <div class="userCommission">
                    <div class="commissionContent commissionContentTop">
                        <div class="commissionContentTitle">경매일자</div>
                        <select class="commissionContentText" name="" id="">
                            <option value="">2024.09.04 12:00 ~ 2024.09.10 18:00</option>
                            <option value="">2024.09.11 12:00 ~ 2024.09.17 18:00</option>
                            <option value="">2024.09.18 12:00 ~ 2024.09.21 18:00</option>
                            <option value="">2024.09.22 12:00 ~ 2024.09.29 18:00</option>
                        </select>
                    </div>
                    <div class="commissionContent">
                        <div class="commissionContentTitle">작가명</div>
                        <input class="commissionContentText" type="text" maxlength="26">
                    </div>
                    <div class="commissionContent">
                        <div class="commissionContentTitle">작품명</div>
                        <input class="commissionContentText" type="text" maxlength="26">
                    </div>
                    <div class="commissionContent">
                        <div class="commissionContentTitle">작품크기</div>
                        <input class="commissionContentText" type="text" maxlength="26">
                    </div>
                    <div class="commissionContent">
                        <div class="commissionContentTitle">제작년도</div>
                        <input class="commissionContentText" type="text" maxlength="4">
                    </div>
                    <div class="commissionContent">
                        <div class="commissionContentTitle">제작재료</div>
                        <input class="commissionContentText" type="text" maxlength="4">
                    </div>
                    <div class="commissionContent">
                        <div class="commissionContentTitle">작가 설명</div>
                        <textarea class="commissionContentTextBox2"></textarea>
                    </div>
                    <div class="commissionContent">
                        <div class="commissionContentTitle">시작가</div>
                        <input class="commissionContentText" type="text" maxlength="26">
                        <span class="currencyUnit">KRW</span>
                    </div>
                    <div class="commissionContent">
                        <div class="commissionContentTitle">추정가</div>
                        <input class="commissionContentText" type="text" maxlength="26">
                        <span class="currencyUnit">KRW</span>
                    </div>
                    
                    <div class="commissionContent flex">
                        <div class="commissionAttach flex line">
                            <div class="commissionContentTitle">작품사진 1</div>
                            <input type="file" id="upload1" style="display: none;">
                            <label for="upload1" class="commissionAttachBtn">
                                파일첨부
                            </label>
                            <div class="fileImg">
                                <div class="uploadResult">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        <div class="commissionAttach flex">
                            <div class="commissionContentTitle">작품사진 2</div>
                            <input type="file" id="upload2" style="display: none;">
                            <label for="upload2" class="commissionAttachBtn">
                                파일첨부
                            </label>
                            <div class="fileImg">
                                <div class="uploadResult">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="commissionBtns">
                    <button class="commissionCancleBtn">취소</button>
                    <button class="commissionBtn">경매 등록</button>
                </div>
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

