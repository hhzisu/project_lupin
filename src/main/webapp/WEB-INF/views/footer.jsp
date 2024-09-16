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
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/snsMain.css"> -->
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<style>
    :root 
{
	/* 컬러 모음 */
	--color-black: #111;
	--color-white: #fff;
	--color-gray: #787878;
	--input-gray: #e5e5ec;
	--button-gray: #f7f7f7;
	--border-color-gray: #dadada;
	--color-deepblue: #17517e;
	--color-burgundy: #800020;
	--font-size32: 32px;
	--font-size24: 24px;
	--font-size20: 20px;
	--font-size16: 16px;
	--font-size14: 14px;
	--font-size12: 12px;
}

/* Footer */
footer 
{
	margin-top: 100px;
	padding:50px 0;
	border-top: 1px solid var(--border-color-gray);
    background-color: var(--color-black);
    color: var(--color-white);
}

.footerInner 
{
    margin:0 auto;
	max-width: 1440px;
	display: flex;    
    justify-content: space-between;
}

.footerInner .logoBox
{
    width: 130px;
    /* background-color: white; */
    height: 60px;
}

.footerInner .logoBox a img
{
    width: 130px;
    /* background-color: white; */
    height: 60px;
}

.footerInner .left_conWrap 
{
	width: 57%;
}

.footerInner .left_conWrap .textWrap 
{
	font-size: var(--font-size14);
	line-height: 24px;
} 

.footerInner .right_conWrap 
{
	text-align: right;
}

.footerInner .right_conWrap .textWrap 
{
	font-size: var(--font-size14);
	line-height: 24px;
}

.footerInner .right_conWrap h3
{
	font-size:var(--font-size24);
	font-weight: 500;
	margin-bottom: 20px;
}

.footerInner.footerT
{
    font-size: var(--font-size12);
    margin-top: 20px;
    line-height: 1.5;
}
</style>
<body>
    
    <footer>
	    <div class="footerInner">
            <div class="logoBox">
                <h5 class="logo">
                    <a href="#">
                        <img src="images/logo2.png" alt="#">
                    </a>
                </h5>
            </div>
	        <div class="left_conWrap f_conWrap">
	            <p class="textWrap">
	                (주) 루팡<br>
	                부산광역시 부산진구 중앙대로 123<br>
	                사업자등록번호 : 123-45-67890 / 통신판매업신고번호 : 제 5252-12345호<br>
	                이메일 : abcde@gmail.com
	            </p>
                <p class="footerInner footerT">
                    (주)루팡이 매도인인 경우를 제외하고, 사이트상의 모든 상품 및 거래에 대하여 (주)루팡은 통신판매중개자이며 통신판매의 당사자가 아닙니다.
                    따라서 (주)루팡은 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다. 루팡 웹사이트의 콘텐츠(이미지/문자/영상/화면 등)에 대한 무단 복제, 배포, 전송, 게시, 크롤링/스크래핑 등 행위는 저작권법, 부정경쟁방지 및 영업비밀보호에 관한 법률 등 관련 법령에 의하여 금지됩니다.
                </p>
	        </div>
	        <div class="right_conWrap f_conWrap">
                <h3>1234-5678</h3>
	            <p class="textWrap">                        
                    오전 9시 ~ 오후 6시(토요일, 공휴일 휴무)<br>
                    Copyright ⓒ RUPIN. All Rights Reserved
	            </p>
	        </div>
	    </div>
    </footer>

</body>
</html>
<script>

</script>

