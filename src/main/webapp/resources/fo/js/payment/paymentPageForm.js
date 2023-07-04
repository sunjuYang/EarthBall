// 결제요청
 function orderPay() {

	let today = new Date();
	let year = today.getFullYear(); // 년도
	let month = ('0' + (today.getMonth() + 1)).slice(-2);;  // 월
	let date = ('0' + today.getDate()).slice(-2);  // 일
	let hours = ('0' + today.getHours()).slice(-2); // 시
	let minutes = ('0' + today.getMinutes()).slice(-2);  // 분
	let seconds = ('0' + today.getSeconds()).slice(-2);  // 초
	let milliseconds = ('0' + today.getMilliseconds()).slice(-2); // 밀리초
	let pg = "";
	let pay_method = "";
	let paymentNo = "" + year+month+date+hours+minutes+seconds+milliseconds;
	let paymentName = $(".product_name").html() + " 외";

	IMP.init("imp43570318"); // 가맹점 식별코드

	if($("#receiveName").val() != "" && $("#receivePhone").val() != "" && $("#postCode").val() != ""
		&& $("#address1").val() != "" && $("#address1").val() != "" && $("#address2").val() != "") {

		if($("input[name=pay]:checked").val() === "KGinisis") {

			pg = "html5_inicis.INIpayTest";
			pay_method = "card";

		} else if($("input[name=pay]:checked").val() === "kakaopay") {

			pg = "kakaopay.TC0ONETIME";
			pay_method = "kakaopay";

		}

		console.log($("#realTotalPrice").val());

		IMP.request_pay({
			pg: pg,
			pay_method: pay_method,
			merchant_uid: paymentNo,   // 주문번호
			name: paymentName,
			amount: $("#realTotalPrice").val(),                         // 숫자 타입
			buyer_email: $("#email").html(),
			buyer_name: $("#name").html(),
			buyer_tel: $("#phone").html(),
			buyer_addr: $("#address1").val() + " " + $("#address2").val(),
			buyer_postcode: $("#postCode").val(),
		}, function (rsp) { // callback
			//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
				console.log(rsp);

				// console.log("rep.success : " + rsp.success);

				if(rsp.success) {

					// var msg = "결제 완료";
		   //       msg += '고유ID : ' + rsp.imp_uid;                //아임포트 uid는 실제 결제 시 결제 고유번호를 서버와 비교해서 결제처리하는데 필요없긴함.
		   //       msg += '// 상점 거래ID : ' + rsp.merchant_uid;
		   //       msg += '// 결제 금액 : ' + rsp.paid_amount;
		   //       msg += '// 카드 승인번호 : ' + rsp.apply_num;

					console.log(rsp.imp_uid);

					console.log("----------");
					console.log(rsp.merchant_uid);
					console.log($('.sessionMemberId').val());
					console.log(rsp.pg_provider);
					console.log(rsp.paid_amount);
					console.log(rsp.buyer_name);
					console.log(rsp.buyer_tel);
					console.log(rsp.buyer_postcode);
					console.log(rsp.pg_tid);
					console.log("----------");
					console.log(Math.floor($("#rewardPoint").val()));

					$.ajax({
					url : "/paySuccess",
					type : "post",
					// async : true,
					data : {
						paymentNo : rsp.merchant_uid,
						memberId : $('.sessionMemberId').val(),
						paymentType : rsp.pg_provider,
						paymentName : paymentName,
						paymentTotal : rsp.paid_amount,
						receiveName : $("#receiveName").val(),
						receivePhone : $("#receivePhone").val(),
						postCode : $("#postCode").val(),
						receiveAddress1 : $("#address1").val(),
						receiveAddress2 : $("#address2").val(),
						deliveryComment : $("#deliveryComment").val(),
						paymentToken : rsp.pg_tid,
						rewardPoint : Math.floor($("#rewardPoint").val())
					},
					success : function(data) {

						if(data == 1) {

							plusPoint();
							minusPoint();

							$("#payCompleteForm").children().eq(0).val(rsp.merchant_uid);

							// insertOrder();

							var msg = "결제가 완료되었습니다.";
							alert(msg);

							$("#payCompleteForm").submit();

						} else {
							var msg = "결제에 실패하였습니다. 다시 시도해 주세요.";
							alert(msg);
						}
					},
					error : function() {

						console.log("결제 ajax 실패");
						var msg = "결제에 실패하였습니다." + rsp.error_msg;
						alert(msg);
					}
				});

			} else {

				var msg = "결제 실패 : ";
		     	msg += rsp.error_msg;
		     	alert(msg);
			}
		});

	} else {

		alert("배송지 정보를 빠짐없이 입력해주세요!");
		if($("#receiveName").val() == "") { // 수령인 미작성
			$("#receiveName").focus();
		} else if($("#receivePhone").val() == "") { // 수령인 전화번호 미작성
			$("#receivePhone").focus();
		} else if($("#postCode").val() == "") { // 우편번호 미작성
			$("#postCode").focus();
		} else if($("#address1") == "") { // 주소 미작성
			$("#address1").focus();
		} else if($("#address2").val() == "") { // 상세주소 미작성
			$("#address2").focus();
		}
	}

}

