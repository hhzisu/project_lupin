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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userInfoStyle.css">
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

    <div class="pageFixSize">
        <div class="userInfo">
            <div class="userNav">
                <h3 class="navUserName">나성엽 님</h3>
                <ul>
                    <li><a href="#" style="color: black; font-weight: 700;">회원정보관리</a></li>
                    <li><a href="#">응찰 내역</a></li>
                    <li><a href="#">구매 내역</a></li>
                    <li><a href="#">위탁 문의 내역</a></li>
                    <li><a href="#">1:1 문의 내역</a></li>
                    <li><a href="#">위시 리스트</a></li>
                </ul>
            </div>
            <!-- userNav 끝 -->
            <div class="userInfoInfo">
                <div class="userInfoTitle">
                    <h3>회원정보관리</h3>
                </div>
                <hr>
                <div class="userInfoManage">
                    <h4 class="userClass">일반회원</h4>
                    <div class="ManageDiv userId">
                        <h4 class="requiredInfo">아이디</h4>
                        <input type="text" value="fgghk132" readonly>
                        <h5 class="certifiedUser">인증회원</h5>
                    </div>
                    <div class="ManageDiv userPassword">
                        <h4 class="requiredInfo">비밀번호</h4>
                        <input type="password" value="asdasd1!">
                        <button>변경하기</button>
                    </div>
                    <div class="ManageDiv userName">
                        <h4 class="requiredInfo">이름</h4>
                        <input type="text" value="나성엽" readonly>
                    </div>
                    <div class="ManageDiv userEmail">
                        <h4 class="requiredInfo">이메일</h4>
                        <input type="text" value="fgghk132@naver.com">
                        <button>수정하기</button>
                    </div>
                    <div class="ManageDiv userPhoneNum">
                        <h4 class="requiredInfo">전화번호</h4>
                        <input type="text" value="010-1111-2222">
                        <button>수정하기</button>
                    </div>
                    <div class="ManageDiv userBirth">
                        <h4 class="requiredInfo">생년월일</h4>
                        <input type="text" value="1999.03.14">
                        <button>수정하기</button>
                    </div>
                    <div class="ManageDiv userSex">
                        <h4>성별</h4>
                        <input type="checkbox" value="남자">
                        <h5>남자</h5>
                        <input type="checkbox" value="여자">
                        <h5>여자</h5>
                    </div>
                    <div class="ManageDiv userAddr">
                        <h4 class="requiredInfo">주소</h4>
                        <div class="addrBigRow">
                            <div class="addrRow">
                                <input class="userAddrInput" type="text" value="45578">
                                <button class="addrSearchBtn">주소검색</button>
                            </div>
                            <div class="showAddr">
                                <h5>부산 부산진구 범양로 1</h5>
                            </div>
                            <input class="userAddrDetail" type="text" value="2동 201호">
                        </div>
                    </div>
                    <div class="ManageDiv userdelivAddr">
                        <h4>배송지 주소</h4>
                        <div class="addrBigRow">
                            <div class="addrSameCheck">
                                <input type="checkbox" value="동일">
                                <h5>주소와 동일한 경우 체크</h5>
                            </div>
                            <div class="addrRow">
                                <input class="userAddrInput" type="text" value="">
                                <button class="addrSearchBtn">주소검색</button>
                            </div>
                            <input class="userAddrDetail" type="text" value="">
                        </div>
                    </div>
                </div>
                <!-- userInfoManage 끝 -->
                <hr>
                <button class="removeUser">회원탈퇴</button>
                <h5 class="warningRemove" style="color: red;">*탈퇴 시 삭제된 정보는 복구될 수 없습니다.</h5>
            </div>
            <!-- userInfoInfo 끝 -->
        </div>
        <!-- userInfo 끝 -->
    </div>

    <%@ include file="footer.jsp" %> 

</body>
</html>
<script>
</script>
