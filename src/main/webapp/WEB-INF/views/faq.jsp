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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/faq.css">
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/snsMain.css"> -->
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

    <div class="faqContainer">
        <div class="faqContent">
            <div class="headbox">
                <h1 class="head">FAQ</h1>
                <!-- <hr class="headLine"> -->
            </div>
            <div class="faqtabWrap">
                <div class="tab active userInfo">개인정보</div>
                <div class="tab auction">경매</div>
                <div class="tab commission">위탁</div>
                <div class="tab pay">결제/배송</div>
                <div class="tab etc">기타</div>
            </div>
            <div class="userDataWrap active">
                <div class="accordion_area top">
                    <button class="btn btn_toggle">
                        <i class="fa-solid fa-q fa-xl" style="color: #000000;"></i>
                        <div class="accordionTitle">
                            휴대폰 인증번호가 오지 않을 때 어떻게 하나요?
                        </div>
                    </button>
                    <div class="content_area">
                        <i class="fa-solid fa-a fa-xl"></i>
                        <pre>
                            1. 휴대폰 번호 입력칸에 번호를 정확히 등록했는지 확인

                            2. 스팸 및 차단문자 확인
                            
                            [삼성 갤럭시 단말기 기준]
                            
                            메시지 앱 → 설정 → 전화번호 및 스팸 차단 → 차단 메시지 → 번호 차단해제
                        </pre>
                    </div>
                </div>
                <div class="accordion_area">
                    <button class="btn btn_toggle">
                        <i class="fa-solid fa-q fa-xl" style="color: #000000;"></i>
                        <div class="accordionTitle">
                            문의하려면 어떻게 해야하나요?
                        </div>
                    </button>
                    <div class="content_area">
                        <i class="fa-solid fa-a fa-xl"></i>
                        <pre>
                            1. 홈페이지 1:1 문의
                            로그인 후 고객지원의 1:1 문의를 이용하시면, 답변을 드리고 있습니다.

                            2. 전화문의
                            대표전화 1544-1544로 문의 주시면, 문의 사항에 따른 답변을 드리고 있습니다.
                        </pre>
                    </div>
                </div>
                <div class="accordion_area bottom">
                    <button class="btn btn_toggle">
                        <i class="fa-solid fa-q fa-xl" style="color: #000000;"></i>
                        <div class="accordionTitle">
                            환불 절차가 어떻게 진행되나요?
                        </div>
                    </button>
                    <div class="content_area">
                        <i class="fa-solid fa-a fa-xl"></i>
                        <pre>
                            * 가입 직후 - 1개월 미만 : 전액 환불
                            * 1개월 이상 - 3개월 미만 : 80% 환불
                            * 3개월 이상 - 6개월 미만 : 60% 환불
                            * 가입 후 6개월 이상 : 환불 미진행
                        </pre>
                    </div>
                </div>
            </div> <!-- userDataWrap 종료 -->
            <div class="auctionWrap">
                <div class="accordion_area top">
                    <button class="btn btn_toggle">
                        <i class="fa-solid fa-q fa-xl" style="color: #000000;"></i>
                        <div class="accordionTitle">
                            경매 응찰을 하고 싶습니다.
                        </div>
                    </button>
                    <div class="content_area">
                        <i class="fa-solid fa-a fa-xl"></i>
                        <pre>
                            경매 응찰 방법은 전화응찰과 서면응찰, 현장에서 직접 응찰하는 방법이 있습니다.

                            1. 응찰 신청서는 프리뷰 기간 동안 전시장에서 신청 하실 수도 있고, 홈페이지에서도 응찰 신청이 가능합니다.
                               정회원으로 가입하시면 응찰 권한이 주어지며, 특히 홈페이지에서는 정회원 가입이 완료되면, 바로 전화응찰 또는 서면응찰을 편안하게 하실 수 있습니다.
                            2. 응찰 기간은 프리뷰 오픈일부터 입니다.
                            3. 응찰 마감은 종이서류(팩스)는 경매 전일 오후7시까지, 홈페이지에서 응찰신청은 경매 전일까지 접수해주시기 바랍니다.
                            4. 현장 응찰을 희망하는 회원께서는 좌석과 패들을 미리 전화 예약하시기 바랍니다.
                        </pre>
                    </div>
                </div>
                <div class="accordion_area">
                    <button class="btn btn_toggle">
                        <i class="fa-solid fa-q fa-xl" style="color: #000000;"></i>
                        <div class="accordionTitle">
                            온라인 경매 응찰시 주의사항은 무엇인가요?
                        </div>
                    </button>
                    <div class="content_area">
                        <i class="fa-solid fa-a fa-xl"></i>
                        <pre>
                            1. 경매 마감시간 30초 전에 응찰이 있으면, 자동으로 30초 연장됩니다.

                            2. 동의 절차를 거친 뒤 응찰이 가능하므로, 응찰 전 휴대폰 번호 인증 완료가 필요합니다.

                            3. 동일 금액의 응찰이 발생하면 서버시각에 따라 먼저 응찰금액을 입력하신 분에게 우선순위가 주어집니다.

                            4. 자동응찰 > 1회응찰 순으로 낙찰 기회가 주어집니다.
                        </pre>
                    </div>
                </div>
                <div class="accordion_area bottom">
                    <button class="btn btn_toggle">
                        <i class="fa-solid fa-q fa-xl" style="color: #000000;"></i>
                        <div class="accordionTitle">
                            응찰을 잘못 눌렀어요. 철회가 가능한가요?
                        </div>
                    </button>
                    <div class="content_area">
                        <i class="fa-solid fa-a fa-xl"></i>
                        <pre>
                            응찰 및 낙찰은 취소가 불가능합니다.

                            부득이하게 낙찰 철회 시 낙찰가의 30%에 해당하는 낙찰철회비가 부가되오니 신중히 응찰 바랍니다.
                        </pre>
                    </div>
                </div>
            </div> <!-- auctionWrap 종료 -->
            <div class="commissionWrap">
                <div class="accordion_area bottom top">
                    <button class="btn btn_toggle">
                        <i class="fa-solid fa-q fa-xl" style="color: #000000;"></i>
                        <div class="accordionTitle">
                            위탁은 어떻게 하나요?
                        </div>
                    </button>
                    <div class="content_area">
                        <i class="fa-solid fa-a fa-xl"></i>
                        <pre>
                            1. 고객님 성함
                            2. 연락처
                            3. 작가 이름
                            4. 작품 제목
                            5. 사이즈 / 재질 / 제작년도
                            6. 소장경위
                            7. 작품사진 - 전체컷, 싸인 등의 부분컷(중요부분)


                            위탁 문의로 위 내용을 보내주시면, 작품별 스페셜리스트에게 전달되어 답변 드리겠습니다.

                            자세한 내용은 위탁안내 페이지를 참고 해주시기 바랍니다
                        </pre>
                    </div>
                </div>
            </div> <!-- commissionWrap 종료 -->
            <div class="payWrap">
                <div class="accordion_area top">
                    <button class="btn btn_toggle">
                        <i class="fa-solid fa-q fa-xl" style="color: #000000;"></i>
                        <div class="accordionTitle">
                            작품별 구매수수료 및 구매가격은 어떻게 되나요?
                        </div>
                    </button>
                    <div class="content_area">
                        <i class="fa-solid fa-a fa-xl"></i>
                        <pre>
                            온라인 경매 수수료는 일괄 18%(부가세 별도) 입니다.

                            낙찰가와 수수료를 포함한 금액이 총 구매금액입니다.


                            * 낙찰가 : 경매 낙찰금액

                            * 구매가 : 낙찰가+수수료+부가세 합산 금액   
                        </pre>
                    </div>
                </div>
                <div class="accordion_area">
                    <button class="btn btn_toggle">
                        <i class="fa-solid fa-q fa-xl" style="color: #000000;"></i>
                        <div class="accordionTitle">
                            양도소득세란?
                        </div>
                    </button>
                    <div class="content_area">
                        <i class="fa-solid fa-a fa-xl"></i>
                        <pre>
                            개인이 서화(書畵), 골동품을 양도할 때, 양도가액이 6천만원 이상인 경우 양도소득세가 부과됩니다.
                            양도가액이 6천만원 이상이더라도 양도일 현재 생존해 있는 국내 원작자의 작품 양도로 발생하는 소득, 문화재 보호법에 따라 국가 지정문화재로 지정된 
                            서화(書畵), 골동품의 양도로 발생하는 소득, 박물관 또는 미술관에 양도함으로써 발생하는 소득에 대해서는 양도소득세가 부과되지 않습니다.
                        </pre>
                    </div>
                </div>
                <div class="accordion_area">
                    <button class="btn btn_toggle">
                        <i class="fa-solid fa-q fa-xl" style="color: #000000;"></i>
                        <div class="accordionTitle">
                            현금영수증 발행이 가능한가요?
                        </div>
                    </button>
                    <div class="content_area">
                        <i class="fa-solid fa-a fa-xl"></i>
                        <pre>
                            현금영수증은 수수료분과 과세만 발행되고 낙찰 금액은 비과세로 발행이 가능합니다.
                        </pre>
                    </div>
                </div>
                <div class="accordion_area">
                    <button class="btn btn_toggle">
                        <i class="fa-solid fa-q fa-xl" style="color: #000000;"></i>
                        <div class="accordionTitle">
                            낙찰작은 어떻게 받을 수 있나요?
                        </div>
                    </button>
                    <div class="content_area">
                        <i class="fa-solid fa-a fa-xl"></i>
                        <pre>
                            낙찰작은 직접 작품 수령을 원칙으로 합니다.

                            전일 방문 예약제로 운영하오니, 희망 수령일 하루 전까지 담당자와 방문 일자를 필히 예약바랍니다.
                        </pre>
                    </div>
                </div>
                <div class="accordion_area bottom">
                    <button class="btn btn_toggle">
                        <i class="fa-solid fa-q fa-xl" style="color: #000000;"></i>
                        <div class="accordionTitle">
                            낙찰 받은 작품 배송 시, 액자도 함께 오나요?
                        </div>
                    </button>
                    <div class="content_area">
                        <i class="fa-solid fa-a fa-xl"></i>
                        <pre>
                            프리뷰 기간에 전시한 그대로 작품이 배송됩니다.

                            응찰은 작품 컨디션 확인 후 진행되는 것을 전제로 하며, 작품 컨디션에 액자 상태는 포함되지 않습니다.
                        </pre>
                    </div>
                </div>
            </div> <!-- payWrap 종료 -->
            <div class="etcWrap">
                <div class="accordion_area top">
                    <button class="btn btn_toggle">
                        <i class="fa-solid fa-q fa-xl" style="color: #000000;"></i>
                        <div class="accordionTitle">
                            고미술품의 수출·입에 대해 궁금합니다.
                        </div>
                    </button>
                    <div class="content_area">
                        <i class="fa-solid fa-a fa-xl"></i>
                        <pre>
                            경매물품은 대한민국의 수출 관련 법령 및 관련국의 수입 관련 법령에 의한 제한을 받을 수 있습니다.
                            경매물품의 해외반출,반입에 필요한 허가를 취득해야 할 책임은 낙찰자에게 있습니다. 특히, 한국의 문화재 및 유물 등으로 추정되는 경매물품의 
                            응찰 시에는 한국의 문화재보호법에 따라 문화재 및 유물 등은 국외로 수출 또는 반출이 금지되어 있으므로 응찰자는 이 점을 충분히 숙지하고 응찰 및 낙찰에 임해야 합니다.
                        </pre>
                    </div>
                </div>
                <div class="accordion_area bottom">
                    <button class="btn btn_toggle">
                        <i class="fa-solid fa-q fa-xl" style="color: #000000;"></i>
                        <div class="accordionTitle">
                            경매와 전시 가능한가요?
                        </div>
                    </button>
                    <div class="content_area">
                        <i class="fa-solid fa-a fa-xl"></i>
                        <pre>
                            Lupin의 경매와 전시는 무료 관람으로 입찰 여부와 상관없이 경매 구경이 가능합니다.
                            경매와 전시 날짜는 홈페이지를 통해 확인하실 수 있습니다.

                            응찰을 원하실 경우, 홈페이지를 참고하시거나 문의해주시면 안내해 드리겠습니다.
                        </pre>
                    </div>
                </div>
            </div> <!-- etcWrap 종료 -->
        </div>
    </div>

    <%@ include file="footer.jsp" %> 

