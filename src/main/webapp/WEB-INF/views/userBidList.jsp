<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userBidListStyle.css">
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

    <div class="pageFixSize">
        <div class="userInfo">
            <div class="userNav">
                <h3 class="navUserName">${sessionScope.user.name} 님</h3>
                <ul>
                    <li><a href="userInfo">회원정보관리</a></li>
                    <li><a href="userBidList" style="color: black; font-weight: 700;">응찰 내역</a></li>
                    <li><a href="userBuyList">결제/구매 내역</a></li>
                    <li><a href="userCommissionList">위탁 문의 내역</a></li>
                    <li><a href="userQuestionList">1:1 문의 내역</a></li>
                    <li><a href="userWishList">위시 리스트</a></li>
                </ul>
            </div>
            <!-- userNav 끝 -->
            <div class="userInfoInfo">
                <div class="userInfoTitle">
                    <h3>응찰 내역</h3>
                </div>
                <hr>
                <div class="userBidList">

                    <div class="bidListHeader">
                        <h5 class="auctionDate">24.09.01 온라인 경매</h5>
                        <button class="currentAuctionBtn" onclick="location='auctionProgress'">진행경매보기</button>
                    </div>
                    <c:forEach items="${Bidlist}" var="Bidlist">
                        <div class="bidList" data-attach-uploadpath1="${Bidlist.attachUploadpath1}"
                                             data-attach-filename1="${Bidlist.attachFilename1}"
                                             >
                            <div class="bidListImg">
                                <div class="uploadResult">
                                    <ul>
                                        <img src="images/auction1.jpg">
                                    </ul>
                                </div>
                            </div>
                            <div class="bidListExplain">
                                <div class="WishListLotNum">LOT ${Bidlist.auction_lot}</div>
                                <div class="authorName">${Bidlist.auction_author}</div>
                                <div class="workName">${Bidlist.auction_title}</div>
                            </div>
                            <div class="bidListEnd">
                                <div class="bidListPrices">
                                    <div class="bidPrice">
                                        <div>응찰가</div>
                                        <!-- <div>KRW &nbsp; ${Bidlist.bidHistory[0].bidMoney}</div> -->
                                        <div>KRW &nbsp; <fmt:formatNumber value="${Bidlist.bidHistory[0].bidMoney}" type="number" groupingUsed="true" /></div>
                                    </div>
                                    <div class="bidDate">
                                        <div class="bidDateTitle">응찰일</div>
                                        <div><fmt:formatDate value="${Bidlist.bidHistory[0].bidTime}" pattern="yyyy.MM.dd" /></div>
                                    </div>
                                    <div class="currentPrice">
                                        <div>현재가</div>
                                        <div class="currentPriceNum">KRW &nbsp; 8,000,000</div>
                                    </div>
                                </div>
                                <div>
                                    <button class="bidDetailBtn" data-bid-auctionId='${Bidlist.auction_id}'>상세보기</button>
                                </div>
                            </div>
                            <!-- bidListEnd 끝 -->
                        </div>
                        <!-- bidList 끝 -->
                    </c:forEach>
                    <!-- 응찰 리스트 반복문 끝 -->

                </div>
                <!-- userBidList끝 -->
                <hr>

            </div>
            <!-- userInfoInfo 끝 -->
        </div>
        <!-- userInfo 끝 -->
    </div>


    <div id="modalBackground" class="modalBackground"></div>


    <!-- 상세보기 모달 -->
    <div id="bidDetailModal" class="bidDetailModal">
        <span class="closeBtn">&times;</span>
        <div class="modalContent">
            <h2>응찰 상세 정보</h2>
            <hr>
            <div class="bidDetailColunm">
                <div class="bidingPrice">응찰가</div>
                <div class="bidingDate">응찰일자</div>
                <div class="bidingMethod">응찰방법</div>
                <div class="bidingNote">비고</div>
            </div>
            <div class="bidDetailContent">
                <div class="bidingPrice">KRW 10,000,000</div>
                <div class="bidingDate">2024.08.28 21:25:31</div>
                <div class="bidingMethod">1회 응찰</div>
                <div class="bidingNote">낙찰</div>
            </div>
            <div class="bidDetailContent">
                <div class="bidingPrice">KRW 10,000,000</div>
                <div class="bidingDate">2024.08.28 21:25:31</div>
                <div class="bidingMethod">1회 응찰</div>
                <div class="bidingNote"></div>
            </div>
            <div class="bidDetailContent">
                <div class="bidingPrice">KRW 10,000,000</div>
                <div class="bidingDate">2024.08.28 21:25:31</div>
                <div class="bidingMethod">1회 응찰</div>
                <div class="bidingNote"></div>
            </div>
            <div class="bidDetailContent">
                <div class="bidingPrice">KRW 10,000,000</div>
                <div class="bidingDate">2024.08.28 21:25:31</div>
                <div class="bidingMethod">자동 응찰</div>
                <div class="bidingNote"></div>
            </div>
            <hr>
        </div>
    </div>
    <%@ include file="footer.jsp" %> 

