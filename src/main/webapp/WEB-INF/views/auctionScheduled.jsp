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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/auctionScheduled.css">
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

    <div class="body">
    <div class="section">
        <div class="auctionProgress">
            <h5>경매 시작 3일 5시간 20분 3초 전</h5>
            <div class="tab">
                <h4>진행 경매</h4>
                <h4 class="active">예정 경매</h4>
                <div class="search">
                    <span class="icon">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </span>
                    <input type="text" placeholder="작가, 작품명 검색">
                </div>
            </div> <!--tab 끝-->

            <div class="auctionList">
                <div class="auction">
                    <div class="auctionImg">
                        <div class="uploadResult">
                            <ul>
                                <img src="images/auction1.jpg">
                            </ul>
                        </div>
                    </div> <!--auctionImg 끝-->
                    <div class="auctionCon">
                        <h5>LOT 1</h5>
                        <h2>나성엽</h2>
                        <h3>여덟을 꺼내는 시간</h3>
                        <h4>캔버스에 유채</h4>
                        <h4 class="size">33 x 33 cm | 2020</h4>
                    </div>
                    <div class="auctionCost">
                        <h5>시작가</h5>
                        <div class="money">
                            <h4>KRW</h4>
                            <h5>8,000,000</h5>
                        </div>
                    </div>
                    <div class="bidButton">
                        <a href="#"><h5>경매 예정</h5></a>
                    </div>
                </div> <!--auction 끝-->
                <div class="auction">
                    <div class="auctionImg">
                        <div class="uploadResult">
                            <ul>
                                <img src="images/auction2.jpg">
                            </ul>
                        </div>
                    </div> <!--auctionImg 끝-->
                    <div class="auctionCon">
                        <h5>LOT 1</h5>
                        <h2>나성엽</h2>
                        <h3>여덟을 꺼내는 시간</h3>
                        <h4>캔버스에 유채</h4>
                        <h4 class="size">33 x 33 cm | 2020</h4>
                    </div>
                    <div class="auctionCost">
                        <h5>시작가</h5>
                        <div class="money">
                            <h4>KRW</h4>
                            <h5>8,000,000</h5>
                        </div>
                    </div>
                    <div class="bidButton">
                        <a href="#"><h5>경매 예정</h5></a>
                    </div>
                </div> <!--auction 끝-->
                <div class="auction">
                    <div class="auctionImg">
                        <div class="uploadResult">
                            <ul>
                                <img src="images/auction3.jpg">
                            </ul>
                        </div>
                    </div> <!--auctionImg 끝-->
                    <div class="auctionCon">
                        <h5>LOT 1</h5>
                        <h2>나성엽</h2>
                        <h3>여덟을 꺼내는 시간</h3>
                        <h4>캔버스에 유채</h4>
                        <h4 class="size">33 x 33 cm | 2020</h4>
                    </div>
                    <div class="auctionCost">
                        <h5>시작가</h5>
                        <div class="money">
                            <h4>KRW</h4>
                            <h5>8,000,000</h5>
                        </div>
                    </div>
                    <div class="bidButton">
                        <a href="#"><h5>경매 예정</h5></a>
                    </div>
                </div> <!--auction 끝-->
                <div class="auction">
                    <div class="auctionImg">
                        <div class="uploadResult">
                            <ul>
                                <img src="images/auction1.jpg">
                            </ul>
                        </div>
                    </div> <!--auctionImg 끝-->
                    <div class="auctionCon">
                        <h5>LOT 1</h5>
                        <h2>나성엽</h2>
                        <h3>여덟을 꺼내는 시간</h3>
                        <h4>캔버스에 유채</h4>
                        <h4 class="size">33 x 33 cm | 2020</h4>
                    </div>
                    <div class="auctionCost">
                        <h5>시작가</h5>
                        <div class="money">
                            <h4>KRW</h4>
                            <h5>8,000,000</h5>
                        </div>
                    </div>
                    <div class="bidButton">
                        <a href="#"><h5>경매 예정</h5></a>
                    </div>
                </div> <!--auction 끝-->
                <div class="auction">
                    <div class="auctionImg">
                        <div class="uploadResult">
                            <ul>
                                <img src="images/auction1.jpg">
                            </ul>
                        </div>
                    </div> <!--auctionImg 끝-->
                    <div class="auctionCon">
                        <h5>LOT 1</h5>
                        <h2>나성엽</h2>
                        <h3>여덟을 꺼내는 시간</h3>
                        <h4>캔버스에 유채</h4>
                        <h4 class="size">33 x 33 cm | 2020</h4>
                    </div>
                    <div class="auctionCost">
                        <h5>시작가</h5>
                        <div class="money">
                            <h4>KRW</h4>
                            <h5>8,000,000</h5>
                        </div>
                    </div>
                    <div class="bidButton">
                        <a href="#"><h5>경매 예정</h5></a>
                    </div>
                </div> <!--auction 끝-->
                <div class="auction">
                    <div class="auctionImg">
                        <div class="uploadResult">
                            <ul>
                                <img src="images/auction1.jpg">
                            </ul>
                        </div>
                    </div> <!--auctionImg 끝-->
                    <div class="auctionCon">
                        <h5>LOT 1</h5>
                        <h2>나성엽</h2>
                        <h3>여덟을 꺼내는 시간</h3>
                        <h4>캔버스에 유채</h4>
                        <h4 class="size">33 x 33 cm | 2020</h4>
                    </div>
                    <div class="auctionCost">
                        <h5>시작가</h5>
                        <div class="money">
                            <h4>KRW</h4>
                            <h5>8,000,000</h5>
                        </div>
                    </div>
                    <div class="bidButton">
                        <a href="#"><h5>경매 예정</h5></a>
                    </div>
                </div> <!--auction 끝-->
                <div class="auction">
                    <div class="auctionImg">
                        <div class="uploadResult">
                            <ul>
                                <img src="images/auction1.jpg">
                            </ul>
                        </div>
                    </div> <!--auctionImg 끝-->
                    <div class="auctionCon">
                        <h5>LOT 1</h5>
                        <h2>나성엽</h2>
                        <h3>여덟을 꺼내는 시간</h3>
                        <h4>캔버스에 유채</h4>
                        <h4 class="size">33 x 33 cm | 2020</h4>
                    </div>
                    <div class="auctionCost">
                        <h5>시작가</h5>
                        <div class="money">
                            <h4>KRW</h4>
                            <h5>8,000,000</h5>
                        </div>
                    </div>
                    <div class="bidButton">
                        <a href="#"><h5>경매 예정</h5></a>
                    </div>
                </div> <!--auction 끝-->
                <div class="auction">
                    <div class="auctionImg">
                        <div class="uploadResult">
                            <ul>
                                <img src="images/auction1.jpg">
                            </ul>
                        </div>
                    </div> <!--auctionImg 끝-->
                    <div class="auctionCon">
                        <h5>LOT 1</h5>
                        <h2>나성엽</h2>
                        <h3>여덟을 꺼내는 시간</h3>
                        <h4>캔버스에 유채</h4>
                        <h4 class="size">33 x 33 cm | 2020</h4>
                    </div>
                    <div class="auctionCost">
                        <h5>시작가</h5>
                        <div class="money">
                            <h4>KRW</h4>
                            <h5>8,000,000</h5>
                        </div>
                    </div>
                    <div class="bidButton">
                        <a href="#"><h5>경매 예정</h5></a>
                    </div>
                </div> <!--auction 끝-->
                
                
            </div> <!--auctionList 끝-->
        </div><!--auctionProgress 끝-->
    </div><!--section 끝-->
    </div>

    <%@ include file="footer.jsp" %> 

</body>
</html>
<script>

</script>

