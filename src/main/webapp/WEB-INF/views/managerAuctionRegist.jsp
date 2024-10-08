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
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/managerAuctionRegist.css">
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

                <div class="pageFixSize">
                    <div class="userInfo">
                        <div class="userNav">
                            <h3 class="navUserName">관리자</h3>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/managerQuestion">1:1 문의 내역</a></li>
                                <li><a href="${pageContext.request.contextPath}/managerCommission">위탁 관리</a></li>
                                <li><a href="${pageContext.request.contextPath}/managerAuction">경매 관리</a></li>
                                <li><a href="${pageContext.request.contextPath}/managerAuctionRegist"
                                        style="color: black; font-weight: 700;">경매 물품
                                        등록</a></li>
                            </ul>
                        </div>
                        <!-- userNav 끝 -->
                        <div class="userInfoInfo">
                            <div class="userInfoTitle">
                                <h3>경매 물품 등록</h3>
                            </div>
                            <hr>
                            <div class="userCommission">
                                <form action="insertAuction" method="post" enctype="multipart/form-data">
                                    <div class="commissionContent commissionContentTop">
                                        <div class="commissionContentTitle">경매일자</div>
                                        <select class="commissionContentText" name="auctionSchedule_id" id="schedule">
                                            <c:forEach var="dto" items="${scheduleList}">
                                                <c:if test="${dto.auctionSchedule_start > now}">
                                                    <option value="${dto.auctionSchedule_id}">
                                                            ${dto.auctionSchedule_start} ~ ${dto.auctionSchedule_end}
                                                    </option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="commissionContent">
                                        <div class="commissionContentTitle">작가명</div>
                                        <input class="commissionContentText" type="text" name="auction_author"
                                            maxlength="26" required>
                                    </div>
                                    <div class="commissionContent">
                                        <div class="commissionContentTitle">작품명</div>
                                        <input class="commissionContentText" type="text" name="auction_title"
                                            maxlength="26" required>
                                    </div>
                                    <div class="commissionContent">
                                        <div class="commissionContentTitle">작품크기</div>
                                        <input class="commissionContentText" type="text" name="auction_size"
                                            maxlength="26" required>
                                    </div>
                                    <div class="commissionContent">
                                        <div class="commissionContentTitle">제작년도</div>
                                        <input class="commissionContentText" type="number" name="auction_madeDate"
                                            maxlength="4" min="1901" required>
                                    </div>
                                    <div class="commissionContent">
                                        <div class="commissionContentTitle">제작재료</div>
                                        <input class="commissionContentText" type="text" name="auction_materials" required>
                                    </div>
                                    <div class="commissionContent">
                                        <div class="commissionContentTitle">작가 설명</div>
                                        <textarea class="commissionContentTextBox2" name="auction_authorExp"
                                            required></textarea>
                                    </div>
                                    <div class="commissionContent">
                                        <div class="commissionContentTitle">시작가</div>
                                        <input class="commissionContentText" type="number" name="auction_startPrice"
                                            maxlength="26" max="2147483647" required>
                                        <span class="currencyUnit">KRW</span>
                                    </div>
                                    <div class="commissionContent">
                                        <div class="commissionContentTitle">추정가</div>
                                        <input class="commissionContentText" type="number" name="auction_guessPrice"
                                            maxlength="26" max="2147483647" required>
                                        <span class="currencyUnit">KRW</span>
                                    </div>

                                    <div class="commissionContent flex">
                                        <div class="commissionAttach flex line">
                                            <div class="commissionContentTitle">작품사진 1</div>
                                            <input type="file" id="upload1" name="uploadFile1" style="display: none;">
                                            <label for="upload1" class="commissionAttachBtn">파일첨부</label>
                                            <div class="fileImg">
                                                <div class="uploadResult" id="upload1Result">
                                                    <ul></ul>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="commissionAttach flex">
                                            <div class="commissionContentTitle">작품사진 2</div>
                                            <input type="file" id="upload2" name="uploadFile2" style="display: none;">
                                            <label for="upload2" class="commissionAttachBtn">파일첨부</label>
                                            <div class="fileImg">
                                                <div class="uploadResult" id="upload2Result">
                                                    <ul></ul>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <hr>
                                    <div class="commissionBtns">
                                        <button type="button" class="commissionCancleBtn">취소</button>
                                        <button type="submit" class="commissionBtn">경매 등록</button>
                                    </div>
                                    <!-- <input type="hidden" name="auction_id" value="${auctionDTO.auction_id}"> -->
                                </form>
                            </div>
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
            $(document).ready(function (e) {

                // 확장자 검사 및 파일 크기(5MB 미만) 검사
                var regex = new RegExp("(.*?)\.(exe|sh|alz)$");
                var maxSize = 5242880; // 5MB

                function checkExtension(fileName, fileSize) {
                    if (fileSize >= maxSize) {
                        alert("파일 사이즈 초과");
                        return false;
                    }
                    if (regex.test(fileName)) {
                        alert("해당 종류의 파일은 업로드할 수 없습니다.");
                        return false;
                    }
                    return true;
                }

                // 파일 선택 시 처리 (upload1 처리)
                $("#upload1").change(function (e) {
                    var formData = new FormData();
                    var inputFile = $("#upload1")[0].files;

                    for (var i = 0; i < inputFile.length; i++) {
                        if (!checkExtension(inputFile[i].name, inputFile[i].size)) {
                            $("#upload1").val(""); // 파일 입력 초기화
                            return false;
                        }
                        formData.append("uploadFile1", inputFile[i]); // 수정된 부분
                    }

                    // 파일을 서버로 전송 (upload1)
                    $.ajax({
                        type: "post",
                        data: formData,
                        url: "auctionUploadAjaxAction1", // 수정된 부분
                        processData: false,
                        contentType: false,
                        success: function (result) {
                            alert("파일 업로드 완료 (작품사진 1)");
                            showUploadResult(result, '#upload1Result'); // 업로드 결과 표시 (upload1)
                        }
                    });
                });

                // 파일 선택 시 처리 (upload2 처리)
                $("#upload2").change(function (e) {
                    var formData = new FormData();
                    var inputFile = $("#upload2")[0].files;

                    for (var i = 0; i < inputFile.length; i++) {
                        if (!checkExtension(inputFile[i].name, inputFile[i].size)) {
                            $("#upload2").val(""); // 파일 입력 초기화
                            return false;
                        }
                        formData.append("uploadFile2", inputFile[i]); // 수정된 부분
                    }

                    // 파일을 서버로 전송 (upload2)
                    $.ajax({
                        type: "post",
                        data: formData,
                        url: "auctionUploadAjaxAction2", // 수정된 부분
                        processData: false,
                        contentType: false,
                        success: function (result) {
                            alert("파일 업로드 완료 (작품사진 2)");
                            showUploadResult(result, '#upload2Result'); // 업로드 결과 표시 (upload2)
                        }
                    });
                });

                function showUploadResult(uploadResultArr, uploadResultContainer) {
                    if (!uploadResultArr || uploadResultArr.length === 0) {
                        return;
                    }

                    var str = "";
                    uploadResultArr.forEach(function (obj) {
                        var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.fileName);  // 썸네일 이미지 경로 생성
                        console.log("fileCallPath: ", fileCallPath);  // 경로 확인용 로그 추가

                        str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
                        str += "<div>";
                        str += "<span style='display:none;'>" + obj.fileName + "</span>";
                        str += "<img src='/auctionListAdminDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "' style='width: 90px; height: 90px;'>";  // 이미지 태그에 크기 추가
                        str += "</div></li>";
                    });

                    // 기존 결과를 비우고 새로운 결과를 추가
                    $(uploadResultContainer).empty().append(str);
                }



                // 파일 삭제 처리
                $(".uploadResult").on("click", "span[data-file]", function () {
                    var targetFile = $(this).data("file");
                    var type = $(this).data("type");
                    var uploadResultItem = $(this).closest("li");

                    $.ajax({
                        type: "post",
                        data: { fileName: targetFile, type: type },
                        url: "auctionDeleteFile", // 수정된 부분
                        success: function (result) {
                            alert("삭제 완료");
                            uploadResultItem.remove(); // 브라우저에서 파일 목록 제거
                        }
                    });
                });
            });
        </script>

        <script>
            // 경매 등록 처리
            $(".commissionBtn").on("click", function (e) {
                e.preventDefault();  // 기본 폼 제출 동작 막기

                var form = $("form")[0]; // 첫 번째 form 선택
                var formData = new FormData(form);

                $.ajax({
                    type: "post",
                    url: "insertAuction",  // insertAuction 경로로 전송
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        alert("경매 등록이 완료되었습니다.");
                        window.location.href = "/managerAuction";  // 성공 시 경매 관리 페이지로 이동
                    },
                    error: function () {
                        alert("등록을 실패하였습니다.");  // 실패 시 경고창
                    }
                });
            });
        </script>