// 주소찾기 api
function addressAPI() {
	new daum.Postcode({
		oncomplete: function(data) {
		// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		// 주소 정보를 해당 필드에 넣는다.
		$("#postCode").val(data.zonecode);
		$("#address1").val(data.roadAddress);
		$("#address2").focus();

		}
	}).open();
}

// 포인트 추가 기능
function plusPoint() {

	$.ajax({
		url : "/insertPoint",
		type : "post",
		data : {
			pointContent : "상품 결제", // 포인트적립 사유 ex) 일기 작성, 챌린지 인증
			pointNum : Math.floor($("#rewardPoint").val()), // 부여할 포인트값
			status : "+",
			memberId : $('.sessionMemberId').val() // 로그인한 회원 아이디
		},
		success : function(result) {

			if(result == "1") {

				console.log("포인트 내역 추가 성공");
			} else {
				console.log("포인트 내역 추가 실패");
			}
		},
		error : function() {
			console.log("포인트 추가 ajax 실패");
		}
	});
}

// 포인트 삭감 기능
function minusPoint() {

	$.ajax({
		url : "/insertPoint",
		type : "post",
		data : {
			pointContent : "결제 시 포인트 사용",
			pointNum : $("#point").val(), // 삭감할 포인트
			status : "-",
			memberId : $('.sessionMemberId').val()
		},
		success : function(result) {

			if(result == "1") {

				console.log("포인트 삭감 성공");
			} else {
				console.log("포인트 삭감 실패");
			}
		},
		error : function() {
			console.log("포인트 삭감 실패2");
		}
	});
}

$(function() {

	//포인트 입력 시 조건 확인
	$("#point").on("propertychange change keyup paste input", function(){

		const maxPoint = parseInt($("#realPoint").val());

		let inputValue = parseInt($(this).val());

		if(inputValue < 0) {

			$(this).val(0);

		} else if(inputValue > maxPoint) {

			$(this).val(maxPoint);

		}

	});

	// 포인트 전액사용 버튼
	$(".point-btn").on("click", function() {

		// console.log("버튼변경");

		const maxPoint = parseInt($("#realPoint").val());

		let state = $(this).data("state");

		if(state == "Y") {

			// console.log("y동작");
			/* 모두사용 */
			//값 변경
			$("#point").val(maxPoint);
			//글 변경
			$("#pointCancel").css("display", "inline-block");
			$("#pointAll").css("display", "none");

		} else if(state == "N") {

			// console.log("n동작");
			/* 취소 */
			//값 변경
			$("#point").val(0);
			//글 변경
			$("#pointCancel").css("display", "none");
			$("#pointAll").css("display", "inline-block");

		}

		setTotalSummary();

	});

	$("#point").blur(function() {

		if($("#point").val() == "") {

			$("#point").val(0);

			$("#pointCancel").css("display", "none");
			$("#pointAll").css("display", "inline-block");

		}

		setTotalSummary();

	});

})

// 주문요약 세팅
function setTotalSummary() {

	let totalPrice = 0;		// 총 가격
	let deliveryPrice = 3000;	// 배송비
	let usePoint = 0;			// 사용 포인트(할인가격)
	let finalTotalPrice = 0;	// 최종 가격(총 가격 + 배송비)

	totalPrice = parseInt($("#realProductPrice").val());

	/* 사용 포인트 */
	usePoint = parseInt($("#point").val());

	finalTotalPrice = totalPrice + deliveryPrice - usePoint;

	// 입력한 포인트가 최종 금액보다 클 경우
	if(finalTotalPrice < 3000) {
		usePoint = totalPrice;
		finalTotalPrice = 3000;
		$("#point").val(usePoint);
	}

	// console.log("총가격" + totalPrice);
	// console.log("사용포인트" + usePoint);
	// console.log("최종가격" + finalTotalPrice);

	$("#usePoint").html(usePoint.toLocaleString("ko-KR") + "원");
	$("#realTotalPrice").val(finalTotalPrice);
	$(".totalPrice").html( finalTotalPrice.toLocaleString("ko-KR") + "원");

}

/*
// DB에 결제상품 insert
function insertOrder() {

	let orderList = $("#orderList").val();
	let itemAmount = $("#itemAomunt").val();
	let paymentNo = $("#payCompleteForm").children().eq(0).val();

	if(itemAmount == null) {
		itemAmount = 0;
	}

	console.log("insert order : " + orderList);
	console.log("insert itemAmount : " + itemAmount);
	console.log("insert paymentNo : " + paymentNo);

	$.ajax({
		url : "/insertOrder",
		type : "POST",
		data : {
			paymentNo : paymentNo,
			itemAmount : itemAmount,
			orderList : JSON.stringify(orderList)
		},
		success : function(result) {
			console.log(result);
			console.log("인서트 성공");
		}, error : function() {
			console.log("인서트 ajax 실패");
		}
	});

}
*/