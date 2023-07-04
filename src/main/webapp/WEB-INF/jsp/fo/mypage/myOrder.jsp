<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>주문 내역</title>
  <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
  <link rel="stylesheet" href="/resources/fo/css/mypage/commonMyPage.css?after">
  <link rel="stylesheet" href="/resources/fo/css/mypage/myOrder.css">

  <style type="text/css">

    .hover tr:hover {
    background-color: #f5f5f5;
  	}

  	 table {
        border-collapse: collapse;
        width: 100%;
        }

        td, th {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
        }

  </style>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp" />

<!-- 메인 컨텐츠 -->
<div id="container">
  <!-- Sidebar Menu -->
  <jsp:include page="/WEB-INF/jsp/fo/common/myPageSidebar.jsp" />
  <!-- Main Content -->
  <div class="main-content">

    <jsp:include page="/WEB-INF/jsp/fo/common/mypageProfile.jsp" />

    <div class="main-content2">

      <h2>주문 내역 <span>${ orderList.size()} 개</span></h2>

      <!-- content_1-->
      <div id="content_1">
     <table>
        <tr>
            <th width="23%">주문번호</th>
            <th width="34%">상품명</th>
            <th width="13%">결제금액</th>
            <th width="17%">결제일</th>
            <th width="13%">취소</th>
        </tr>
        <tbody class="hover">
          <c:forEach var="ol" items="${orderList}">
            <tr>
              <c:if test="${ orderList eq null }">
              	<td colspan="5">주문한 상품이 없습니다.</td>
              </c:if>
              <td class="ono">${ol.paymentNo}</td>
              <td>${ol.paymentName}</td>
              <td><fmt:formatNumber value="${ol.paymentTotal}" pattern="###,###원"/></td>
              <td>${ol.paymentDate}</td>
              <c:choose>
                <c:when test="${ol.status == 'Y'}">
                  <td width="100"><button id="payCancel" class="cancel_btn">취소하기</button></td>
                </c:when>
                <c:when test="${ol.status == 'R'}">
                  <td>취소요청됨</td>
                </c:when>
                <c:otherwise>
                  <td>취소됨</td>
                </c:otherwise>
              </c:choose>
            </tr>
          </c:forEach>
        </tbody>
    </table>
</div>
      <!-- content_1 끝-->


      <!-- 페이징바 넣을 자리 시작 -->
      <div id="page">
        <div class="page_btn" align="center">

          <ul class="pagination">
            <li> <a href="/list.myOrder?memberId=${loginUser.memberId}&currentPage=1" class="first">처음 페이지</a> </li>

            <c:choose>
              <c:when test="${ pageInfo.currentPage eq 1}">
                <li> <a href="#" class="arrow_left" disabled> << </a>  </li>
              </c:when>
              <c:otherwise>
                <li> <a href="/list.myOrder?memberId=${loginUser.memberId}&currentPage=${pageInfo.currentPage - 1}" class="arrow_left" disabled> << </a>  </li>
              </c:otherwise>
            </c:choose>


            <c:forEach var="page" begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1">
              <li> <a href="/list.myOrder?memberId=${loginUser.memberId}&currentPage=${page}" class="active num"> ${page} </a>  </li>
            </c:forEach>


            <c:choose>
              <c:when test="${pageInfo.currentPage eq pageInfo.maxPage}">
                <li> <a href="#" class="arrow_right" disabled> >> </a> </li>
              </c:when>
              <c:otherwise>
                <li> <a href="/list.myOrder?memberId=${loginUser.memberId}&currentPage=${pageInfo.currentPage + 1}" class="arrow_right" disabled> >> </a> </li>
              </c:otherwise>
            </c:choose>

            <li> <a href="/list.myOrder?memberId=${loginUser.memberId}&currentPage=${pageInfo.maxPage}" class="last">끝 페이지</a> </li>
          </ul>
        </div>
      </div>

      <!-- 페이징바 넣을 자리 끝 -->



    </div>
  </div>

</div>

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp" />

<script>

$(".cancel_btn").on("click", function() {

	if(window.confirm("정말로 결제취소 요청하시겠습니까?")) {

		let paymentNo = $(this).parent().parent().children(0).eq(0).text();

		$.ajax({
			url : "/reqPayCancel",
			type : "post",
			data : {
				memberId : "${loginUser.memberId}",
				paymentNo : paymentNo
			},
			success : function(result) {

				if(result == "1") {

					var msg = "취소요청이 등록되었습니다.";
					alert(msg);
					location.reload();

				} else {

					var msg = "취소요청이 실패하였습니다. 다시 시도해 주세요.";
					alert(msg);

				}
			},
			error : function() {

				var msg = "알 수 없는 이유로 취소요청에 실패하였습니다.";
				alert(msg);
			}
		});
	}


})
</script>

</body>
</html>
