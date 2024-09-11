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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userQuestionListStyle.css">
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
                    <li><a href="userCommissionList">위탁 문의 내역</a></li>
                    <li><a href="userQuestionList" style="color: black; font-weight: 700;">1:1 문의 내역</a></li>
                    <li><a href="userWishList">위시 리스트</a></li>
                </ul>
            </div>
            <!-- userNav 끝 -->
            <div class="userInfoInfo">
                <div class="userInfoTitle">
                    <h3>1:1 문의 내역</h3>
                    <button class="questionBtn" onclick="location='question'">문의하기</button>
                </div>
                <hr>
                <div class="userQuestionList">
                    <div class="questionListColunmNames">
                        <h5 class="questionType">문의 종류</h5>
                        <h5 class="inquiryTitle">제목</h5>
                        <h5 class="inquiryDate">문의일</h5>
                        <h5 class="questionStat">상태</h5>
                        <h5 class="questionListBtn"></h5>
                    </div>
                    <div class="questionList">
                        <div class="questionType">회원정보</div>
                        <div class="inquiryTitle">회원정보 문의드립니다.</div>
                        <div class="inquiryDate">24.08.30</div>
                        <div class="questionStat" style="color: gray;">대기중</div>
                        <i class="fa-solid fa-angle-down questionListBtn"></i>
                    </div>
                    <div class="question_accordion_area">
                        <div class="questionContent">
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                        </div>
                        <div class="questionAnswer" style="color: gray;">
                            답변 대기중
                        </div>
                    </div>
                    <div class="questionList">
                        <div class="questionType">경매</div>
                        <div class="inquiryTitle">경매 관련 문의드립니다.</div>
                        <div class="inquiryDate">24.08.30</div>
                        <div class="questionStat" style="color: #17517E;">답변완료</div>
                        <i class="fa-solid fa-angle-down questionListBtn"></i>
                    </div>
                    <div class="question_accordion_area">
                        <div class="questionContent">
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                        </div>
                        <div class="questionAnswer">
                            답변드립니다.답변드립니다.답변드립니다.
                            답변드립니다.답변드립니다.답변드립니다.
                            답변드립니다.답변드립니다.답변드립니다.
                            답변드립니다.답변드립니다.답변드립니다.
                            답변드립니다.답변드립니다.답변드립니다.
                        </div>
                    </div>
                    <div class="questionList">
                        <div class="questionType">위탁</div>
                        <div class="inquiryTitle">위탁 관련 문의드립니다.</div>
                        <div class="inquiryDate">24.08.30</div>
                        <div class="questionStat" style="color: #17517E;">답변완료</div>
                        <i class="fa-solid fa-angle-down questionListBtn"></i>
                    </div>
                    <div class="question_accordion_area">
                        <div class="questionContent">
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                            문의드립니다.문의드립니다.문의드립니다.
                        </div>
                        <div class="questionAnswer">
                            답변드립니다.답변드립니다.답변드립니다.
                            답변드립니다.답변드립니다.답변드립니다.
                            답변드립니다.답변드립니다.답변드립니다.
                            답변드립니다.답변드립니다.답변드립니다.
                            답변드립니다.답변드립니다.답변드립니다.
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
    $(document).ready(function() {
        $('.questionList').click(function() {
            // questionList 부모 요소 다음에 있는 .question_accordion_area를 찾아서 토글합니다.
            $(this).closest('.questionList').next('.question_accordion_area').slideToggle();

            // 버튼 아이콘 변경 (예: 아래 화살표 <-> 위 화살표)
            $(this).find('i').toggleClass('fa-angle-down fa-angle-up');

            // 버튼의 부모 요소에 있는 .questionList의 border-bottom 색상을 토글
            $(this).closest('.questionList').toggleClass('active');
        });
    });
</script>

