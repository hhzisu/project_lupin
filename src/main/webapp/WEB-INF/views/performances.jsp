<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>전시회</title>
            <link rel="stylesheet" href="css/default.css">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/exhibition.css">
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
            <script src="js/index.js"></script>
        </head>

        <style>
            .exhibitionContainer {
                display: flex;
                justify-content: center;
                width: 100%;
            }

            .exhibitionContent {
                display: flex;
                flex-direction: column;
                justify-content: center;
                width: 1440px;
            }

            .headBox {
                margin-top: 90px;
                margin-bottom: 60px;
                width: 100%;
                /* display: flex;
	flex-direction: column; */
            }

            .exhibitionBox {
                display: flex;
                flex-wrap: wrap;
                gap: 30px;
                justify-content: center;
            }

            .box {
                width: calc(20% - 30px);
                /* 한 줄에 5개씩 표시되도록 설정 */
                height: 440px;
            }


            .boxWrap1,
            .boxWrap2,
            .boxWrap3,
            .boxWrap4 {
                display: flex;
                gap: 60px;
            }

            .boxText {
                width: 240px;
            }

            .boxText .boxTitle {
                margin-top: 16px;
                margin-left: 12px;
                font-size: 18px;
            }

            .boxText .boxLocation {
                font-size: 15px;
                margin-top: 8px;
                margin-left: 12px;
            }

            .boxText .boxDate {
                font-size: 15px;
                margin-left: 12px;
                color: #999;
            }

            .boxImg a img {
                width: 240px;
                height: 320px;
            }
        </style>

        <body>

            <%@ include file="header.jsp" %>

                <div class="exhibitionContainer">
                    <div class="exhibitionContent">
                        <div class="headBox">
                            <h1 class="head">전시회 안내</h1>
                        </div>
                        <div class="exhibitionBox">
                            <c:forEach var="performance" items="${performances}">
                                <div class="box">
                                    <div class="boxImg">
                                        <a href="${performance.thumbnail}">
                                            <img src="${performance.thumbnail}" alt="">
                                        </a>
                                    </div>
                                    <div class="boxText">
                                        <div class="boxTitle">
                                            <p>${performance.title}</p>
                                        </div>
                                        <div class="boxLocation">
                                            <p>${performance.place}</p>
                                        </div>
                                        <div class="boxDate">
                                            <p>${performance.startDate} ~ ${performance.endDate}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                    </div>
                </div>

                <%@ include file="footer.jsp" %>

        </body>

        </html>
        <script>

        </script>