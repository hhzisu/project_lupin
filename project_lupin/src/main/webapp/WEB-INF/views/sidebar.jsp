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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebarRightStyle.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
    
    <!-- 사이드 바 버튼 -->
    <div class="toggleBtn">
        <i class="fas fa-chevron-left"></i>
    </div>

    <!-- 사이드 바 -->
    <div class="sidebarRight">
        <div class="sidebarHeader">
            <h3>현재 참여중인 경매</h3>
        </div>

        <div class="participationAuction">
            <div class="participationAuctionTop">
                <div class="participationAuctionTopLeft">
                    <h4>나성엽</h4>
                    <p>여덟을 꺼내는 시간</p>
                </div>
                <button class="bidingbtn">입찰하기</button>
            </div>
            <div class="participationAuctionBottom">
                <div class="startPrice">
                    <span class="span1">시작가</span>
                    <span class="span2">KRW</span>
                    <div>8,000,000</div>
                </div>
                <div class="currentPrice">
                    <span class="span1">현재가</span>
                    <span class="span2">KRW</span>
                    <div>12,500,000</div>
                </div>
            </div>
        </div>
        <div class="participationAuction">
            <div class="participationAuctionTop">
                <div class="participationAuctionTopLeft">
                    <h4>하지수</h4>
                    <p>아홉을 꺼내는 시간</p>
                </div>
                <button class="bidingbtn">입찰하기</button>
            </div>
            <div class="participationAuctionBottom">
                <div class="startPrice">
                    <span class="span1">시작가</span>
                    <span class="span2">KRW</span>
                    <div>8,000,000</div>
                </div>
                <div class="currentPrice">
                    <span class="span1">현재가</span>
                    <span class="span2">KRW</span>
                    <div>12,500,000</div>
                </div>
            </div>
        </div>
        <div class="participationAuction">
            <div class="participationAuctionTop">
                <div class="participationAuctionTopLeft">
                    <h4>최민중</h4>
                    <p>열을 꺼내는 시간</p>
                </div>
                <button class="bidingbtn">입찰하기</button>
            </div>
            <div class="participationAuctionBottom">
                <div class="startPrice">
                    <span class="span1">시작가</span>
                    <span class="span2">KRW</span>
                    <div>8,000,000</div>
                </div>
                <div class="currentPrice">
                    <span class="span1">현재가</span>
                    <span class="span2">KRW</span>
                    <div>12,500,000</div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
<script>
    $(document).ready(function() {
        // Toggle button 클릭 시 사이드바 열기/닫기
        $('.toggleBtn').click(function() {
            $('.sidebarRight').toggleClass('open');

            // 아이콘 변경 (왼쪽/오른쪽 화살표)
            if ($('.sidebarRight').hasClass('open')) {
                $('.toggleBtn i').removeClass('fa-chevron-left').addClass('fa-chevron-right');
            } else {
                $('.toggleBtn i').removeClass('fa-chevron-right').addClass('fa-chevron-left');
            }
        });
    });
</script>

