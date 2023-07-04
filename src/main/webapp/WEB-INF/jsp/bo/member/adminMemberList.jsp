<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
  <div class="layout-container">
    <!-- Menu -->

    <jsp:include page="/WEB-INF/jsp/bo/common/commonLayoutMenu.jsp">
      <jsp:param name="menuId" value="51"/>
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
          <h4 class="fw-bold">회원 정보 관리 </h4>
          <!-- HTML5 Inputs -->
          <div class="card mb-2">
            <div class="card-body">
              <div class="row">
                <div class="col-sm-10">
                  <form action="member.me" method="post">
					    <input type="text" name="keyword" required>
					    <input type="submit" value="검색" class="btn btn-primary" >
				</form>
                </div>
              </div>
            </div>
          </div>
          <!-- Hoverable Table rows -->
          <div class="card mb-2">
            <div class="table-responsive text-nowrap" id="MemberList">
              <table class="table table-hover">
                <thead>
                <tr>
                  <th class="text-center" width="10%">회원 ID</th>
                  <th class="text-center" width="25%">닉네임</th>
                  <th class="text-center" width="20%">이메일</th>
                  <th class="text-center" width="20%">전화번호</th>
                  <th class="text-center" width="20%">주소</th>
                  <th class="text-center" width="10%">회원 등급</th>
                </tr>
                </thead>
					<tbody class="table-border-bottom-0">
					  <c:forEach var="member" items="${ memberList }">
					    <tr>
					      <td class="text-center"><strong>${member.memberId}</strong></td>
					      <td class="text-center"><strong>${member.memberName}</strong></td>
					      <td class="text-center"><strong>${member.email}</strong></td>
					      <td class="text-center"><strong>${member.phone}</strong></td>
					      <td class="text-center"><strong>${member.address1}</strong></td>
					      <td class="text-center"><strong>${member.gradeName}</strong></td>
					      
					 <td class="text-center">
		
						<c:choose>
							<c:when test="${ member.status eq 'Y' }">
								<button type="button" onclick="status();" class="btn btn-success">계정 활성화</button>
							</c:when>
							<c:otherwise>
								<button type="button" onclick="status();" class="btn btn-danger">계정 비활성화</button>
							</c:otherwise>
						</c:choose>
        			</td>
		    	</tr>
		  	</c:forEach>
		</tbody>
       </table>
      </div>
    </div>
         
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
			          <a class="page-link" href="list.mem?currentPage=${ pageInfo.currentPage - 1 }"><i class="tf-icon bx bx-chevron-left"></i></a>
			        </li>
			      </c:otherwise>
			    </c:choose>
			    <c:forEach var="page" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1">
			      <li class="page-item">
			        <a class="page-link" href="list.mem?currentPage=${ page }">${ page }</a>
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
			          <a class="page-link" href="list.mem?currentPage=${ pageInfo.currentPage + 1 }"><i class="tf-icon bx bx-chevron-right"></i></a>
			        </li>
			      </c:otherwise>
			    </c:choose>
			  </ul>
			</nav>
              <!--/ Basic Pagination -->
            </div>
          </div>
                   
                   
        <!-- / Content -->


        <!-- Footer -->                                                                                 
        <footer class="content-footer footer bg-footer-theme">
          <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
            <div class="mb-2 mb-md-0">
              ©
              <script>
                  document.write(new Date().getFullYear());
              </script>
            </div>
          </div>
        </footer>
        <!-- / Footer -->

        <div class="content-backdrop fade"></div>
      </div>
      <!-- Content wrapper -->
    </div>
    <!-- / Layout page -->
  </div>

  <!-- Overlay -->
  <div class="layout-overlay layout-menu-toggle"></div>
</div>
<jsp:include page="/WEB-INF/jsp/bo/common/commonScript.jsp" />
<script type="text/javascript">

	// 상품 행 클릭시 상세보기 페이지로 이동
	$(".productList tbody tr").click(function() {
	  location.href = "adminDetailView.pro?productNo=" + $(this).children().eq(0).text();
	});
	
	// 노출여부 버튼 클릭시
	// 상세보기 페이지로 이동하는거 막음
	// 호버표과 안함
	function status() {
	  event.stopPropagation();
	
	  if($(event.target).text() == "Y") {
	    $(event.target).text("N");
	    $(event.target).removeClass("btn-success");
	    $(event.target).addClass("btn-danger");
	  } else {
	    $(event.target).text("Y");
	    $(event.target).removeClass("btn-danger");
	    $(event.target).addClass("btn-success");
	  }
	
	  // 상품번호
	  var productNo = $(event.target).parent().siblings().eq(0).text();
	  // 노출여부
	  var status = $(event.target).text();
	  
	  console.log(productNo);
	  console.log(status);
	
	  $.ajax({
	    url: "adminStatusUpdate.pro",
	    type: "post",
	    data: {
	      productNo: productNo,
	      status: status
	    },
	    success: function(data) {
	      if(data == 1) {
	        alert("상품 노출여부 변경 성공");
	      } else {
	        alert("상품 노출여부 변경 실패");
	
	        if($(event.target).text() == "Y") {
	          $(event.target).text("N");
	          $(event.target).removeClass("btn-success");
	          $(event.target).addClass("btn-danger");
	        } else {
	          $(event.target).text("Y");
	          $(event.target).removeClass("btn-danger");
	          $(event.target).addClass("btn-success");
	        }
	      }
	    },
	    error: function() {
	      console.log("상품 노출여부 변경 실패");
	    }
	  });
	}
</script>
</body>
</html>