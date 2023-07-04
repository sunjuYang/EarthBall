$(document).ready(function() {
    let memberId = $("#memberId").val();

    $.ajax({
        url: "list.cart",
        type: "get",
        data: {memberId: memberId},
        success: function(result) {
            var html = "";
            var totalPrice = 0;

            for(let i in result){
                html += "<tr>";
                    html += "<td>";
                        html += "<input type='hidden' value='" + result[i].productNo+ "'>";
                        html += "<input type='checkbox'>";
                    html += "</td>";
                    html += "<td>";
                        html += "<div class='productArea'>";
                            html += "<div>";
                                html += "<img src='/resources/fo/upfiles/" + result[i].changerName + "'>";
                            html += "</div>";
                            html += "<div>";
                                html += result[i].productName;
                            html += "</div>";
                        html += "</div>";
                    html += "</td>";
                    html += "<td>";
                        html += "<div>";
                            html += "<table class='quantityArea'>";
                                html += "<tr>";
                                    html += "<input type='hidden' id='productNo' value='" + result[i].productNo + "'>";
                                    html += "<td><button class='down' onclick='minus();'>-</button></td>";
                                    html += "<td>";
                                        html += "<input type='text' id='product-amount-" + result[i].productNo + "' value='" + result[i].amount + "' class='amount'>";
                                    html += "</td>";
                                    html += "<td><button class='up' onclick='plus();'>+</button></td>";
                                html += "</tr>";
                            html += "</table>";
                        html += "</div>";
                    html += "</td>";
                    html += "<td>";
                        html += "<div class='price" +  result[i].productNo + "'>";
                            html += "<span>" + result[i].price + "</span>";
                            html += "<span>원</span>";
                        html += "</div>";
                    html += "</td>";
                    html += "<td>";
                        html += "<div>";
                            html += "<span class='totalPrice" + result[i].productNo + "'>" + (result[i].price * result[i].amount) + "</span>";
                            html += "<span>원</span>";
                        html += "</div>";
                    html += "</td>";
                html += "</tr>";
            }

            for(let i in result){
                totalPrice += result[i].price * result[i].amount;
            }

            $(".cartList tbody").html(html);
            $(".orderArea").children().children().eq(0).text(result.length);
            $(".productTotal").text(totalPrice);
            $(".total").text(totalPrice + 3000);
        }
    });
});

// +버튼 눌른 행만 수량 증가 및 주문금액 증가
function plus(){
    let productNo = $(event.target).parent().parent().parent().parent().find("input[type='hidden']").val();
    let amount = $(event.target).parent().parent().find(".amount").val();
    let price = $(".price" + productNo).children().eq(0).text();
    let memberId = $("#memberId").val();

    amount++;
    $("#product-amount-" + productNo).val(amount);
    $(".totalPrice" + productNo).text(price * amount);

    $(".productTotal").text($(".productTotal").text() * 1 + price * 1);
    $(".total").text($(".total").text() * 1 + price * 1);

    updateAmount(productNo, amount, memberId);
}

// -버튼 눌른 행만 수량 감소 및 주문금액 감소
function minus(){
    let productNo = $(event.target).parent().parent().parent().parent().find("input[type='hidden']").val();
    let amount = $(event.target).parent().parent().find(".amount").val();
    let price = $(".price" + productNo).children().eq(0).text();
    let memberId = $("#memberId").val();

    if(amount > 1){
        amount--;
        $("#product-amount-" + productNo).val(amount);
        $(".totalPrice" + productNo).text(price * amount);
        $(".productTotal").text($(".productTotal").text() * 1 - price * 1);
        $(".total").text($(".total").text() * 1 - price * 1);
    }
    
    updateAmount(productNo, amount, memberId);
}

// 수량 수정 ajax
function updateAmount(productNo, amount, memberId){
    $.ajax({
        url: "updateAmount.cart",
        type: "post",
        data: {productNo: productNo, amount: amount, memberId: memberId},
        success: function(result) {
            if(result == 1){
                console.log("수량 수정 완료");
            } else {
                console.log("수량 수정 실패");
            }
        },
        error: function() {
            console.log("수량 수정 ajax 에러");
        }
    });
}

// 전체선택 체크박스 클릭 시
function allCheck(){
    if($("#allCheck").prop("checked")){
        $(".cartList tbody").find("input[type='checkbox']").prop("checked", true);
    } else {
        $(".cartList tbody").find("input[type='checkbox']").prop("checked", false);
    }
}

// 선택상품 삭제
function deleteCart(){
    let memberId = $("#memberId").val();
    let productNo = [];

    $(".cartList tbody").find("input[type='checkbox']").each(function(){
        if($(this).prop("checked")){
            productNo.push($(this).parent().parent().find("input[type='hidden']").val());
        }
    });

    $.ajax({
        url: "delete.cart",
        type: "post",
        data: {productNo: productNo,
               memberId: memberId},
        success: function(result) {
            if(result == 1){
                console.log("장바구니 삭제 완료");
                $(".cartList tbody").find("input[type='checkbox']").each(function(){
                    if($(this).prop("checked")){
                        $(this).parent().parent().remove();
                    }
                });
                updateInfomation();
            } else {
                console.log("장바구니 삭제 실패");
            }
        },
        error: function() {
            console.log("장바구니 삭제 ajax 에러");
        }
    });
}

// 주문하기 버튼 클릭 시 체크된 상품만 주문페이지로 이동
function order() {

    let productNo = [];
    let amount = [];
    let memberId = $("#memberId").val();
    let form_contents = '';

    $(".cartList tbody").find("input[type='checkbox']").each(function(){
        if($(this).prop("checked")){
            productNo.push($(this).parent().parent().find("input[type='hidden']").val());
            amount.push($(this).parent().parent().find(".amount").val());
        }
    });

    if(productNo.length == 0){
        alert("상품을 선택해주세요.");
        return false;
    }

    for(let i = 0; i < productNo.length; i++) {

		let productNo_input = "<input name='orders[" + i + "].productNo' type='hidden' value='" + productNo[i] + "'>";
		form_contents += productNo_input;

		let amount_input = "<input name='orders[" + i + "].amount' type='hidden' value='" + amount[i] + "'>";
		form_contents += amount_input;

		let memberId_input = "<input name='orders[" + i + "].memberId' type='hidden' value='" + memberId + "'>";
		form_contents += memberId_input;

	}

	let totalPrice_input = "<input name='totalPrice' type='hidden' value='" + $(".productTotal").html() + "'>";
	form_contents += totalPrice_input;

    console.log(productNo);
    console.log(amount);
    console.log(memberId);
    console.log("form_contents = " + form_contents);

    // 쿼리스트링으로 상품번호 배열을 주문페이지로 전달
    // location.href = "payment.pa?productNo=" + productNo + "&amount=" + amount + "&memberId=" + memberId;

	$(".order_form").html(form_contents);
	$(".order_form").submit();

}

function updateInfomation(){

    let count = $(".cartList>tbody>tr").length;

    console.log(count);

    $(".orderArea").children().children().eq(0).text(count);

    let productTotal = 0;
    let productNo = [];

    for(var i = 1; i <= count; i++){

        productNo = $(".cartList>tbody>tr").eq(i-1).find("input[type='hidden']").val();
        let totalPrice = $(".totalPrice" + productNo).text();

        console.log(productNo);
        console.log(totalPrice );

        productTotal = productTotal + $(".totalPrice" + productNo).text() * 1;
    }


    $(".productTotal").text(productTotal);
    $(".total").text(productTotal + 3000);
}