</body>
</html>
<script>
    function bindingAccordionEvent(wrap) {
        let areaArr = document.querySelectorAll(wrap);

        areaArr.forEach(function (area) {
            let hasGroup = area.dataset['group'] !== undefined ? true : false;
            let btn = area.querySelector('.btn_toggle');

            btn.addEventListener('click', function () {
                if (hasGroup === true) {
                    let name = area.dataset['group'];
                    let groupArr = document.querySelectorAll(wrap + '[data-group="' + name + '"]');
                    let thisContent = area.querySelector('.content_area');

                    groupArr.forEach(function (group) {
                        let content = group.querySelector('.content_area');
                        content.classList.remove('act');
                    });
                    thisContent.classList.add('act');
                } else {
                    let content = area.querySelector('.content_area');
                    content.classList.toggle('act');
                }
            });
        });
    }

    bindingAccordionEvent('.accordion_area');
</script>

<script>
    $(document).ready(function () {
        $('.tab').click(function () {
            $('.tab').removeClass('active');
            $(this).addClass('active');

            // 모든 섹션을 숨기고 클릭된 탭에 해당하는 섹션만 보이기
            $('.userDataWrap, .auctionWrap, .commissionWrap, .payWrap, .etcWrap').removeClass('active');

            // 클래스 이름을 이용해 해당 섹션을 보이게 처리
            if ($(this).hasClass('userInfo')) {
                $('.userDataWrap').addClass('active');
            } else if ($(this).hasClass('auction')) {
                $('.auctionWrap').addClass('active');
            } else if ($(this).hasClass('commission')) {
                $('.commissionWrap').addClass('active');
            } else if ($(this).hasClass('pay')) {
                $('.payWrap').addClass('active');
            } else if ($(this).hasClass('etc')) {
                $('.etcWrap').addClass('active');
            }
        });
    });
</script>