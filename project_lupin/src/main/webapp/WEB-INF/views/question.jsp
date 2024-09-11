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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/question.css">
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

    <div class="questionContainer">
        <div class="questionContent">
            <div class="questionWrap">
                <div class="headBox">
                    <h1 class="head">1:1 문의</h1>
                    <hr class="headLine">
                    <div class="smallgray">Lupin 이용에 있어 궁금한 점을 문의해주세요. 답변은 마이페이지 > 1:1문의 에서 확인하실 수 있습니다.</div>
                </div>
                <div class="questionBoardWrap">
                    <form id="questionForm" method="post" action="questionPost">
                        <hr class="questionBoardLine_bold">
                        <div class="inquiryTypeWrap">
                            <h3>문의종류 <span class="red">*</span></h3>
                            <select name="question_type" id="inquiryType">
                                <option value="회원정보" class="select">회원정보</option>
                                <option value="경매" class="select">경매</option>
                                <option value="위탁" class="select">위탁</option>
                                <option value="결제/배송" class="select">결제/배송</option>
                                <option value="기타" class="select">기타</option>
                            </select>
                        </div>
                        <hr class="questionBoardLine">
                        <div class="questionTitleWrap">
                            <h3>제목 <span class="red">*</span></h3>
                            <textarea name="question_title" id="questionTitle" required></textarea>
                        </div>
                        <hr class="questionBoardLine">
                        <div class="questionContentWrap">
                            <h3>내용 <span class="red">*</span></h3>
                            <textarea name="question_content" id="questionContent" required></textarea>
                        </div>
                        <hr class="questionBoardLine">
                        <div class="questionAttachWrap">
                            <h3>첨부파일</h3>
                            <div class="fileUpload">
                                <!-- <label for="file">
                                    <div class="btn-upload">첨부파일</div>
                                </label> -->
                                <!-- <input type="file" id="file" multiple> -->
                                <input type="file" id="input-file" multiple>
                                <div id="target_file_wrap">
                                    <a onclick="jQuery('#input-file').click()" class="btn btn-primary">첨부파일</a>
                                    <span></span>
                                </div>
                                <div class="attachInfo smallgray">파일은 이미지(JPG, JPEG, PNG, BMP) / 서류(PDF) / 압축파일(ZIP)로 첨부
                                    바랍니다.</div>
                            </div>
                        </div>
                        <hr class="questionBoardLine_bold2">
                        <input type="submit" name="" id="submit_btn" value="작성">
                    </form>
                </div> <!--questionBoardWrap 끝-->
            </div>
        </div>
    </div>
    </div>

    <%@ include file="footer.jsp" %> 

</body>
</html>
<script>
    jQuery(document).ready(function ($) {
    var target_id = "input-file"; 
    $("#" + target_id).bind('change', function () {
        selectFile(this.files, target_id);
    });

    function selectFile(fileObject, target_id) {
        var files = $("#" + target_id)[0].files; // 다중파일 등록
        var fileListHtml = ""; // 파일 목록을 담을 변수

        if (files.length > 0) {
            for (var i = 0; i < files.length; i++) {
                var fileName = files[i].name;
                var fileSize = files[i].size;

                if (fileSize <= 0) {
                    console.log("0kb file return");
                    return;
                }

                var fileSizeKb = fileSize / 1024; 
                var fileSizeMb = fileSizeKb / 1024; 
                var fileSizeStr = "";

                if (fileSizeMb >= 1) {
                    fileSizeStr = fileSizeMb.toFixed(2) + " Mb";
                } else if (fileSizeKb >= 1) {
                    fileSizeStr = parseInt(fileSizeKb) + " kb";
                } else {
                    fileSizeStr = parseInt(fileSize) + " byte";
                }

                // 각 파일에 대해 리스트 아이템 추가
                fileListHtml += fileName + ' (' + fileSizeStr + ')<br>';
            }

            // span 태그에 모든 파일 목록 표시
            $("#target_file_wrap").find('span').html(fileListHtml);
        } else {
            alert("ERROR: No file selected");
        }
    }
});

</script>

