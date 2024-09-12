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
                            <div class="commissionContentfix">fgghk132@naver.com</div>
                            <input type="hidden" maxlength="26" value="fgghk132@naver.com" name="commission_email">
                        </div>
                        <div class="commissionContent">
                            <div class="commissionContentTitle">전화번호</div>
                            <div class="commissionContentfix">010-1111-2222</div>
                            <input type="hidden" maxlength="26" value="010-1111-2222" name="commission_phone">
                        </div>
                        <div class="commissionContent">
                            <div class="commissionContentTitle requiredInfo">작품명</div>
                            <input class="commissionContentText" type="text" maxlength="26" name="commission_title">
                        </div>
                        <div class="commissionContent">
                            <div class="commissionContentTitle requiredInfo">작가명</div>
                            <input class="commissionContentText" type="text" maxlength="26" name="commission_author">
                        </div>
                        <div class="commissionContent">
                            <div class="commissionContentTitle requiredInfo">작품크기</div>
                            <input class="commissionContentText" type="text" maxlength="26" name="commission_size">
                        </div>
                        <div class="commissionContent">
                            <div class="commissionContentTitle requiredInfo">구입가</div>
                            <input class="commissionContentText" type="text" maxlength="26" name="purchasePrice">
                            <span class="currencyUnit">KRW</span>
                        </div>
                        <div class="commissionContent">
                            <div class="commissionContentTitle requiredInfo">소장경위</div>
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
                            <div class="commissionContentTitle requiredInfo">첨부파일</div>
                            <div class="commissionAttach">
                                <input type="file" name="uploadFile" id="input-file" multiple style="display: none;">
                                <label for="input-file">
                                    <!-- <button class="commissionAttachBtn">파일첨부</button> -->
                                     <input type="button" class="commissionAttachBtn" value="파일첨부">
                                </label>
                                <div class="uploadResult">
                                    <ul>

                                    </ul>
                                </div>
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
    $(document).ready(function (e){

        // 기존의 submit 버튼 클릭 이벤트 바인딩
        $(".commissionBtn").click(function (e) {
            e.preventDefault(); // 기본 폼 제출 동작을 막음


            var isValid = true; // 폼 유효성 체크 여부

            // 유효성 검사: requiredInfo 클래스가 있는 필드들
            $(".requiredInfo").each(function () {
                var inputField = $(this).next("input, textarea"); // 다음에 나오는 input 또는 textarea 요소
                if (inputField.length > 0 && inputField.val().trim() === "") { // 입력값이 비어 있으면
                    var fieldName = $(this).text(); // 필드 이름을 가져옴
                    alert(fieldName + "을(를) 입력해 주세요."); // 경고창 출력
                    isValid = false; // 유효성 체크 실패
                    inputField.focus(); // 비어 있는 필드에 포커스
                    return false; // each 루프 중단
                }
            });

            // 파일 첨부 여부 확인 (필수 첨부 파일의 유효성 검사)
            if (isValid && $(".uploadResult ul li").length === 0) { // 이전 유효성 체크 통과 후 파일 검사
                alert("첨부파일을 하나 이상 추가해 주세요.");
                isValid = false;
            }

            // 유효성 검사를 통과하지 못하면 폼 제출을 중단
            if (!isValid) {
                return false; // 폼 제출 중단
            }

            
            var str = "";

            $(".uploadResult ul li").each(function (i, obj) {
                console.log("@# obj=>" + $(obj));
                console.log("@# obj=>" + $(obj).data());
                console.log("@# obj=>" + $(obj).data("filename"));
                
                var jobj = $(obj);
                console.dir(jobj);
                console.log("================================");
                console.log(jobj.data("filename"));
                console.log(jobj.data("uuid"));
                console.log(jobj.data("path"));
                console.log(jobj.data("type"));

                str += "<input type='hidden' name='QuestionAttachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
                str += "<input type='hidden' name='QuestionAttachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
                str += "<input type='hidden' name='QuestionAttachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
                str += "<input type='hidden' name='QuestionAttachList[" + i + "].image' value='" + jobj.data("type") + "'>";
            });

            console.log(str);
            
            // 폼에 hidden input을 동적으로 추가
            var formObj = $("form");
            formObj.append(str);
            
            // 폼을 제출
            formObj[0].submit();
        });



        // 파일첨부 버튼을 클릭하면 input[type="file"] 요소를 트리거
        $(".commissionAttachBtn").click(function () {
            $("#input-file").click();  // 파일 첨부창이 뜨도록 트리거
        });



        // 파일 업로드 시 파일 목록을 보여주는 부분
        $("input[type='file']").change(function (e){
            var formData = new FormData();
            var inputFile = $("input[name='uploadFile']");
            var files = inputFile[0].files;

            for(var i=0; i<files.length; i++){
                console.log("@# files=>"+files[i].name);

                if(!checkExtension(files[i].name, files[i].size)){
                    $("input[type='file']").val(""); // 파일 입력 초기화
                    return false;
                }

                formData.append("uploadFile",files[i]);
            }

            $.ajax({
                type: "post",
                data: formData,
                url: "commissionUploadAjaxAction", // 서버에서 파일 업로드 처리하는 경로
                processData: false,
                contentType: false,
                success: function(result){
                    alert("파일 업로드 완료");
                    showUploadResult(result);  // 업로드 결과 처리 함수 호출
                }
            });
        });



        // 파일명을 업로드 목록에 추가하고 삭제 버튼을 생성하는 함수
        function showUploadResult(uploadResultArr){
            if(!uploadResultArr || uploadResultArr.length == 0){
                return;
            }

            var uploadUL = $(".uploadResult ul");
            var str = "";

            $(uploadResultArr).each(function (i, obj){
                var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);

                str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
                str += "<span>" + obj.fileName + "</span>";

                if (obj.image) {
                    str += "<img style='display:none;' src='/commissionDisplay?fileName=" + fileCallPath + "'>";
                }

                str += "<span class='deleteFile' data-file='" + fileCallPath + "' data-type='" + (obj.image ? 'image' : 'file') + "' style='cursor:pointer;'> [삭제]</span>";
                str += "</li>";
            });

            uploadUL.append(str);
        }



        // 파일 삭제 처리
        $(".uploadResult").on("click", "span.deleteFile", function(){
            var targetFile = $(this).data("file");
            var type = $(this).data("type");
            var uploadResultItem = $(this).closest("li");

            console.log("파일 삭제 대상: " + targetFile);

            $.ajax({
                type: "post",
                data: { fileName: targetFile, type: type },
                url: "questionDeleteFile", // 서버에서 파일 삭제 처리하는 경로
                success: function(result){
                    alert("파일 삭제 완료");
                    uploadResultItem.remove();  // 브라우저에서 목록 제거
                }
            });
        });


        
        // 확장자 및 파일 크기 확인 함수
        var regex = new RegExp("(.*?)\.(exe|sh|alz)$");
        var maxSize = 5242880; // 5MB

        function checkExtension(fileName, fileSize){
            if(fileSize >= maxSize){
                alert("파일 사이즈 초과");
                return false;
            }
            if(regex.test(fileName)){
                alert("해당 종류의 파일은 업로드할 수 없습니다.");
                return false;
            }
            return true;
        }
    });
</script>