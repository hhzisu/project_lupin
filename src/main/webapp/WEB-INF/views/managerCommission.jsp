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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/managerCommission.css">
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
                    <li><a href="#" style="color: black; font-weight: 700;">위탁 관리</a></li>
                    <li><a href="#">경매 관리</a></li>
                    <li><a href="#">경매 물품 등록</a></li>
                </ul>
            </div>
            <!-- userNav 끝 -->
            <div class="userInfoInfo">
                <div class="userInfoTitle">
                    <h3>위탁 관리</h3>
                </div>
                <hr>
                <div class="userQuestionList">
                    <div class="questionListColunmNames">
                        <h5 class="questionUserId">ID</h5>
                        <h5 class="questionUserEmail">이메일</h5>
                        <h5 class="inquiryTitle">작품명</h5>
                        <h5 class="authorName">작가명</h5>
                        <h5 class="inquiryDate">문의일</h5>
                        <h5 class="questionListBtn"></h5>
                    </div>
                    <div class="questionList">
                        <div class="questionUserId">fgghk132</div>
                        <div class="questionUserEmail">fgghk132@gmail.com</div>
                        <div class="inquiryTitle">바람이 부는 날씨</div>
                        <div class="authorName">나성엽</div>
                        <div class="inquiryDate">24.09.02</div>
                        <i class="fa-solid fa-angle-down questionListBtn"></i>
                    </div>
                    <div class="question_accordion_area">
                        <div class="questionContent">
                            <div class="commission">
                                <div class="commissionCon">
                                    <h5>이메일</h5>
                                    <h4>fgghk132@gmail.com</h4>
                                </div>
                                <div class="commissionCon">
                                    <h5>전화번호</h5>
                                    <h4>010-1111-0616</h4>
                                </div>
                                <div class="commissionCon">
                                    <h5>작품명</h5>
                                    <h4>바람이 부는 날씨</h4>
                                </div>
                                <div class="commissionCon">
                                    <h5>작가명</h5>
                                    <h4>나성엽</h4>
                                </div>
                                <div class="commissionCon">
                                    <h5>작품크기</h5>
                                    <h4>74 x 94 x 10.5 cm</h4>
                                </div>
                                <div class="commissionCon">
                                    <h5>구입가</h5>
                                    <div class="money">
                                        <h4>30,000,000</h4>
                                        <h5>KRW</h5>
                                    </div>
                                </div>
                                <div class="commissionCon">
                                    <h5>소장경위</h5>
                                    <h4>길가다 주움</h4>
                                </div>
                                <div class="commissionCon">
                                    <h5>희망가</h5>
                                    <div class="money">
                                        <h4>35,000,000</h4>
                                        <h5>KRW</h5>
                                    </div>
                                </div>
                                <div class="commissionCon">
                                    <h5>기타</h5>
                                    <h4>-</h4>
                                </div>
                                <div class="commissionCon">
                                    <h5>첨부파일</h5>
                                    <h4 style="color: black;">
                                        <div class="uploadResult">
                                            <ul>
                                                24.10.16_KDT개발_나성엽_입사지원서.hwp (160 kb)
                                            </ul>
                                        </div>
                                    </h4>
                                </div>
                            </div> <!--commission 끝-->
                        </div> <!--questionContent 끝-->
                    </div> <!-- question_accordion_area 끝-->
                    <div class="questionList">
                        <div class="questionUserId">fgghk132</div>
                        <div class="questionUserEmail">fgghk132@gmail.com</div>
                        <div class="inquiryTitle">바람이 부는 날씨</div>
                        <div class="authorName">나성엽</div>
                        <div class="inquiryDate">24.09.02</div>
                        <i class="fa-solid fa-angle-down questionListBtn"></i>
                    </div>
                    <div class="question_accordion_area">
                        <div class="questionContent">
                            <div class="commission">
                                <div class="commissionCon">
                                    <h5>이메일</h5>
                                    <h4>fgghk132@gmail.com</h4>
                                </div>
                                <div class="commissionCon">
                                    <h5>전화번호</h5>
                                    <h4>010-1111-0616</h4>
                                </div>
                                <div class="commissionCon">
                                    <h5>작품명</h5>
                                    <h4>바람이 부는 날씨</h4>
                                </div>
                                <div class="commissionCon">
                                    <h5>작가명</h5>
                                    <h4>나성엽</h4>
                                </div>
                                <div class="commissionCon">
                                    <h5>작품크기</h5>
                                    <h4>74 x 94 x 10.5 cm</h4>
                                </div>
                                <div class="commissionCon">
                                    <h5>구입가</h5>
                                    <div class="money">
                                        <h4>30,000,000</h4>
                                        <h5>KRW</h5>
                                    </div>
                                </div>
                                <div class="commissionCon">
                                    <h5>소장경위</h5>
                                    <h4>길가다 주움</h4>
                                </div>
                                <div class="commissionCon">
                                    <h5>희망가</h5>
                                    <div class="money">
                                        <h4>35,000,000</h4>
                                        <h5>KRW</h5>
                                    </div>
                                </div>
                                <div class="commissionCon">
                                    <h5>기타</h5>
                                    <h4>-</h4>
                                </div>
                                <div class="commissionCon">
                                    <h5>첨부파일</h5>
                                    <h4 style="color: black;">
                                        <div class="uploadResult">
                                            <ul>
                                                24.10.16_KDT개발_나성엽_입사지원서.hwp (160 kb)
                                            </ul>
                                        </div>
                                    </h4>
                                </div>
                            </div> <!--commission 끝-->
                        </div> <!--questionContent 끝-->
                    </div> <!-- question_accordion_area 끝-->
                    <div class="questionList">
                        <div class="questionUserId">fgghk132</div>
                        <div class="questionUserEmail">fgghk132@gmail.com</div>
                        <div class="inquiryTitle">바람이 부는 날씨</div>
                        <div class="authorName">나성엽</div>
                        <div class="inquiryDate">24.09.02</div>
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