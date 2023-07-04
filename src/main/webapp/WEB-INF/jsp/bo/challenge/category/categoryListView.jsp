<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <jsp:include page="/WEB-INF/jsp/bo/common/commonHead.jsp"/>
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
  <div class="layout-container">
    <!-- Menu -->

    <jsp:include page="/WEB-INF/jsp/bo/common/commonLayoutMenu.jsp">
      <jsp:param name="menuId" value="52"/>
    </jsp:include>
    <!-- / Menu -->

    <!-- Layout container -->
    <div class="layout-page">
      <!-- Navbar -->
      <jsp:include page="/WEB-INF/jsp/bo/common/commonLayoutNavbar.jsp"/>
      <!-- / Navbar -->

      <!-- Content wrapper -->
      <div class="content-wrapper">
        <!-- Content -->
        <div class="container-xxl flex-grow-1 container-p-y">
          <h4 class="fw-bold">카테고리 리스트</h4>
          <!-- HTML5 Inputs -->
          <div class="card mb-2">
            <div class="card-body">
              <div class="row">
                <div class="col-sm-10">
                  <button type="button" class="btn btn-primary" onclick="insertCategory();">카테고리 생성
                  </button>
                </div>
              </div>
            </div>
          </div>
          <!-- Hoverable Table rows -->
          <div class="card mb-2">
            <div class="table-responsive text-nowrap" id="categoryList">
              <table class="table table-hover">
                <thead>
                <tr>
                  <th width="40%" class="text-center">카테고리 번호</th>
                  <th width="60%" class="text-center">카테고리 명</th>
                </tr>
                </thead>
                <tbody class="table-border-bottom-0">
                <c:if test="${empty categoryList}">
                  <tr>
                    <td colspan="2">
                      <strong>데이터가 없습니다.</strong>
                    </td>
                  </tr>
                </c:if>
                <c:forEach var="item" items="${categoryList}">
                  <tr>
                    <td class="text-center categoryNo" data-category-no="${item.categoryNo}">
                      <strong>${item.categoryNo}</strong></td>
                    <td class="text-center categoryNo" data-category-no="${item.categoryNo}">
                      <strong>${item.categoryName}</strong></td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <!--/ Hoverable Table rows -->
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
<jsp:include page="/WEB-INF/jsp/bo/common/commonScript.jsp"/>
<script type="text/javascript">
    $(document).on('click', '#categoryList .categoryNo', function () {
        let categoryNo = $(this).data('categoryNo');
        location.href = "/detail.ca?categoryNo=" + categoryNo;
    });

    function insertCategory() {
        location.href = "/EnrollForm.ca";
    }
</script>
</body>
</html>