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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

    <%@ include file="header.jsp" %>
    <%@ include file="sidebar.jsp" %>

    <div class="pageFixSize">
        <div class="userInfo">
            <div class="userNav">
                <h3 class="navUserName">나성엽 님</h3>
                <ul>
                    <li><a href="userInfo" style="color: black; font-weight: 700;">회원정보관리</a></li>
                    <li><a href="userBidList">응찰 내역</a></li>
                    <li><a href="userBuyList">결제/구매 내역</a></li>
                    <li><a href="userCommissionList">위탁 문의 내역</a></li>
                    <li><a href="userQuestionList">1:1 문의 내역</a></li>
                    <li><a href="userWishList">위시 리스트</a></li>
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
                    <!-- <div class="ManageDiv userId">
                        <h4 class="requiredInfo">아이디</h4>
                        <input type="text" value="fgghk132" readonly>
                        <h5 class="certifiedUser">인증회원</h5>
                    </div> -->
                    <!-- <div class="ManageDiv userPassword">
                        <h4 class="requiredInfo">비밀번호</h4>
                        <input type="password" value="asdasd1!">
                        <button>변경하기</button>
                    </div> -->
                    <div class="ManageDiv userName">
                        <h4 class="requiredInfo">이름</h4>
                        <div>${loginUser.name}</div>
                        <!-- <input type="text" value="나성엽" readonly> -->
                        <h5 class="certifiedUser">인증회원</h5>
                    </div>
                    <div class="ManageDiv userEmail">
                        <h4 class="requiredInfo">이메일</h4>
                        <div>${loginUser.email}</div>
                        <!-- <input type="text" value="fgghk132@naver.com" readonly> -->
                        <!-- <button>수정하기</button> -->
                    </div>
                    <div class="ManageDiv userPhoneNum">
                        <h4 class="requiredInfo">전화번호</h4>
                        <div>${loginUser.mobile}</div>
                        <!-- <input type="text" value="010-1111-2222" readonly> -->
                        <!-- <button>수정하기</button> -->
                    </div>
                    <div class="ManageDiv userBirth">
                        <h4 class="requiredInfo">생년월일</h4>
                        <div>${loginUser.birthyear}-${loginUser.birthday}</div>
                        <!-- <input type="text" value="1999.03.14" readonly> -->
                        <!-- <button>수정하기</button> -->
                    </div>
                    <div class="ManageDiv userSex">
                        <h4>성별</h4>
                        <div>
                            <c:choose>
                                <c:when test="${loginUser.gender == 'M'}">
                                    남자
                                </c:when>
                                <c:when test="${loginUser.gender == 'F'}">
                                    여자
                                </c:when>
                                <c:otherwise>
                                    성별 정보 없음
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <!-- <input type="checkbox" value="남자">
                        <h5>남자</h5>
                        <input type="checkbox" value="여자">
                        <h5>여자</h5> -->
                    </div>
                    <div class="ManageDiv userAddr">
                        <h4 class="requiredInfo">주소</h4>
                        <form id="addressForm" action="updateInfo" method="POST">
                            <input type="hidden" value="${loginUser.username}" name="username">
                            <div class="addrBigRow">
                                <div class="addrRow">
                                    <input id="postcode" class="userAddrInput" type="text" value="${loginUser.postcode}" placeholder="우편번호" name="postcode">
                                    <button type="button" class="addrSearchBtn" onclick="DaumPostcode()">주소검색</button>
                                </div>
                                <div id="showAddr" class="showAddr">
                                    <h5 id="roadAddressDisplay">${loginUser.roadAddress}</h5>
                                    <input id="roadAddress" type="hidden" value="${loginUser.roadAddress}" name="roadAddress">
                                </div>
                                <input class="userAddrDetail" type="text" value="${loginUser.detailAddress}" placeholder="상세주소" name="detailAddress">
                            </div>
                        </form>
                    </div>
                    <!-- <div class="ManageDiv userdelivAddr">
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
                            <div class="showAddr">
                                <h5>부산 부산진구 범양로 1</h5>
                            </div>
                            <input class="userAddrDetail" type="text" value="2동 201호">
                        </div>
                    </div> -->
                </div>
                <!-- userInfoManage 끝 -->
                <hr>
                <div class="userInfoBtns">
                    <button class="updateUserInfo" onclick="submitAddressForm()">주소수정</button>
                    <!-- <button class="removeUser">회원탈퇴</button> -->
                </div>
                <!-- <h5 class="warningRemove" style="color: red;">*탈퇴 시 삭제된 정보는 복구될 수 없습니다.</h5> -->
            </div>
            <!-- userInfoInfo 끝 -->
        </div>
        <!-- userInfo 끝 -->
    </div>

    <%@ include file="footer.jsp" %> 

</body>
</html>
<script>
    $(document).ready(function() {
        var roadAddress = "${loginUser.roadAddress}";
        
        // loginUser.roadAddress 값이 있으면 display: block
        if (roadAddress) {
            document.getElementById("showAddr").style.display = "block";
        } else {
            document.getElementById("showAddr").style.display = "none";
        }
    });

    
    function submitAddressForm() {
        document.getElementById('addressForm').submit(); // 주소 폼 제출
    }


    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                // 참고항목이 있을 경우 괄호로 추가
                if (extraRoadAddr !== '') {
                    roadAddr += ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 도로명 주소를 필드와 <h5> 태그에 넣음
                document.getElementById('postcode').value = data.zonecode;

                // 도로명 주소를 <h5> 태그에 표시
                document.getElementById("roadAddressDisplay").innerText = roadAddr;
                document.getElementById("roadAddress").value = roadAddr;

                // 도로명 주소 div 보이게 설정
                document.getElementById("showAddr").style.display = "block";
            }
        }).open();
    }
</script>
