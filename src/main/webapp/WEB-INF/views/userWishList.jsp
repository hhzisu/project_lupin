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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userWishListStyle.css">
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
                    <li><a href="userBidList">응찰 내역</a></li>
                    <li><a href="userBuyList">결제/구매 내역</a></li>
                    <li><a href="userCommissionList">위탁 문의 내역</a></li>
                    <li><a href="userQuestionList">1:1 문의 내역</a></li>
                    <li><a href="userWishList" style="color: black; font-weight: 700;">위시 리스트</a></li>
                </ul>
            </div>
            <!-- userNav 끝 -->
            <div class="userInfoInfo">
                <div class="userInfoTitle">
                    <h3>위시 리스트</h3>
                </div>
                <hr>
                <div class="userWishList">
                    <div class="wishListHeader">
                        <!-- <h5 class="auctionDate">${Wishlist[0].auctionSchedule_start} 온라인 경매</h5> -->
                        <h5 class="auctionDate"><fmt:formatDate value="${Wishlist[0].auctionSchedule_start}" pattern="yyyy.MM.dd" /> 온라인 경매</h5>
                        <button class="currentAuctionBtn">진행경매보기</button>
                    </div>

                    <c:forEach items="${Wishlist}" var="Wishlist">
                        <div class="wishList" data-attach-uploadpath1="${Wishlist.attachUploadpath1}"
                                              data-attach-filename1="${Wishlist.attachFilename1}"
                                              data-bid-auctionId="${Wishlist.auction_id}"
                                              >
                            <div class="wishListImg">
                                <div class="uploadResult">
                                    <ul>
                                        <img src="images/auction1.jpg">
                                    </ul>
                                </div>
                            </div>
                            <div class="wishListExplain">
                                <div class="WishListLotNum">LOT ${Wishlist.auction_lot}</div>
                                <div class="authorName">${Wishlist.auction_author}</div>
                                <div class="workName">${Wishlist.auction_title}</div>
                            </div>
                            <div class="wishListEnd">
                                <div>
                                    <button>WISH</button>
                                </div>
                                <div class="wishListPrices">
                                    <div class="startPrice">
                                        <div>
                                            <span class="span1">시작가</span>
                                            <span class="span2">KRW</span>
                                        </div>
                                        <!-- <div>${Wishlist.auction_startPrice}</div> -->
                                        <div><fmt:formatNumber value="${Wishlist.auction_startPrice}" type="number" groupingUsed="true" /></div>
                                    </div>
                                    <div class="currentPrice">
                                        <div>
                                            <span class="span1">현재가</span>
                                            <span class="span2">KRW</span>
                                        </div>
                                        <div class="currentPriceNum">8,000,000</div>
                                    </div>
                                </div>
                            </div>
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

    // 페이지 로드 시 foreach로 이미지 경로 업데이트
    $('.wishList').each(function(index, element) {
        // 이미지 불러옴
        var auctionId = $(element).data('bid-auctionid'); // auctionId 가져오기
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
                    auctionCostElement.text(Number(data).toLocaleString());  // 현재가가 있으면 현재가 표시
                }
            },
            error: function (xhr, status, error) {
                console.error('Error fetching auction now price for auction_id ' + auctionId + ':', error);
            }
        });


        let userInfoId;

        // 사용자 정보를 가져오는 AJAX 요청
        $.ajax({
            url: "/api/auction/userInfo",
            method: "GET",
            success: function(data) {
                console.log("API 호출 성공:", data); // API 성공 여부 확인
                if (data) {
                    userInfoId = data;  // 데이터를 전역 변수에 저장
                    console.log("user_id =>", userInfoId.id); // ID 출력

                    // 위시 상태 확인 및 버튼 상태 설정
                    $.ajax({
                        url: '/wish/state',
                        type: 'GET',
                        data: { auction_id: auctionId, user_id: userInfoId.id },
                        success: function(data) {
                            if (data) {
                                // 사용자가 이미 위시를 눌렀다면 active 클래스 추가
                                $(element).find('.wishListEnd button').addClass('active');
                            } else {
                                $(element).find('.wishListEnd button').removeClass('active');
                            }
                        },
                        error: function(xhr, status, error) {
                            console.error('Error checking wish state:', error);
                        }
                    });

                } else {
                    console.log("사용자 정보가 없습니다.");
                }
            },
            error: function(err) {
                console.error("API 호출 실패:", err); // API 에러 확인
            }
        });

        // WISH 버튼 클릭 시 이벤트 처리
        $(element).find('.wishListEnd button').click(function() {
            var isWish = $(this).hasClass('active');  // 현재 active 클래스가 있는지 확인
            console.log("버튼 클릭됨, isWish 상태:", isWish); // 클릭 여부 확인

            if (isWish) {
                // 위시 삭제 요청
                $.ajax({
                    url: '/unwish',
                    type: 'POST',
                    data: { auction_id: auctionId, user_id: userInfoId.id },
                    success: function(response) {
                        if (response === 'OK') {
                            $(element).find('.wishListEnd button').removeClass('active');  // active 클래스 제거
                            // alert('위시 목록에서 제거되었습니다.');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error removing wish:', error);
                    }
                });
            } else {
                // 위시 추가 요청
                $.ajax({
                    url: '/wish',
                    type: 'POST',
                    data: { auction_id: auctionId, user_id: userInfoId.id },
                    success: function(response) {
                        if (response === 'OK') {
                            $(element).find('.wishListEnd button').addClass('active');  // active 클래스 추가
                            // alert('위시 목록에 추가되었습니다.');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error adding wish:', error);
                    }
                });
            }
        });


    });




</script>