</body>
</html>

<script>
    // 모달 가져오기
    var modal = document.getElementById("bidDetailModal");
    var modalBackground = document.getElementById("modalBackground");

    $('.bidDetailBtn').click(function() {
        var auctionId = $(this).data('bid-auctionid'); // data 속성에서 auction_id 가져오기
        var userId = userInfo.id; // 헤더에서 가져온 userInfo의 id

        // Ajax 요청으로 서버에서 응찰 내역을 가져오기
        $.ajax({
            url: "getBidDetail",
            type: "GET",
            data: {
                auctionId: auctionId,
                userId: userId
            },
            success: function(response) {
                // 응답 받은 데이터를 모달에 표시
                displayBidDetails(response);
                modal.style.display = "block";
                modalBackground.style.display = "block";
            },
            error: function(error) {
                console.log("Error fetching bid details: ", error);
            }
        });
    });

    // <span> 요소(닫기 버튼)를 가져오기
    var span = document.getElementsByClassName("closeBtn")[0];

    // 사용자가 <span> (x) 을 클릭했을 때 모달 닫기
    span.onclick = function() {
        modal.style.display = "none";
        modalBackground.style.display = "none";
    }

    // 사용자가 모달 외부를 클릭했을 때 모달 닫기
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
            modalBackground.style.display = "none";
        }
    }


    // 페이지 로드 시 foreach로 이미지 경로 업데이트
    $('.bidList').each(function(index, element) {
        // 이미지 불러옴
        var auctionId = $(element).find('.bidDetailBtn').data('bid-auctionid'); // 각 리스트에서 auctionId 가져오기
        var attachUploadPath = $(element).data('attach-uploadpath1'); // 업로드 경로
        var attachFilename = $(element).data('attach-filename1');     // 파일 이름

        // 이미지 경로 생성
        let imagePath = `\${attachUploadPath}/\${attachFilename}`;
        console.log("이미지 경로: " + imagePath);

        // 이미지 요소에 경로 설정
        $(element).find('.uploadResult img').attr('src', '/auctionListDisplay?fileName=' + encodeURIComponent(imagePath));


        // 현재가 데이터 불러옴
        var auctionCostElement = $(element).find('.currentPriceNum');  // 현재가가 표시될 요소 선택

        $.ajax({
            url: '/auctionNowPrice',
            type: 'GET',
            data: { auction_id: auctionId },
            success: function (data) {
                if (data !== null && data !== 0) {
                    auctionCostElement.text("KRW " + Number(data).toLocaleString());  // 현재가가 있으면 현재가 표시
                }
            },
            error: function (xhr, status, error) {
                console.error('Error fetching auction now price for auction_id ' + auctionId + ':', error);
            }
        });
    });
    

    function displayBidDetails(bidDetails) {
        var modalContent = document.querySelector('.modalContent'); // 모달의 내용 부분 가져오기

        // 이전에 표시된 상세 정보를 지우기
        $('.bidDetailContent').remove();

        // 응답 받은 데이터로 모달 내용 채우기
        bidDetails.forEach(function(detail) {
            var bidDetailContent = `
                <div class="bidDetailContent">
                    <div class="bidingPrice">KRW \${detail.bidMoney.toLocaleString()}</div>
                    <div class="bidingDate">\${formatBidTime(detail.bidTime)}</div>
                    <div class="bidingMethod">\${detail.bidStatus}</div>
                    <div class="bidingNote"></div>
                </div>
            `;
            modalContent.innerHTML += bidDetailContent;
        });
    }


    // 응찰 시간을 포맷하는 함수
    function formatBidTime(bidTime) {
        var date = new Date(bidTime);
        var year = String(date.getFullYear()).substring(2);  // 마지막 두 자리 연도
        var month = ('0' + (date.getMonth() + 1)).slice(-2); // 월 두 자리
        var day = ('0' + date.getDate()).slice(-2);          // 일 두 자리
        var hours = ('0' + date.getHours()).slice(-2);       // 시 두 자리
        var minutes = ('0' + date.getMinutes()).slice(-2);   // 분 두 자리
        var seconds = ('0' + date.getSeconds()).slice(-2);   // 초 두 자리

        return year + '.' + month + '.' + day + ' ' + hours + ':' + minutes + ':' + seconds;
    }
    
</script>
