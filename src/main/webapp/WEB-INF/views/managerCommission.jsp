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
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/managerCommission.css">
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

                    <div class="pageFixSize">
                        <div class="userInfo">
                            <div class="userNav">
                                <h3 class="navUserName">관리자</h3>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/managerQuestion">1:1 문의 내역</a></li>
                                    <li><a href="${pageContext.request.contextPath}/managerCommission"
                                            style="color: black; font-weight: 700;">위탁 관리</a></li>
                                    <li><a href="${pageContext.request.contextPath}/managerAuction">경매 관리</a></li>
                                    <li><a href="${pageContext.request.contextPath}/managerAuctionRegist">경매 물품 등록</a>
                                    </li>
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
                                        <h5 class="questionUserEmail">전화번호</h5>
                                        <h5 class="inquiryTitle">작품명</h5>
                                        <h5 class="authorName">작가명</h5>
                                        <h5 class="inquiryDate">문의일</h5>
                                        <h5 class="questionListBtn"></h5>
                                    </div>
                                    <c:forEach var="dto" items="${commissionList}">
                                        <div class="questionCon" data-commission-id="${dto.commission_id}">
                                            <div class="questionList">
                                                <div class="questionUserId">${dto.commission_email}</div>
                                                <div class="questionUserEmail">${dto.commission_phone}</div>
                                                <div class="inquiryTitle">${dto.commission_title}</div>
                                                <div class="authorName">${dto.commission_author}</div>
                                                <div class="inquiryDate">${dto.commission_date}</div>
                                                <i class="fa-solid fa-angle-down questionListBtn"></i>
                                            </div>
                                            <div class="question_accordion_area">
                                                <div class="questionContent">
                                                    <div class="commission">
                                                        <div class="commissionCon">
                                                            <h5>이메일</h5>
                                                            <h4>${dto.commission_email}</h4>
                                                        </div>
                                                        <div class="commissionCon">
                                                            <h5>전화번호</h5>
                                                            <h4>${dto.commission_phone}</h4>
                                                        </div>
                                                        <div class="commissionCon">
                                                            <h5>작품명</h5>
                                                            <h4>${dto.commission_title}</h4>
                                                        </div>
                                                        <div class="commissionCon">
                                                            <h5>작가명</h5>
                                                            <h4>${dto.commission_author}</h4>
                                                        </div>
                                                        <div class="commissionCon">
                                                            <h5>작품크기</h5>
                                                            <h4>${dto.commission_size}</h4>
                                                        </div>
                                                        <div class="commissionCon">
                                                            <h5>구입가</h5>
                                                            <div class="money">
                                                                <h4>${dto.purchasePrice}</h4>
                                                                <h5>KRW</h5>
                                                            </div>
                                                        </div>

                                                        <div class="commissionCon">
                                                            <h5>소장경위</h5>
                                                            <h4>${dto.commission_collection}</h4>
                                                        </div>
                                                        <div class="commissionCon">
                                                            <h5>희망가</h5>
                                                            <div class="money">
                                                                <h4>${dto.wishPrice}</h4>
                                                                <h5>KRW</h5>
                                                            </div>
                                                        </div>
                                                        <div class="commissionCon">
                                                            <h5>기타</h5>
                                                            <h4>${dto.commission_etc}</h4>
                                                        </div>
                                                        <div class="commissionCon">
                                                            <h5>첨부파일</h5>
                                                            <h4 style="color: black;">
                                                                <div class="uploadResult">
                                                                    <ul></ul>
                                                                </div>
                                                            </h4>
                                                        </div>
                                                    </div> <!--commission 끝-->
                                                </div> <!--questionContent 끝-->
                                            </div> <!-- question_accordion_area 끝-->
                                        </div>
                                    </c:forEach>
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
            $(document).ready(function () {
                $('.questionList').click(function () {
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
                    $('.questionCon').each(function () {
                        var commissionID = $(this).data('commission-id'); // 각 질문의 question_id를 가져옴
                        var uploadResultContainer = $(this).find('.uploadResult ul');

                        if (commissionID) {
                            $.ajax({
                                url: '/managerCommissionGetFileList',
                                type: 'GET',
                                data: { commission_id: commissionID },
                                dataType: 'json',
                                success: function (data) {
                                    console.log("Ajax success for commission_id:", commissionID, data);
                                    showUploadResult(data, uploadResultContainer);
                                },
                                error: function (xhr, status, error) {
                                    console.error('Error fetching file list for commission_id ' + commissionID + ':', error);
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