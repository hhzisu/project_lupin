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
        <style>
            .main {
                display: flex;
                justify-content: center;
                flex-direction: column;
                align-items: center;
            }
            .icon img {
                margin-top: 100px;
                width: 75px;
                height: 75px;
            }
            .loginHeader {
                margin-top: 20px;
                font-size: var(--font-size24);
                margin-bottom: 20px;
            }

            .loginBody {
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 10px;
            }

            .adminId,
            .adminPw {
                width: 220px;
                display: flex;
                justify-content: space-between;
            }

            .adminLoginBtn {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 220px;
                height: 35px;
                border: var(--color-black) 1px solid;
                border-radius: 5px;
                cursor: pointer;
                color: var(--color-white);
                background-color: var(--color-black);
                margin-top: 10px;
            }

            .adminLoginBtn:hover {
                border: var(--color-black) 1px solid;
                color: var(--color-black);
                background-color: var(--color-white);
            }
        </style>

        <body>

            <%@ include file="header.jsp" %>
                <%@ include file="sidebar.jsp" %>
                <div class="main">
                    <div class="icon">
                        <img src="images/admin.png" alt="">
                    </div>
                    <div class="content">
                        <div class="loginHeader">
                            <p>관리자 로그인</p>
                        </div>
                        <div class="loginBody">
                            <div class="adminId">
                                <p>ID</p>
                                <input type="text" class="adminLoginText">
                            </div>
                            <div class="adminPw">
                                <p>PW</p>
                                <input type="text" class="adminLoginText">
                            </div>
                            <div class="adminLoginBtn">
                                <p>로그인</p>
                            </div>
                        </div>
                    </div>
                </div>

                    <%@ include file="footer.jsp" %>

        </body>

        </html>
        <script>

        </script>