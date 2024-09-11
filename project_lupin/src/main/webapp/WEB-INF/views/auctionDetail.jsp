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
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auctionDetail.css"> 
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

    <div class="mainSection">
        <section>
            <div class="control">
                <a href="#"><h5>< 이전</h5></a>
                <h5>마감 3일 5시간 전</h5>
                <a href="#"><h5>다음 ></h5></a>
            </div>
            <div class="detailAuction">
                <div class="left">
                    <div class="auctionImg">
                        <div class="leftImg">
                            <div class="preview">
                                <div class="uploadResult">
                                    <ul>
                                        <img src="images/auction1.jpg">
                                    </ul>
                                </div>
                            </div>
                            <div class="preview">
                                <div class="uploadResult">
                                    <ul>
                                        <img src="images/auction2.jpg">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="rightImg">
                            <div class="detail">
                                <img src="images/auction1.jpg">
                            </div>
                        </div>
                    </div> <!--auctionImg 끝-->
                    <div class="detailCon">
                        <h4>작품 정보</h4>
                        <h5>나성엽</h5>
                        <h5>여덟을 꺼내는 시간</h5>
                        <h5>캔버스에 유채</h5>
                        <h5>33 x 33 cm | 2020</h5>
                        <h5 class="sign">sign and dated on the reverse</h5>

                        <h4>작가 설명</h4>
                        <textarea name="" id="" readonly>앤디 워홀은 팝아트를 대표하는 멀티 아티스트이다. 도발적인 주제와 혁신적인 제작기법, 파격적인 언행으로 화제의 중심에 섰던 일러스트레이터이자 디자이너, 사진가이자 영화 제작자였다. 그는 슬로바키아 출신 이민자가정에서 태어나 카네기멜론 대학교에서 산업 디자인을 전공한 후 뉴욕으로 이주해 화가, 아방가르드 영화, 레코드 프로듀서, 작가 등 전방위 활동으로 세계적 명성을 쌓으며 동시대 최고의 유명인이 됐다. 1952년 드로잉 15작품으로 개인전을 연 것을 시작으로 1956년 뉴욕 MoMA에서의 그룹전 등을 통해 재스퍼 존스, 로버트 라우센버그, 키스 해링, 장 미쉘 바스키아 등 작가들과 활발히 교류했고, 정치인이나 헐리우드 스타, 거대 도시 문명 속 기물들을 소재로 대중화된 문화의 가치와 의미를 직관하도록 예술품의 대량생산에 앞섰다. 강렬한 색상과 명도의 실크 스크린 기법으로 제작한 (100개의 캠벨 수프캔), (1달러 지폐 200장), (금빛 마릴린 먼로) 등 극명한 현대의 이미지를 포착한 작품들은 이후 다른 작가들의 오마주로도 유명하다.</textarea>
                    </div><!--detailCon 끝-->
                </div> <!--left 끝-->
                <div class="right">
                    <div class="positionBox">
                        <div class="top">
                            <div class="wish">
                                <h5>LOT 1</h5>
                                <button>WISH</button>
                            </div>
                            <h2>나성엽</h2>
                            <h3>여덟을 꺼내는 시간</h3>
                            <h4>캔버스에 유채</h4>
                            <h4 class="size">33 x 33 cm | 2020</h4>
                        </div>
                        <div class="mid">
                            <div class="auctionCost start">
                                <h5>추정가</h5>
                                <div class="money">
                                    <h4>KRW</h4>
                                    <h5>8,000,000</h5>
                                    <h4>~</h4>
                                    <h5>10,000,000</h5>
                                </div>
                            </div>
                            <div class="auctionCost start">
                                <h5>시작가</h5>
                                <div class="money">
                                    <h4>KRW</h4>
                                    <h5>8,000,000</h5>
                                </div>
                            </div>
                            <div class="auctionCost">
                                <h5 style="color: #111;">현재가</h5>
                                <div class="money">
                                    <h4>KRW</h4>
                                    <h5>12,500,000</h5>
                                </div>
                            </div>
                        </div>
                        <div class="bottom">
                            <div class="buttons">
                                <div class="guidebtn">
                                    <h5>낙찰 수수료</h5>
                                    <h5>+</h5>
                                </div>
                                <div class="guidebtn">
                                    <h5>경매 호가표</h5>
                                    <h5>+</h5>
                                </div>
                            </div>
                            <div class="auctionButton">
                                <button>응찰하기</button>
                                <button class="bid" style="display: none;">입찰하기</button>
                                <button class="disable" style="display: none;">경매 종료</button>
                                <button class="disable" style="display: none;">경매 예정</button>
                            </div>
                        </div>
                    </div> <!--positionBox 끝-->
                </div> <!--right 끝-->
            </div> <!--detailAuction 끝-->
        </section>

        <!-- 모달 구조 -->
        <div id="modal1" class="modal">
            <div class="modal-content" style="width: 450px; height: 420px;">
                <span class="close">&times;</span>
                <div class="modal-header">
                    <h4>낙찰 수수료 안내</h4>
                </div>
                <div class="modal-body">
                    <table>
                        <thead>
                            <tr>
                                <th>낙찰가 (원)</th>
                                <th>수수료율 (VAT 포함)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>~10,000,000</td>
                                <td>낙찰가의 19.8%</td>
                            </tr>
                            <tr>
                                <td>10,000,001 ~</td>
                                <td>1,000만원의 19.8% +<br>(낙찰가 - 1,000만원) × 16.5%</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="notice">
                        <p>예시) 낙찰가 5,000만원일 경우</p>
                        <ul>
                            <li>· 낙찰 수수료 : <br>198만원 + (5,000만원 - 1,000만원) × 16.5%<br>= 8,580,000원</li>
                            <li>· 총 구매대금 : <br>낙찰가 + 낙찰수수료 = 58,580,000원</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div id="modal2" class="modal">
            <div class="modal-content" style="width: 580px; height: 530px;">
                <span class="close">&times;</span>
                <div class="modal-header">
                    <h4>경매 호가표 안내</h4>
                </div>
                <div class="modal-body modal2-centered">
                    <table>
                        <thead>
                            <tr>
                                <th>현재가 구간 (원)</th>
                                <th>호가 단위 (원)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>30만원 미만</td>
                                <td>20,000</td>
                            </tr>
                            <tr>
                                <td>30만원 이상 ~ 100만원 미만</td>
                                <td>50,000</td>
                            </tr>
                            <tr>
                                <td>100만원 이상 ~ 300만원 미만</td>
                                <td>100,000</td>
                            </tr>
                            <tr>
                                <td>300만원 이상 ~ 500만원 미만</td>
                                <td>200,000</td>
                            </tr>
                            <tr>
                                <td>500만원 이상 ~ 1,000만원 미만</td>
                                <td>500,000</td>
                            </tr>
                            <tr>
                                <td>1,000만원 이상 ~ 3,000만원 미만</td>
                                <td>1,000,000</td>
                            </tr>
                            <tr>
                                <td>3,000만원 이상 ~ 5,000만원 미만</td>
                                <td>2,000,000</td>
                            </tr>
                            <tr>
                                <td>5,000만원 이상 ~ 2억 미만</td>
                                <td>5,000,000</td>
                            </tr>
                            <tr>
                                <td>2억 이상 ~ 5억 미만</td>
                                <td>10,000,000</td>
                            </tr>
                            <tr>
                                <td>5억 이상</td>
                                <td>20,000,000</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div><!--모달 끝-->

    </div><!--mainSection 끝-->

    <%@ include file="footer.jsp" %> 

</body>
</html>
<script>
    // "낙찰 수수료" 버튼 클릭 시 모달1 표시
    document.querySelector(".guidebtn:first-child").onclick = function() {
        document.getElementById("modal1").style.display = "block";
    }
    
    // "경매 호가표" 버튼 클릭 시 모달2 표시
    document.querySelector(".guidebtn:last-child").onclick = function() {
        document.getElementById("modal2").style.display = "block";
    }
    
    // 모든 닫기 버튼 클릭 시 모달 닫기
    var closeButtons = document.getElementsByClassName("close");
    for (var i = 0; i < closeButtons.length; i++) {
        closeButtons[i].onclick = function() {
            this.closest('.modal').style.display = "none";
        }
    }
    
    // 모달 밖을 클릭하면 닫기
    window.onclick = function(event) {
        if (event.target.className === 'modal') {
            event.target.style.display = "none";
        }
    }
    </script>

