<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
-->
<!-- beautify ignore:start -->
<html
        lang="kr"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="/resources/admin/assets/"
        data-template="vertical-menu-template-free"
>
<head>
  <jsp:include page="/WEB-INF/jsp/bo/common/commonHead.jsp" />
  <style>
  /* 취소확인 버튼 스타일 */
  .cancel_btn {
  	width : 80px;
    height : 30px;
    font-size : 16px;
    color : white;
    border : 1px solid #19A7CE;
    background-color : #19A7CE;
    border-radius : 7px;
  }
  </style>
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
  <div class="layout-container">
    <!-- Menu -->

    <jsp:include page="/WEB-INF/jsp/bo/common/commonLayoutMenu.jsp">
      <jsp:param name="menuId" value="60"/>
    </jsp:include>
    <!-- / Menu -->

    <!-- Layout container -->
    <div class="layout-page">
      <!-- Navbar -->
      <jsp:include page="/WEB-INF/jsp/bo/common/commonLayoutNavbar.jsp" />
      <!-- / Navbar -->

      <!-- Content wrapper -->
      <div class="content-wrapper">
        <!-- Content -->
        <div class="container-xxl flex-grow-1 container-p-y">
          <h4 class="fw-bold">주문 취소 관리</h4>
          <!-- HTML5 Inputs -->
          <div class="card mb-2">

          </div>
          <!-- Hoverable Table rows -->
          <div class="card mb-2">
            <div class="table-responsive text-nowrap" id="cancelList">
              <table class="table table-hover">
                <thead>
                <tr>
                  <th class="text-center" width="20%">주문번호</th>
                  <th class="text-center" width="15%">회원ID</th>
                  <th class="text-center" width="23%">상품명</th>
                  <th class="text-center" width="12%">판매금액</th>
                  <th class="text-center" width="18%">판매일</th>
                  <th class="text-center" width="12%">처리상태</th>
                </tr>
                </thead>
                <tbody class="table-border-bottom-0">
                <c:forEach var="cancel" items="${ cancelList }">
                  <tr>
                  	<c:if test="${empty cancelList}">
                  		<td class="text-center chConNo" data-ch-con-no="noData"><strong>등록된 취소요청이 없습니다.</strong></td>
                  	</c:if>
                    <td class="text-center chConNo paymentNo" data-ch-con-no="${cancel.paymentNo}" style="cursor:pointer;"><strong>${cancel.paymentNo}</strong></td>
                    <td class="text-center chConNo" data-ch-con-no="${cancel.memberId}"><strong>${cancel.memberId}</strong></td>
                    <td class="text-center chConNo" data-ch-con-no="${cancel.paymentName}"><strong>${cancel.paymentName}</strong></td>
                    <td class="text-center chConNo" data-ch-con-no="${cancel.paymentTotal}"><strong><fmt:formatNumber value="${cancel.paymentTotal}" pattern="###,###원"/></strong></td>
                    <td class="text-center chConNo" data-ch-con-no="${cancel.paymentDate}"><strong>${cancel.paymentDate}</strong></td>
                    <c:choose>
                    	<c:when test="${ cancel.status == 'R' }">
                    		<td class="text-center chConNo" data-ch-con-no="${cancel.status}"><button class="cancel_btn">취소하기</button></td>
                    	</c:when>
                    	<c:when test="${ cancel.status == 'N' }">
                    		<td class="text-center chConNo" data-ch-con-no="${cancel.status}"><strong>취소완료</strong></td>
                    	</c:when>
                    </c:choose>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <input type="text" id="paymentNoCopy" style="position:absolute;top:-9999em;">
          <!--/ Hoverable Table rows -->

          <div class="card mb-4">
            <!-- Basic Pagination -->
            <div class="demo-inline-spacing">
              <!-- Basic Pagination -->
              <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                  <c:choose>
                    <c:when test="${ pageInfo.currentPage eq 1 }">
                      <li class="page-item prev disabled">
                        <a class="page-link" href="#"><i class="tf-icon bx bx-chevron-left"></i></a>
                      </li>
                    </c:when>
                    <c:otherwise>
                      <li class="page-item prev">
                        <a class="page-link" href="list.cpa?currentPage=${ pageInfo.currentPage - 1 }"><i
                                class="tf-icon bx bx-chevron-left"></i></a>
                      </li>
                    </c:otherwise>
                  </c:choose>
                  <c:forEach var="page" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1">
                    <li class="page-item">
                      <a class="page-link" href="list.cpa?currentPage=${ page }">${ page }</a>
                    </li>
                  </c:forEach>
                  <c:choose>
                    <c:when test="${ pageInfo.currentPage eq pageInfo.maxPage }">
                      <li class="page-item next disabled">
                        <a class="page-link" href="#"><i class="tf-icon bx bx-chevron-right"></i></a>
                      </li>
                    </c:when>
                    <c:otherwise>
                      <li class="page-item next">
                        <a class="page-link" href="list.cpa?currentPage=${ pageInfo.currentPage + 1 }"><i
                                class="tf-icon bx bx-chevron-right"></i></a>
                      </li>
                    </c:otherwise>
                  </c:choose>
                </ul>
              </nav>
              <!--/ Basic Pagination -->
            </div>
          </div>
       </div>
     </div>
   </div>
  </div>
</div>

<jsp:include page="/WEB-INF/jsp/bo/common/commonScript.jsp" />
<script type="text/javascript">

$(".cancel_btn").on("click", function() {

	if(window.confirm("정말로 취소처리 하시겠습니까? \n(결제관리페이지에서 취소 후 눌러주세요.)")) {

		let paymentNo = $(this).parent().parent().children(0).eq(0).text();
		let memberId = $(this).parent().parent().children(0).eq(1).text();

		$.ajax({
			url : "/acceptCancel",
			type : "post",
			data : {
				memberId : memberId,
				paymentNo : paymentNo
			},
			success : function(result) {

				if(result == "1") {

					var msg = "취소처리가 반영되었습니다.";
					alert(msg);
					location.reload();

				} else {

					var msg = "취소처리에 실패하였습니다. 다시 시도해 주세요.";
					alert(msg);

				}
			},
			error : function() {

				var msg = "알 수 없는 이유로 취소요청에 실패하였습니다.";
				alert(msg);
			}
		});

	}
});

$(document).ready(function(){

    $('.paymentNo').on("click", function() { //클릭 이벤트
      $("#paymentNoCopy").val($(this).text()); //해당 문구 가져와 텍스트박스에 입력
      document.getElementById("paymentNoCopy").select(); //텍스트 박스 선택
      document.execCommand("copy"); //클립보드 복사
      alert("주문번호가 복사되었습니다.");
    });

});

</script>

</body>
</html>
