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
                        <input type="hidden" name="user_id" value="${loginUser.id}">
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
                                <!-- <input type="file" id="file" multiple> -->
                                <input type="file" name="uploadFile" id="input-file" multiple>
                                <label for="input-file">
                                    <div id="target_file_wrap">
                                        <a class="btn btn-primary">첨부파일</a>
                                        <span></span>
                                    </div>
                                </label>
                                <div class="uploadResult">
                                    <ul>

                                    </ul>
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
    // 파일 업로드 + input 유효성 검사
    $(document).ready(function (e){
        var formObj = $("form[id='questionForm']");

        $("input[type='submit']").on("click", function(e){
            e.preventDefault();
            console.log("submit clicked");


            /*
                하지수
                유효성 검사
            */
            var requiredFields = [
                {name: "question_title", message: "제목을 입력해주세요."},
                {name: "question_content", message: "내용을 입력해주세요."},
            ];

            // 유효성 반복 + 포커스 이동
            for (var i = 0; i < requiredFields.length; i++) {
                var field = requiredFields[i];

                // 일반 필드와 특별한 기술 스택 필드를 구분
                var fieldValue = $("[name='" + field.name + "']").val().trim();
                if (fieldValue === "") {
                    alert(field.message);
                    $("[name='" + field.name + "']").focus();
                    return;
                }
            } //유효성 검사 끝 --


            var str="";

            $(".uploadResult ul li").each(function (i, obj){
                console.log("@# obj=>"+$(obj));
                console.log("@# obj=>"+$(obj).data());
                console.log("@# obj=>"+$(obj).data("filename"));
                // return;

                var jobj = $(obj);
                // JavaScript개체의 속성에 대한 목록을 표시
                console.dir(jobj);
                console.log("================================");
                console.log(jobj.data("filename"));
                console.log(jobj.data("uuid"));
                console.log(jobj.data("path"));
                console.log(jobj.data("type"));

                str += "<input type='hidden' name='QuestionAttachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
                str += "<input type='hidden' name='QuestionAttachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
                str += "<input type='hidden' name='QuestionAttachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
                str += "<input type='hidden' name='QuestionAttachList["+i+"].image' value='"+jobj.data("type")+"'>";
            });//end of uploadResult ul li

            console.log(str);
            // return;
            // formObj.append(str).submit();
            formObj.append(str);
            formObj[0].submit(); // 폼을 정상적으로 제출
        });//end of button submit

        //확장자(exe, sh, alz), 파일크기(5MB 미만) 조건
        //확장자가 exe|sh|alz 업로드 금지하기 위한 정규식
        var regex = new RegExp("(.*?)\.(exe|sh|alz)$");
        var maxSize = 5242880;//5MB

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

        $("input[type='file']").change(function (e){

            var formData = new FormData();
            var inputFile = $("input[name='uploadFile']");
            //files : 파일정보
            var files = inputFile[0].files;

            for(var i=0; i<files.length; i++){
                console.log("@# files=>"+files[i].name);

                //파일크기와 종류중에서 거짓이면 리턴
                if(!checkExtension(files[i].name, files[i].size)){
                    $("input[type='file']").val(""); // 파일 입력 초기화
                    return false;
                }

                //파일 정보를 formData에 추가
                formData.append("uploadFile",files[i]);
            }

            $.ajax({
                type: "post"
                ,data: formData
                //컨트롤러단 호출
                ,url: "questionUploadAjaxAction"
                //processData : 기본은 key/value 를 Query String 으로 전송하는게 true
                //(파일 업로드는 false)
                ,processData: false
                //contentType : 기본값 : "application / x-www-form-urlencoded; charset = UTF-8"
                //첨부파일은 false : multipart/form-data로 전송됨
                ,contentType: false
                ,success: function(result){
                    alert("파일 업로드 완료");
                    console.log(result);
                    //파일정보들을 함수로 보냄
                    showUploadResult(result);//업로드 결과 처리 함수
                }
            });//end of ajax

            function showUploadResult(uploadResultArr){
                if(!uploadResultArr || uploadResultArr.length == 0){
                    return;
                }

                var uploadUL = $(".uploadResult ul");
                // uploadUL.empty(); // 기존 업로드된 파일 정보 제거
                var str="";

                $(uploadResultArr).each(function (i, obj){
                    //image type
                    if (obj.image) {
                        console.log("@# obj.uploadPath=>"+obj.uploadPath);
                        console.log("@# obj.uuid=>"+obj.uuid);
                        console.log("@# obj.fileName=>"+obj.fileName);

                        // var fileCallPath = obj.uploadPath + obj.uuid + "_" + obj.fileName;
                        // var fileCallPath = encodeURIComponent(obj.uploadPath +"/"+ obj.uuid + "_" + obj.fileName);
                        var fileCallPath = encodeURIComponent(obj.uploadPath +"/s_"+ obj.uuid + "_" + obj.fileName);
                        // str += "<li><div>";

                        str += "<li data-path='" + obj.uploadPath + "'";
                        str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>"
                        str + "<div>";

                        str += "<span>"+obj.fileName+"</span>";
                        str += "<img style='display:none;' src='/questionDisplay?fileName="+fileCallPath+"'>";//이미지 출력 처리(컨트롤러단)
                        str += "</div>";
                        str += "<div class='imgDelete'>";
                        // str += "<span data-file=\'"+ fileCallPath +"\'data-type='image'><i class='fa-regular fa-trash-can'></i></span>";
                        str += "<span style='cursor: pointer;' data-file=\'"+ fileCallPath +"\'data-type='image'>[삭제]</span>";
                        str += "</div></li>";
                    } else {
                        // var fileCallPath = obj.uploadPath + obj.uuid + "_" + obj.fileName;
                        var fileCallPath = encodeURIComponent(obj.uploadPath +"/"+ obj.uuid + "_" + obj.fileName);
                        // str += "<li><div>";

                        str += "<li data-path='" + obj.uploadPath + "'";
                        str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'"
                        str + " ><div>";

                        str += "<span>"+obj.fileName+"</span>";
                        str += "<span data-file=\'"+ fileCallPath +"\'data-type='file'> [삭제] </span>";
                        str += "</div></li>";
                    }
                });//end of each

                //div class 에 파일 목록 추가
                uploadUL.append(str);
            }

            // $(".uploadResult").on("click","span",function(){
            $(".uploadResult").on("click","span[data-file]",function(){
                var targetFile = $(this).data("file");
                var type = $(this).data("type");
                var uploadResultItem = $(this).closest("li");

                console.log("@# targetFile=>"+targetFile);
                console.log("@# type=>"+type);
                console.log("@# uploadResultItem=>"+uploadResultItem);

                //컨트롤러 단에서 업로드된 실제파일 삭제
                $.ajax({
                    type: "post"
                    ,data: {fileName: targetFile, type: type}
                    ,url: "questionDeleteFile"
                    ,success: function(result){
                        alert("삭제 완료");
                        //브라우저에서 해당 썸네일이나 첨부파일이미지 제거
                        uploadResultItem.remove();

                        if($(".uploadResult ul li").length === 0){
                        }
                    }
                });//end of ajax
            });//end of click
        });//end of change
    });//end of ready // 이미지 업로드 끝
</script>
