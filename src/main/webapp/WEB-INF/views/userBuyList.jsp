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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userBuyListStyle.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<!--아임포트 라이브러리 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<body>
    
    <%@ include file="header.jsp" %>

    <div class="pageFixSize">
        <div class="userInfo">
            <div class="userNav">
                <h3 class="navUserName">${sessionScope.user.name} 님</h3>
                <ul>
                    <li><a href="userInfo">회원정보관리</a></li>
                    <li><a href="userBidList">응찰 내역</a></li>
                    <li><a href="userBuyList" style="color: black; font-weight: 700;">결제/구매 내역</a></li>
                    <li><a href="userCommissionList">위탁 문의 내역</a></li>
                    <li><a href="userQuestionList">1:1 문의 내역</a></li>
                    <li><a href="userWishList">위시 리스트</a></li>
                </ul>
            </div>
            <!-- userNav 끝 -->
            <div class="userInfoInfo">
                <div class="userInfoTitle">
                    <h3>구매 내역</h3>
                </div>
                <hr>

                <div class="userBuyList">

<%--                    <div class="buyListHeader">--%>
<%--                        <h5 class="auctionDate">24.09.01 온라인 경매</h5>--%>
<%--                        <button class="currentAuctionBtn" onclick="location='auctionProgress'">진행경매보기</button>--%>
<%--                    </div>--%>

                    <input type="hidden" name="user_id" value="${loginUser.id}">
                    <c:forEach items="${buyList}" var="buyList">
                    <div class="buyListBody" data-auction-id="${buyList.auction_id}">
                        <div class="paystate">${buyList.buy_state}</div>
                        <div class="buyList">
                            <div class="buyListImg">
                                <div class="uploadResult">
                                    <ul class="uploadStyle">
                                        <img src="images/auction1.jpg">
                                    </ul>
                                </div>
                            </div>
                            <div class="buyListExplain">
                                <div class="WishListLotNum">LOT ${buyList.auction_lot}</div>
                                <div class="authorName">${buyList.auction_author}</div>
                                <div class="workName">${buyList.auction_title}</div>
                            </div>
                            <div class="buyListEnd">
                                <div class="buyListPrices">
<%--                                    <div class="bidPrice">--%>
<%--                                        <div>응찰가</div>--%>
<%--                                        <div>KRW &nbsp; ${buyList.bid_money}</div>--%>
<%--                                    </div>--%>
                                    <div class="bidDate">
                                        <div class="bidDateTitle">응찰일</div>
                                        <div>${buyList.bid_time}</div>
                                    </div>
                                    <div class="endPrice">
                                        <div>낙찰가</div>
                                        <div>KRW &nbsp; ${buyList.bid_money}</div>
                                    </div>
                                    <div class="bidFee">
                                        <div>낙찰 수수료</div>
                                        <div>KRW &nbsp; <span class="bid_fee" data-money="${buyList.bid_money}"></span></div>
                                    </div>
                                    <div class="bidFee" style="color: black">
                                        <div>총 결제 액</div>
                                        <div>KRW &nbsp; <span class="bid_total"></span></div>
                                    </div>
                                </div>
                                <div>
                                    <c:choose>
                                        <c:when test="${buyList.buy_state == '결제 완료'}">
                                            <!-- 결제 완료 시 버튼에 날짜 포함 -->
                                            <button class="payBtn" disabled style="color: var(--color-gray)">결제 완료 (${buyList.buy_date})</button>
                                        </c:when>
                                        <c:otherwise>
                                            <!-- 결제 전일 때 결제 버튼 활성화 -->
                                            <button class="payBtn"
                                                    data-auction-id="${buyList.auction_id}"
                                                    data-bid-id="${buyList.bid_id}"
                                                    data-buy-id="${buyList.buy_id}"
                                                    data-bid-money="${buyList.bid_money}">
                                                결제하기
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <!-- bidListEnd 끝 -->
                        </div>
                    </div>
                    </c:forEach>
                    <!-- bidList 끝 -->
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
        // 페이지가 로드된 후 수수료 계산
        $(".bid_fee").each(function() {
            // 콤마를 제거하고 숫자로 변환
            var bidMoneyStr = $(this).data("money").toString();
            var bidMoney = parseInt(bidMoneyStr.replace(/,/g, '')); // 콤마 제거 후 숫자로 변환
            var fee = bidMoney * 0.198;
            var totalAmount = bidMoney + fee; // 낙찰가 + 수수료
            $(this).text(fee.toLocaleString());  // 결과를 다시 콤마 포맷으로 표시

            $(this).closest('.buyListBody').find('.bid_total').text(totalAmount.toLocaleString());  // 총 결제 금액 표시
        });

        $(".payBtn").click(function() {
            // 클릭된 버튼에서 data-* 속성으로 정보를 가져옴
            var auctionId = $(this).data("auction-id");
            var bidId = $(this).data("bid-id");
            var buyId = $(this).data("buy-id");
            var bidMoney = parseInt($(this).data("bid-money").toString().replace(/,/g, '')); // 콤마 제거 후 숫자로 변환
            var fee = bidMoney * 0.198; // 수수료 계산
            var totalAmount = bidMoney + fee; // 낙찰가 + 수수료

            // 결제 API 호출 (PortOne 결제 창 띄우기)
            callPaymentAPI(auctionId, bidId, buyId, totalAmount);
        });

        // buyListBody 반복하면서 데이터 가져옴
        $('.buyListBody').each(function () {
            // buyListBody클래스 data-auction-id 속성에서 값을 가져옴
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

    function callPaymentAPI(auctionId, bidId, buyId, amount) {
        // PortOne 결제 API로 결제창을 호출
        IMP.init('imp84226213'); // 가맹점 식별코드
        IMP.request_pay({
            pg: 'html5_inicis', // 결제 창 종류
            pay_method: 'card', // 결제 방식
            merchant_uid: 'merchant_' + new Date().getTime(), // 고유 주문번호
            name: 'auctionId: '+auctionId, // 결제 상품명
            amount: amount, // 테스트 결제 금액 (PortOne에서 실제로 처리할 결제 금액)
            buyer_email: userInfo.email, // 구매자 이메일
            buyer_name: userInfo.name, // 구매자 이름
            buyer_tel: userInfo.mobile, // 구매자 연락처
            buyer_addr: userInfo.roadAddress, // 구매자 주소
            buyer_postcode: userInfo.postcode, // 구매자 우편번호
        }, function (rsp) {
            if (rsp.success) {
                // 결제가 성공했을 때
                alert('결제가 완료되었습니다.');
                // 결제가 성공한 경우 서버로 결제 정보 전송
                $.ajax({
                    url: "/api/payment/complete",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify({
                        imp_uid: rsp.imp_uid,  // 아임포트에서 전달된 결제 고유 ID
                        auction_id: auctionId,
                        bid_id: bidId,
                        buy_id: buyId,
                        pay_state: '결제 완료'
                    }),
                    success: function(response) {
                        alert("결제가 성공적으로 처리되었습니다.");
                        window.location.href = "/userBuyList"; // 결제 내역으로 리다이렉트
                    },
                    error: function(xhr) {
                        alert("결제 처리 실패: " + xhr.responseText);
                    }
                });
            } else {
                alert('결제에 실패했습니다. 에러 내용: ' + rsp.error_msg);
            }
        });
    }

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


