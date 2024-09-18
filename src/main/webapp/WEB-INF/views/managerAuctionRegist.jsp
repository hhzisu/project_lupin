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
                <%@ include file="sidebar.jsp" %>

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
                                            <select class="commissionContentText" name="auctionSchedule_id"
                                                id="schedule">
                                                <c:forEach var="dto" items="${scheduleList}">
                                                    <option value="${dto.auctionSchedule_id}">
                                                        ${dto.auctionSchedule_start} 12:00 ~ ${dto.auctionSchedule_end}
                                                        18:00
                                                    </option>
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
                                            <input class="commissionContentText" type="text" name="auction_madeDate"
                                                maxlength="4" required>
                                        </div>
                                        <div class="commissionContent">
                                            <div class="commissionContentTitle">제작재료</div>
                                            <input class="commissionContentText" type="text" name="auction_materials"
                                                maxlength="10" required>
                                        </div>
                                        <div class="commissionContent">
                                            <div class="commissionContentTitle">작가 설명</div>
                                            <textarea class="commissionContentTextBox2" name="auction_authorExp"
                                                required></textarea>
                                        </div>
                                        <div class="commissionContent">
                                            <div class="commissionContentTitle">시작가</div>
                                            <input class="commissionContentText" type="text" name="auction_startPrice"
                                                maxlength="26" required>
                                            <span class="currencyUnit">KRW</span>
                                        </div>
                                        <div class="commissionContent">
                                            <div class="commissionContentTitle">추정가</div>
                                            <input class="commissionContentText" type="text" name="auction_guessPrice"
                                                maxlength="26" required>
                                            <span class="currencyUnit">KRW</span>
                                        </div>

                                        <div class="commissionContent flex">
                                            <div class="commissionAttach flex line">
                                                <div class="commissionContentTitle">작품사진</div>
                                                <input type="file" id="upload1" name="uploadFile" style="display: none;"
                                                    multiple>
                                                <label for="upload1" class="commissionAttachBtn">파일첨부</label>
                                                <div class="fileImg">
                                                    <div class="uploadResult" id="upload1Result">
                                                        <ul></ul>
                                                    </div>
                                                    <div class="uploadResult" id="upload2Result">
                                                        <ul></ul>
                                                    </div>
                                                </div>

                                                <!-- <div class="commissionAttach flex">
                                                    <div class="commissionContentTitle">작품사진 2</div>
                                                    <input type="file" id="upload2" name="uploadFile2"
                                                        style="display: none;">
                                                    <label for="upload2" class="commissionAttachBtn">파일첨부</label>
                                                    <div class="fileImg">
                                                        <div class="uploadResult" id="upload2Result">
                                                            <ul></ul>
                                                        </div>
                                                    </div>
                                                </div> -->

                                            </div>
                                            <div class="commissionBtns">
                                                <button type="button" class="commissionCancleBtn">취소</button>
                                                <button type="submit" class="commissionBtn">경매 등록</button>
                                            </div>
                                            <!-- <input type="hidden" name="auction_id" value="${auctionDTO.auction_id}"> -->
                                        </div>
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

                // 확장자(exe, sh, alz), 파일크기(5MB 미만) 조건
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

                // 파일 업로드 시 이벤트 처리
                $("input[type='file']").change(function (e) {
                    var inputId = $(this).attr('id'); // 어느 input에서 파일이 선택되었는지 확인
                    var uploadResultSelector = (inputId === 'upload1') ? "#upload1Result" : "#upload2Result"; // 어느 결과 영역에 출력할지 결정

                    var formData = new FormData();
                    var inputFile = $(this); // 현재 선택된 input file
                    var files = inputFile[0].files;

                    for (var i = 0; i < files.length; i++) {
                        console.log("@# files=>" + files[i].name);

                        // 파일크기와 종류 확인
                        if (!checkExtension(files[i].name, files[i].size)) {
                            $(this).val(""); // 파일 입력 초기화
                            return false;
                        }

                        // 파일 정보를 formData에 추가
                        formData.append("uploadFile", files[i]);
                    }

                    $.ajax({
                        type: "post",
                        data: formData,
                        url: "auctionUploadAjaxAction",
                        processData: false,
                        contentType: false,
                        success: function (result) {
                            alert("파일 업로드 완료");
                            console.log(result);
                            // 업로드 결과를 해당 영역에 출력
                            showUploadResult(result, uploadResultSelector);
                        }
                    });
                });

                // 파일 업로드 결과를 해당 위치에 출력하는 함수
                function showUploadResult(uploadResultArr, uploadResultSelector) {
                    if (!uploadResultArr || uploadResultArr.length == 0) {
                        return;
                    }

                    var uploadUL = $(uploadResultSelector + " ul"); // 해당 결과 영역
                    var str = "";

                    $(uploadResultArr).each(function (i, obj) {
                        if (obj.image) {
                            var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
                            str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
                            str += "<div>";
                            str += "<span>" + "</span>";
                            str += "<img style='width: 90px; height: 90px;' src='/auctionDisplay?fileName=" + fileCallPath + "'>";
                            str += "</div>";
                            str += "<div class='imgDelete'>";
                            str += "<span style='cursor: pointer;' data-file='" + fileCallPath + "' data-type='image'>[삭제]</span>";
                            str += "</div></li>";
                        } else {
                            var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
                            str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
                            str += "<div>";
                            str += "<span>" + obj.fileName + "</span>";
                            str += "<span data-file='" + fileCallPath + "' data-type='file'> [삭제] </span>";
                            str += "</div></li>";
                        }
                    });

                    uploadUL.append(str); // 파일 정보를 해당 결과 리스트에 추가
                }

                // 파일 삭제 처리
                $(".uploadResult").on("click", "span[data-file]", function () {
                    var targetFile = $(this).data("file");
                    var type = $(this).data("type");
                    var uploadResultItem = $(this).closest("li");

                    $.ajax({
                        type: "post",
                        data: { fileName: targetFile, type: type },
                        url: "auctionDeleteFile",
                        success: function (result) {
                            alert("삭제 완료");
                            uploadResultItem.remove();
                        }
                    });
                });
            });
        </script>