<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title></title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
             <link rel="stylesheet" href="${pageContext.request.contextPath}/css/guideStorage.css"> 
            <!-- import font-awesome, line-awesome -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
            <!-- import pretendard font -->
            <link rel="stylesheet" as="style" crossorigin
                href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css" />
            <!-- import js -->
            <script src="https://code.jquery.com/jquery-3.6.3.min.js"
                integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        </head>

        <body>

            <%@ include file="header.jsp" %>
                <%@ include file="sidebar.jsp" %>

				<div class="storageContainer">
				        <div class="storageContent">
				            <div class="headBox">
				                <div class="storage_img">
				                    <img src="${pageContext.request.contextPath}/images/storage.png" alt="storage">
				                </div>
				                <div class="storage_text">
				                    <p>미술품 보관</p>
				                </div>
				                <div class="headText">
				                    <p class="smallgray">미술 작품을 안전하게 보관할 전문 서비스를 찾고 계신가요?</p>
				                    <p class="smallgray">대한민국 대표 미술품 경매회사 Lupin에서 미술 작품 전문 수장고 서비스를 제공합니다.</p>
				                </div>
				                <hr class="headLine">
				            </div>
				            <div class="storageWrap">
				                <div class="board">
				                    <div class="Title">
				                        <div class="vertical-line"></div>
				                        <p>수리/복원/케어 서비스</p>
				                    </div>
				                    <div class="content">
				                        <p>· 고객이 소유한 작품의 크기와 수에 맞는 다양한 가격대의 맞춤형 보관 프로그램을 제공합니다.</p>
				                    </div>
				                </div>
				                <div class="board">
				                    <div class="Title">
				                        <div class="vertical-line"></div>
				                        <p>최적의 시설</p>
				                    </div>
				                    <div class="content">
				                        <p>· 완벽한 항온, 항습, 방재, 보안시스템을 갖춘 미술품 보관 전용 수장고에 안전하게 보관합니다.</p>
				                        <p>· 24시간 경비가 상주하며, 첨단 시스템 경비가 완비되어 있습니다.</p>
				                        <p>· 각 룸 내 별도 CCTV가 설치되어 있으며, 모바일과 웹 상으로 실시간 모니터링이 가능합니다.</p>
				                    </div>
				                </div>
				                <div class="board">
				                    <div class="Title">
				                        <div class="vertical-line"></div>
				                        <p>작품별 개별 보험 가입</p>
				                    </div>
				                    <div class="content">
				                        <p>· 개별 작품의 입출고를 관리하고, 작품별 개별 보험 가입을 통해 만약의 경우 일어날 수 있는 사고에 대비할 수 있습니다(업계 최저 보험요율 적용).</p>
				                    </div>
				                </div>
				                <div class="board">
				                    <div class="Title">
				                        <div class="vertical-line"></div>
				                        <p>뷰잉 룸 서비스 제공</p>
				                    </div>
				                    <div class="content">
				                        <p>· 별도로 마련된 뷰잉 룸에서 작품을 감상하며 미팅을 진행하실 수 있습니다(별도 비용 청구, 사전 예약 필요).</p>
				                    </div>
				                </div>
				                <div class="board">
				                    <div class="Title">
				                        <div class="vertical-line"></div>
				                        <p>부가 서비스</p>
				                    </div>
				                    <div class="content">
				                        <p>· 보관 중인 작품을 대상으로 운송, 복원, 액자, 촬영 등의 부가 서비스를 대행해 드립니다(추가 비용 발생).</p>
				                    </div>
				                </div>
				                <div class="board">
				                    <div class="Title">
				                        <div class="vertical-line"></div>
				                        <p>보관료</p>
				                    </div>
				                    <div class="content">
				                        <p>· 1년단위로 위탁보관 계약서를 작성하며, 작품가의 3% 보관료를 받습니다.</p>
				                    </div>
				                </div>
				                <div class="board">
				                    <div class="Title">
				                        <div class="vertical-line"></div>
				                        <p>보관절차</p>
				                    </div>
				                    <div class="content2">
				                        <div class="step1 box">
				                            <p>Lupin 작품 운송</p>
				                        </div>
				                        <div class="nextIcon">
				                            <i class="fa-solid fa-chevron-right"></i>
				                        </div>
				                        <div class="step2 box">
				                            <p>담당자 사진 및 동영상으로</p>
				                            <p>작품 입고상태 기록</p>
				                        </div>
				                        <div class="nextIcon">
				                            <i class="fa-solid fa-chevron-right"></i>
				                        </div>
				                        <div class="step3 box">
				                            <p>미술품 위탁보관계약서 작성</p>
				                        </div>
				                        <div class="nextIcon">
				                            <i class="fa-solid fa-chevron-right"></i>
				                        </div>
				                        <div class="step4 box">
				                            <p>작품보관</p>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>

                    <%@ include file="footer.jsp" %>

        </body>

        </html>
        <script>

        </script>