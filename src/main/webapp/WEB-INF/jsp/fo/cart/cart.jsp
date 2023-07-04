<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
    <link rel="stylesheet" href="/resources/fo/css/cart/cart.css?after">
    <script type="text/javascript" src="/resources/fo/js/cart/cart.js?after"></script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>


<div id="container">
	<div class="title">
		<div style="width: 8px; height: 35px; margin-right: 8px; background-color: #19a7ce"></div>
		<h1 style="margin: 0;">장바구니</h1>
	</div>
	<div class="list">

		<table class="cartList">

			<thead>
				<tr>
					<th width="50"><input type="checkbox" id="allCheck" onclick="allCheck();"></th>
					<th width="700">상품 정보</th>
					<th width="50">수량</th>
					<th>상품금액</th>
					<th>주문금액</th>
				</tr>
				<input type="hidden" id="memberId" value="${ loginUser.memberId }">
			</thead>
			<tbody>

			</tbody>
		</table>

	</div>

	<button class="deleteButton" onclick="deleteCart();">선택상품 삭제</button>

	<div class="orderArea">
		<div>총 주문 상품 <span></span>개</div>
		<div>
			<table class="priceInformation">
				<thead>
					<tr>
						<td><span class="productTotal"></span>원</td>
						<td>+</td>
						<td>3000원</td>
						<td>=</td>
						<td><span class="total"></span>원</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>상품금액</td>
						<td></td>
						<td>배송비</td>
						<td></td>
						<td>총 주문금액</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="buttonArea">
			<div><button onclick="order()">구매하기</button></div>
			<div><a href="list.pro">계속 쇼핑하기</a></div>
		</div>
		<!-- 주문 form -->
		<form action="payments.pa" method="post" class="order_form">

		</form>
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>

</body>
</html>