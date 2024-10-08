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
                <a href="auctionResult"><h4 class="active">경매 결과</h4></a>
                <div class="search">
                    <span class="icon">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </span>
                    <input type="text" id="searchQuery" onkeyup="searchAuction()" placeholder="작가, 작품명 검색">
                </div>
            </div> <!--tab 끝-->

            <div class="auctionList" id="auctionList">
                <c:forEach items="${list}" var="list">
                    <div class="auction" data-auction-id="${list.auction_id}">
                        <a href="auctionDetail?auction_lot=${list.auction_lot}&auctionSchedule_id=${list.auctionSchedule_id}">
                            <div class="auctionImg">
                                <div class="uploadResult">
                                    <ul class="uploadStyle">
<%--                                        <img src="images/auction1.jpg">--%>
                                    </ul>
                                </div>
                            </div> <!--auctionImg 끝-->
                        </a>
                        <div class="auctionCon">
<%--                            <h5>LOT ${list.auction_lot}</h5>--%>
                            <h5>${list.auction_id}</h5>
                            <h2>${list.auction_author}</h2>
                            <h3>${list.auction_title}</h3>
                            <h4>${list.auction_materials}</h4>
                            <h4 class="size">${list.auction_size} | ${list.auction_madeDate}</h4>
                        </div>
                        <div class="auctionCost">
                            <h5>시작가</h5>
                            <div class="money">
                                <h4>KRW</h4>
                                <h5 class="startPrice" data-price="${list.auction_startPrice}">${list.auction_startPrice}</h5>
                            </div>
                        </div>
                        <div class="auctionCost">
                            <h5 style="color: #111;">낙찰가</h5>
                            <div class="money">
                                <h4>KRW</h4>
                                <h5 class="nowPrice"></h5>
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

        formatAuctionPrices();

        // auction클래스 반복하면서 데이터 가져옴
        $('.auction').each(function () {
            // auction클래스 data-auction-id 속성에서 값을 가져옴
            var auctionId = $(this).data('auction-id');
            var auctionElement = $(".auction[data-auction-id='" + auctionId + "']");
            var auctionCostElement = auctionElement.find('.nowPrice');  // 현재가가 표시될 요소 선택
            var startPriceElement = auctionElement.find('.startPrice'); // 시작가 요소 선택
            var startPrice = startPriceElement.data('price'); // 시작가 값

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
            if (auctionId) {
                $.ajax({
                    url: '/auctionNowPrice',
                    type: 'GET',
                    data: { auction_id: auctionId },
                    success: function (data) {
                        if (data !== null && data !== 0) {
                            auctionCostElement.text(Number(data).toLocaleString());  // 현재가가 있으면 현재가 표시
                        } else {
                            auctionCostElement.text("-");  // 현재가가 없을 때는 - 표시
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error('Error fetching auction now price for auction_id ' + auctionId + ':', error);
                        auctionCostElement.text(Number(startPrice).toLocaleString());  // 오류 발생 시에도 시작가로 표시
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

    // 숫자에 천 단위로 콤마를 추가하는 함수
    function formatAuctionPrices() {
        $('.auction').each(function () {
            // 시작가에 대한 처리
            var startPriceElement = $(this).find('.startPrice');
            var startPrice = startPriceElement.data('price');

            if (startPrice) {
                startPriceElement.text(Number(startPrice).toLocaleString()); // 시작가에 콤마 적용
            }

            // 현재가에 대한 처리
            var nowPriceElement = $(this).find('.nowPrice');
            var nowPrice = nowPriceElement.data('price');  // 만약 현재가가 있을 경우 처리

            if (nowPrice) {
                nowPriceElement.text(Number(nowPrice).toLocaleString()); // 현재가에 콤마 적용
            }
        });
    }

    // 검색어가 입력될 때마다 실행되는 함수
    function searchAuction() {
        var query = $("#searchQuery").val(); // 검색창에서 검색어를 가져옴

        if (query.length > 0) { // 검색어가 있으면 AJAX 요청
            $.ajax({
                url: '/api/auctionResultSearch', // 검색 API 호출
                type: 'GET',
                data: { query: query },
                dataType: 'json',
                success: function (data) {
                    updateAuctionList(data); // 결과를 업데이트하는 함수 호출
                },
                error: function (xhr, status, error) {
                    console.error('Error fetching auction list:', error);
                }
            });
        } else {
            // 검색어가 없을 때 전체 경매 목록 불러오기
            $.ajax({
                url: '/auctionResult', // 전체 경매 목록을 반환하는 컨트롤러 호출
                type: 'GET',
                dataType: 'html', // 전체 HTML을 다시 렌더링
                success: function (response) {
                    var newContent = $(response).find("#auctionList").html(); // 새로운 경매 리스트를 추출
                    $("#auctionList").html(newContent); // 기존 내용을 교체

                    // 전체 목록에 대한 이미지 로딩 로직 호출
                    $("#auctionList .auction").each(function () {
                        var auctionId = $(this).data("auction-id");
                        loadAuctionImage(auctionId); // 각 경매 항목에 대해 이미지 로드 함수 호출
                        getNowPrice(auctionId);
                        formatAuctionPrices();
                    });
                },
                error: function (xhr, status, error) {
                    console.error('Error fetching all auctions:', error);
                }
            });
        }
    }

    // 검색 결과를 경매 리스트에 반영하는 함수
    function updateAuctionList(auctionList) {
        var auctionListDiv = $("#auctionList"); // 경매 리스트가 담길 div
        auctionListDiv.empty(); // 기존 리스트 비우기

        // 검색된 경매 목록을 하나씩 추가
        auctionList.forEach(function (list) {
            var auctionHtml = `
                <div class="auction" data-auction-id="\${list.auction_id}">
                    <a href="auctionDetail?auction_lot=\${list.auction_lot}&auctionSchedule_id=\${list.auctionSchedule_id}">
                        <div class="auctionImg">
                            <div class="uploadResult">
                                <ul class="uploadStyle">
                                    <img src="images/auction1.jpg">
                                </ul>
                            </div>
                        </div> <!--auctionImg 끝-->
                    </a>
                    <div class="auctionCon">
                        <h5>\${list.auction_id}</h5>
                        <h2>\${list.auction_author}</h2>
                        <h3>\${list.auction_title}</h3>
                        <h4>\${list.auction_materials}</h4>
                        <h4 class="size">\${list.auction_size} | \${list.auction_madeDate}</h4>
                    </div>
                    <div class="auctionCost">
                        <h5>시작가</h5>
                        <div class="money">
                            <h4>KRW</h4>
                            <h5 class="startPrice" data-price="\${list.auction_startPrice}">\${list.auction_startPrice}</h5>
                        </div>
                    </div>
                    <div class="auctionCost">
                        <h5 style="color: #111;">낙찰가</h5>
                        <div class="money">
                            <h4>KRW</h4>
                            <h5 class="nowPrice"></h5>
                        </div>
                    </div>
                    <div class="bidButton">
                        <a href="auctionDetail?auction_lot=\${list.auction_lot}&auctionSchedule_id=\${list.auctionSchedule_id}"><h5>경매 종료</h5></a>
                    </div>
                </div> <!--auction 끝-->
            `;
            auctionListDiv.append(auctionHtml); // 새로운 경매 항목 추가
            // 각 경매 항목에 대해 이미지 로드 함수 호출
            loadAuctionImage(list.auction_id);
            // 검색 후에도 가격 포맷 적용
            formatAuctionPrices();
            getNowPrice(list.auction_id);
        });
    }

    // 경매 아이디로 이미지 로딩하는 함수
    function loadAuctionImage(auctionId) {
        $.ajax({
            url: '/auctionListGetFileList1', // 경매 이미지 파일 목록을 가져오는 경로
            type: 'GET',
            data: { auction_id: auctionId },
            dataType: 'json',
            success: function(imageData) {
                var uploadResultContainer = $(".auction[data-auction-id='" + auctionId + "'] .uploadResult ul");
                showUploadResult(imageData, uploadResultContainer); // 이미지를 리스트에 추가하는 함수 호출
            },
            error: function(xhr, status, error) {
                console.error('Error fetching file list for auction_id ' + auctionId + ':', error);
            }
        });
    }

    // 경매 아이디로 현재가 불러오는 함수
    function getNowPrice(auctionId) {
        var auctionElement = $(".auction[data-auction-id='" + auctionId + "']");
        var auctionCostElement = auctionElement.find('.nowPrice');  // 현재가가 표시될 요소 선택
        var startPriceElement = auctionElement.find('.startPrice'); // 시작가 요소 선택
        var startPrice = startPriceElement.data('price'); // 시작가 값

        $.ajax({
            url: '/auctionNowPrice',
            type: 'GET',
            data: { auction_id: auctionId },
            success: function (data) {
                if (data !== null && data !== 0) {
                    auctionCostElement.text(Number(data).toLocaleString());  // 현재가가 있으면 현재가 표시
                } else {
                    auctionCostElement.text('-');  // 현재가가 없을 때는 - 표시
                }
            },
            error: function (xhr, status, error) {
                console.error('Error fetching auction now price for auction_id ' + auctionId + ':', error);
                auctionCostElement.text(Number(startPrice).toLocaleString());  // 오류 발생 시에도 시작가로 표시
            }
        });
    }
</script>

