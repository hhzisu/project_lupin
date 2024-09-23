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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/auctionResult.css">
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

    <div class="body">
    <div class="section">
        <div class="auctionProgress">
            <!-- <h5>경매 마감 3일 5시간 20분 3초 전</h5> -->
            <div class="tab">
                <h4 class="active">경매 결과</h4>
                <div class="search">
                    <span class="icon">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </span>
                    <input type="text" placeholder="작가, 작품명 검색">
                </div>
            </div> <!--tab 끝-->

            <div class="auctionList">
                <c:forEach items="${list}" var="list">
                    <div class="auction" data-auction-id="${list.auction_id}">
                        <a href="auctionDetail?auction_lot=${list.auction_lot}&auctionSchedule_id=${list.auctionSchedule_id}">
                            <div class="auctionImg">
                                <div class="uploadResult">
                                    <ul class="uploadStyle>
                                        <img src="images/auction1.jpg">
                                    </ul>
                                </div>
                            </div> <!--auctionImg 끝-->
                        </a>
                        <div class="auctionCon">
                            <h5>LOT ${list.auction_lot}</h5>
                            <h2>${list.auction_author}</h2>
                            <h3>${list.auction_title}</h3>
                            <h4>${list.auction_materials}</h4>
                            <h4 class="size">${list.auction_size} | ${list.auction_madeDate}</h4>
                        </div>
                        <div class="auctionCost">
                            <h5>시작가</h5>
                            <div class="money">
                                <h4>KRW</h4>
                                <h5>${list.auction_startPrice}</h5>
                            </div>
                        </div>
                        <div class="auctionCost">
                            <h5 style="color: #111;">낙찰가</h5>
                            <div class="money">
                                <h4>KRW</h4>
                                <h5>12,500,000</h5>
                            </div>
                        </div>
                        <div class="bidButton">
                            <a href="auctionDetail?auction_lot=${list.auction_lot}&auctionSchedule_id=${list.auctionSchedule_id}"><h5>경매 종료</h5></a>
                        </div>
                    </div> <!--auction 끝-->
                </c:forEach>
                
            </div> <!--auctionList 끝-->
        </div><!--auctionProgress 끝-->
    </div><!--section 끝-->
    </div>

    <%@ include file="footer.jsp" %> 

</body>
</html>
<script>
    $(document).ready(function () {

        // auction클래스 반복하면서 데이터 가져옴
        $('.auction').each(function () {
            // auction클래스 data-auction-id 속성에서 값을 가져옴
            var auctionId = $(this).data('auction-id');

            // 현재 auction클래스 .uploadResult 요소를 선택
            var uploadResultContainer = $(this).find('.uploadResult ul');

            if (auctionId) {
                $.ajax({
                    url: '/auctionListGetFileList1',
                    type: 'GET',
                    data: { auction_id: auctionId },
                    dataType: 'json',
                    success: function(data) {
                        showUploadResult(data, uploadResultContainer);
                    },
                    error: function(xhr, status, error) {
                        console.error('Error fetching file list for notice_num ' + noticeNum + ':', error);
                    }
                });
            }
        });
    });

    function showUploadResult(uploadResultArr, uploadResultContainer) {
        if (!uploadResultArr || uploadResultArr.length == 0) {
            return;
        }

        var str = "";
        uploadResultArr.forEach(function (obj) {
            var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.fileName);  // 파일 경로 생성
            str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
            str += "<div>";
            str += "<span style='display:none;'>" + obj.fileName + "</span>";
            str += "<img src='/auctionListDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>";
            str += "</div></li>";
        });

        // 컨테이너를 비우고 파일 리스트 추가
        uploadResultContainer.empty().append(str);
    }
</script>

