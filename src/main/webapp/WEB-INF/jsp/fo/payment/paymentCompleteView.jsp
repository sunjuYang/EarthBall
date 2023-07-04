<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 완료</title>
    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
    <!-- css -->
    <link rel="stylesheet" href="/resources/fo/css/payment/paymentCompleteView.css">

</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

<div id="container">
    <div id="title">
        <div id="title_1">
            <div id="title_text">결제가 완료되었습니다.</div>
        </div>
    </div>

    <div id="content">
        <div id="content1">
            <span id="paymentNo">주문번호 : ${ paymentNo }</span>
        </div>
        <div id="content2">
            <input type="button" id="goOrder" onclick="location.href='/list.myOrder?memberId=${loginUser.memberId}&currentPage=1'" value="내 주문목록으로">
            <input type="button" id="goMain" onclick="location.href='/main'" value="메인페이지로">
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>

</body>
</html>