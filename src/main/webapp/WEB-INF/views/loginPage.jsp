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
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
            <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/snsMain.css"> -->
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

                    <div class="main">
                        <div class="left">
                            <div class="loginContent1">
                                <div>"예술과 연결되세요"</div>
                            </div>
                            <div class="loginContent2">
                                <div>로그인하여 다양한 미술작품의 아름다움을 발견하세요.</div>
                                <div>TEL. 1544-1544</div>
                            </div>
                        </div>
                        <div class="right">
                            <div class="loginBox">
                                <div class="loginTitle">
                                    <div>Login</div>
                                </div>
                                <div class="loginButtons">
                                    <a href="/oauth2/authorization/naver">
                                        <div class="naverLogin">
                                            <i class="fa-solid fa-n" style="color: #ffffff; margin-right: 20px;"></i>
                                            <div class="naver" style="color: var(--color-white); font-weight: 900;">네이버 로그인</div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%@ include file="footer.jsp" %>

        </body>

        </html>
        <script>
        </script>