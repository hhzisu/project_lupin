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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/managerQuestion.css">
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
                    <li><a href="#" style="color: black; font-weight: 700;">1:1 문의 내역</a></li>
                    <li><a href="#">위탁 관리</a></li>
                    <li><a href="#">경매 관리</a></li>
                    <li><a href="#">경매 물품 등록</a></li>
                </ul>
            </div>
            <!-- userNav 끝 -->
            <div class="userInfoInfo">
                <div class="userInfoTitle">
                    <h3>1:1 문의 내역</h3>
                </div>
                <hr>
                <div class="userQuestionList">
                    <div class="questionListColunmNames">
                        <h5 class="questionType">문의 종류</h5>
                        <h5 class="questionUserId">이메일</h5>
                        <h5 class="inquiryTitle">제목</h5>
                        <h5 class="inquiryDate">문의일</h5>
                        <h5 class="questionStat">상태</h5>
                        <h5 class="questionListBtn"></h5>
                    </div>
                    <c:forEach items="${questionList}" var="question">
                        <div class="questionCon" data-question-id="${question.question_id}">
                            <div class="questionList">
                                <div class="questionType">${question.question_type}</div>
                                <div class="questionUserId">${question.email}</div>
                                <div class="inquiryTitle">${question.question_title}</div>
                                <div class="inquiryDate">${question.question_date}</div>
                                <div class="questionStat" style="color: gray;">${question.question_answer == null ? '대기중' : '답변완료'}</div>
                                <i class="fa-solid fa-angle-down questionListBtn"></i>
                            </div>
                            <div class="question_accordion_area">
                                <div class="questionContent">
                                    ${question.question_content}
                                    <div class="uploadResult" style="padding: 24px 0 0 0;">
                                        <ul></ul>
                                    </div>
                                </div>
                                <div class="questionAnswer answerText" style="color: gray;">
                                    <form method="post" action="questionAnswer">
                                        <input type="hidden" name="question_id" value="${question.question_id}" />

                                        <c:choose>
                                            <c:when test="${empty question.question_answer}">
                                                <textarea name="question_answer"></textarea>
                                                <button type="submit">답변</button>
                                            </c:when>
                                            <c:otherwise>
                                                ${question.question_answer}
                                            </c:otherwise>
                                        </c:choose>
                                    </form>
                                </div>
                            </div>
                        </div> <!-- questionCon 끝 -->
                    </c:forEach>
                </div> <!-- userQuestionList 끝 -->
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

        // 파일 리스트를 불러오는 함수
        function loadFileList() {
            // 각 질문 컨테이너에 대해 파일 목록을 불러오기
            $('.questionCon').each(function() {
                var questionID = $(this).data('question-id'); // 각 질문의 question_id를 가져옴
                var uploadResultContainer = $(this).find('.uploadResult ul');

                if (questionID) {
                    $.ajax({
                        url: '/questionGetFileList',
                        type: 'GET',
                        data: { question_id: questionID },
                        dataType: 'json',
                        success: function(data) {
                            console.log("Ajax success for question_id:", questionID, data);
                            showUploadResult(data, uploadResultContainer);
                        },
                        error: function(xhr, status, error) {
                            console.error('Error fetching file list for question_id ' + questionID + ':', error);
                        }
                    });
                }
            });
        }

        // 파일 리스트를 표시하는 함수
        function showUploadResult(uploadResultArr, uploadResultContainer) {
            if (!uploadResultArr || uploadResultArr.length === 0) {
                return;
            }

            var str = "";

            $(uploadResultArr).each(function (i, obj) {
                console.log(obj);
                var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

                str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
                str += "<div>";
                str += "<span style='color: black; cursor: pointer'>" + obj.fileName + "</span>";
                str += "<img style='display: none' src='/questionDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>";
                str += "</div></li>";
            });

            uploadResultContainer.append(str);
        }

        // 페이지 로드 시 파일 리스트를 불러오기
        loadFileList();

    });
</script>

