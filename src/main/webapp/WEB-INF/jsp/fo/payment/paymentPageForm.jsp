<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EarthBall</title>
    <!-- 결제api script -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

    <!-- 주소 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <!-- 공통코드 -->
    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>

    <!-- css -->
    <link rel="stylesheet" href="/resources/fo/css/payment/paymentPageForm.css">
</head>
<body>


<!-- js -->
<script type="text/javascript"
        src="/resources/fo/js/payment/paymentPageForm.js"></script>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

<div id="container">
    <div id="title">
        <div id="title_1">
            <div id="bar_1"></div>
            <div id="title_text">결제하기</div>
        </div>
    </div>

    <div id="content">
        <div id="content1">
            <div id="content1_1">
                <div id="content1_1_1">
                    <h2 style="margin : 0px 0px 0px 20px;">주문 상품 정보</h2>
                    <div id="bar_2"></div>
                </div>

                <c:set var="totalPrice" value="0" />
                <input type="hidden" id="itemAmount" value="${ amount }">

                <c:forEach items="${ orderList }" var="ol">
                	<div id="content1_1_2">
                    <div id="img-area">
                        <div id="product_img"><img src="/resources/fo/upfiles/${ ol.changerName }" width="100%" height="100%"
                                                   alt="상품이미지"></div>
                    </div>
                    <div id="product_content">
                        <div id="product_name"><span class="product_name">${ ol.productName }</span></div>
                        <c:choose>
                        	<c:when test="${ amount ne null }">
                        		<div id="product_amount"><p>수량 : ${ amount }개</p></div>
                        		<div id="product_price"><p><fmt:formatNumber value="${ ol.price * amount }" pattern="###,###원"/></p></div>
                        	</c:when>
                        	<c:otherwise>
                        		<div id="product_amount"><p>수량 : ${ ol.amount }개</p></div>
		                        <div id="product_price"><p><fmt:formatNumber value="${ ol.price * ol.amount }" pattern="###,###원"/></p></div>
                        	</c:otherwise>
                        </c:choose>
                    </div>
                </div>
				<c:choose>
                   	<c:when test="${ amount ne null }">
                   		<c:set var="totalPrice" value="${ ol.price * amount }" />
                   	</c:when>
                   	<c:otherwise>
                		<c:set var="totalPrice" value="${ totalPrice + (ol.price * ol.amount) }" />
                   	</c:otherwise>
                   </c:choose>
                </c:forEach>
				<input type="hidden" id="orderList" value="${ orderList }">
            </div>
            <div id="content1_2">
                <div id="content1_2_1">
                    <h2 style="margin : 0px 0px 0px 20px;">주문자 정보</h2>
                    <div id="bar_2"></div>
                </div>
                <div id="content1_2_2">
                <input class="sessionMemberId" type="hidden" value="${sessionScope.loginUser.memberId}">
                    <table>
                        <tr>
                            <th>이름</th>
                            <td id="name">${ loginUser.memberName }</td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td id="phone">${ loginUser.phone }</td>
                        </tr>
                        <tr>
                            <th>E-mail</th>
                            <td id="email">${ loginUser.email }</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="content1_3">
                <div id="content1_3_1">
                    <h2 style="margin : 0px 0px 0px 20px;">배송지 정보</h2>
                    <div id="bar_2"></div>
                </div>
                <div id="content1_3_2">
                    <table>
                        <tr>
                            <td colspan="2">
                                <input type="checkbox" id="sameOrderUser">
                                <label for="sameOrderUser" style="font-size : 14px; font-weight : 600;"> 주문자 정보와 동일</label>
                            </td>
                        </tr>
                        <tr>
                            <td width="240"><input type="text" id="receiveName" placeholder="수령인" required></td>
                            <td><input type="number" id="receivePhone" placeholder="연락처 (- 제외)" required></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="number" id="postCode" placeholder="우편번호" width="50%" required>
                                <input type="button" id="selectAddress" onclick="addressAPI();" value="주소찾기">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="text" id="address1" placeholder="주소" required>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="text" id="address2" placeholder="상세주소" required>
                            </td>
                        </tr>
                    </table>
                    <div id="content1_3_3">
                        <span style="font-size : 20px; font-weight : bold; margin : 30px 0px 20px 25px;">배송메모</span>
                        <div id="deliveryMemo">
                            <select id="deliveryComment">
                                <option value="없음">배송메모를 선택해주세요.</option>
                                <option>배송 전에 미리 연락 바랍니다.</option>
                                <option>부재 시 경비실에 맡겨 주세요.</option>
                                <option>부재 시 전화 주시거나 문자 남겨주세요.</option>
                                <option>문 앞에 놓고 문자해주세요.</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div id="content1_4">
                <div id="content1_4_1">
                    <h2 style="margin : 0px 0px 0px 20px;">포인트</h2>
                    <div id="bar_2"></div>
                </div>
                <div id="content1_4_2">
                    <table>
                        <tr>
                            <td>
                                <input type="number" id="point" value="0">
                                <input type="hidden" id="realPoint" value="${ loginUser.totalPoint }">
                                <input type="button" class="point-btn" id="pointAll" data-state="Y" value="전액사용">
                                <input type="button" class="point-btn" id="pointCancel" data-state="N" style="display : none;" value="사용취소">
                            </td>
                        </tr>
                        <tr>
                            <td style="padding : 5px 0px;">
                                <span>보유포인트</span>
                                <span id="myPoint" style="font-size : 14px; font-weight : bold;">${ loginUser.totalPoint }</span>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div id="content2">
            <div id="content2_1">
                <div id="content2_1_1">
                    <h2 style="margin : 0px 0px 5px 20px;">주문 요약</h2>
                    <div id="bar_2"></div>
                </div>
                <div id="content2_1_2">
                    <table>
                        <tr>
                            <td class="orderSummaryName">상품가격</td>
                            <td class="orderSummaryContent">
                            	<p id="totalProductPrice"><fmt:formatNumber value="${ totalPrice }" pattern="###,###원"/></p>
                            	<input type="hidden" id="realProductPrice" value="${ totalPrice }">
                            </td>
                        </tr>
                        <tr>
                            <td class="orderSummaryName">배송비</td>
                            <td class="orderSummaryContent">3,000원</td>
                        </tr>
                        <tr>
                        	<td class="orderSummaryName">할인금액</td>
                        	<td class="orderSummaryContent">
                        		<p id="usePoint"><fmt:formatNumber pattern="###,###">0</fmt:formatNumber>원</p>
                        	</td>
                        </tr>
                        <tr id="orderSummaryTotal-area">
                            <td class="orderSummaryTotal">총 주문금액</td>
                            <td style="padding-right : 20px;">
                            	<p class="totalPrice"><fmt:formatNumber pattern="###,###">${ totalPrice + 3000 }</fmt:formatNumber>원</p> <!-- ${ totalPrice } -->
                            	<input type="hidden" id="realTotalPrice" value="${ totalPrice + 3000 }">
                            </td>
                        </tr>
                    </table>
                </div>

                <form id="payCompleteForm" action="payComplete.pa" method="post">
                	<input type="hidden" name="paymentNo" value="">
                </form>

                <div id="content2_1_3">
                    <div>
                        <c:choose>
                        	<c:when test="${ loginUser.gradeName eq 'RED' }">
                        		<span class="rewardPoint" style="color : #19A7CE">
                        			<fmt:formatNumber pattern="###,###">${ totalPrice * 0.01 }</fmt:formatNumber>
                        			<input type="hidden" id="rewardPoint" value="${ totalPrice * 0.01 }">
                        		</span>
                        	</c:when>
                        	<c:when test="${ loginUser.gradeName eq 'ORANGE' }">
                        		<span class="rewardPoint" style="color : #19A7CE">
                        			<fmt:formatNumber pattern="###,###">${ totalPrice * 0.03 }</fmt:formatNumber>
                        			<input type="hidden" id="rewardPoint" value="${ totalPrice * 0.03 }">
                        		</span>
                        	</c:when>
                        	<c:when test="${ loginUser.gradeName eq 'GREEN' }">
                        		<span class="rewardPoint" style="color : #19A7CE">
                        			<fmt:formatNumber pattern="###,###">${ totalPrice * 0.05 }</fmt:formatNumber>
                        			<input type="hidden" id="rewardPoint" value="${ totalPrice * 0.05 }">
                        		</span>
                        	</c:when>
                        	<c:otherwise>
                        		<span class="rewardPoint" style="color : #19A7CE">
                        			<fmt:formatNumber pattern="###,###">${ totalPrice * 0.1 }</fmt:formatNumber>
                        			<input type="hidden" id="rewardPoint" value="${ totalPrice * 0.1 }">
                        		</span>
                        	</c:otherwise>
                        </c:choose>
                        <span> 포인트 적립 예정</span>
                    </div>
                </div>
            </div>
            <div id="content2_2">
                <div id="content2_2_1">
                    <h2 style="margin : 0px 0px 0px 20px;">결제 수단</h2>
                    <div id="bar_2"></div>
                </div>
                <div id="content2_2_2">
                    <div>
                        <input type="radio" id="credit" name="pay" value="KGinisis" checked>
                        <label for="credit">신용카드</label>
                    </div>
                    <div>
                        <input type="radio" id="kakao" name="pay" value="kakaopay">
                        <label for="kakao">카카오페이</label>
                    </div>
                    <div>
                        <input type="radio" id="naver" name="pay" value="naverpay" disabled>
                        <label for="naver">네이버페이 (연동중)</label>
                    </div>
                </div>
                <div id="content2_2_3">
                    <input type="button" id="payComplete" onclick="orderPay();" value="결제하기">
                </div>
            </div>
        </div>
    </div>
</div>

<script>

	$(function() {

		$("#sameOrderUser").click(function() {
			var same = this.checked;
			$("#receiveName").val(same ? "${ loginUser.memberName }" : "");
			$("#receivePhone").val(same ? "${ loginUser.phone }" : "");
			$("#postCode").val(same ? "${ loginUser.postCode }" : "");
			$("#address1").val(same ? "${ loginUser.address1 }" : "");
			$("#address2").val(same ? "${ loginUser.address2 }" : "");
		});
	});
</script>

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>

</body>
</html>