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
          <h4 class="fw-bold">카테고리명 - ${category.categoryName}</h4>
          <input type="hidden" id="categoryNo" value="${category.categoryNo}">
          <div class="card mb-4">
            <div class="card-body">
              <div class="row">
                <div class="col-sm-10">
                  <button type="button" class="btn btn-primary" onclick="updateCategory('${category.categoryNo}');">카테고리
                    수정
                  </button>
                  <button type="button" class="btn btn-primary" onclick="deleteCategory('${category.categoryNo}');">카테고리 삭제
                  </button>
                </div>
              </div>
            </div>
          </div>

          <h4 class="fw-bold">탬플릿 리스트</h4>
          <div class="card mb-2">
            <div class="card-body">
              <div class="row">
                <div class="col-sm-10">
                  <button type="button" class="btn btn-primary" onclick="insertCategoryTemplate('${category.categoryNo}');">탬플릿 등록
                  </button>
                  <button type="button" class="btn btn-primary" onclick="viewCategoryTemplate('${category.categoryNo}');">탬플릿 확인
                  </button>
                </div>
              </div>
            </div>
          </div>
          <!-- Basic Layout -->
          <div class="card mb-2">
            <div class="table-responsive text-nowrap" id="categoryList">
              <table class="table table-hover">
                <thead>
                <tr>
                  <th class="text-center">탬플릿 번호</th>
                  <th class="text-center">입력타입</th>
                  <th class="text-center">챌린지 소제목</th>
                  <th class="text-center">그룹코드</th>
                  <th class="text-center">우선순위</th>
                  <th></th>
                  <th></th>
                </tr>
                </thead>
                <tbody class="table-border-bottom-0">
                <c:if test="${empty templateList}">
                  <tr>
                    <td colspan="5" class="text-center">
                      <strong>데이터가 없습니다.</strong>
                    </td>
                  </tr>
                </c:if>
                <c:forEach var="item" items="${templateList}">
                  <tr>
                    <td class="text-center"><strong>${item.categoryTemplateNo}</strong></td>
                    <td class="text-center"><strong>${item.inputType}</strong></td>
                    <td class="text-center"><strong>${item.chSubTitle}</strong></td>
                    <td class="text-center"><strong>${item.grpCode}</strong></td>
                    <td class="text-center"><strong>${item.sortNo}</strong></td>
                    <td>
                      <button type="button" class="btn btn-primary" onclick="updateTemplate(this);">수정</button>
                    </td>
                    <td>
                      <button type="button" class="btn btn-primary" onclick="deleteTemplate(this, ${category.categoryNo});">삭제</button>
                    </td>
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
    function updateCategory(categoryNo) {
        location.href = "/updateForm.ca?categoryNo=" + categoryNo;
    }
    function deleteCategory(categoryNo) {
        $.ajax({
            url: "delete.ca"
            , type: "post"
            , data: {
                categoryNo : categoryNo
            }
            , success: function (result) {
                if (result > 0) {
                    alert("카테고리가 삭제되었습니다.");
                    location.href = "/list.ca";
                } else {
                    alert("카테고리가 수정되지 않았습니다.");
                }
            }
            , error: function () {
                console.log("카테고리 삭제 ajax 통신 실패");
            }
        });
    }
    function insertCategoryTemplate(categoryNo) {
        location.href = "/insertForm.te?categoryNo=" + categoryNo;
    }
    function viewCategoryTemplate(categoryNo) {
        location.href = "/insertForm.ch?categoryNo=" + categoryNo;
    }

    function updateTemplate(button) {
        let categoryTemplateNo = button.closest("tr").querySelector("td:first-child strong").textContent;
        // 첫 번째 <td>의 텍스트 내용 가져오기
        location.href="/updateForm.te?categoryTemplateNo=" + categoryTemplateNo;
    }
    function deleteTemplate(button, categoryNo) {
        let categoryTemplateNo = button.closest("tr").querySelector("td:first-child strong").textContent;

        $.ajax({
              url : "delete.te"
            , type : "post"
            , data : {
                categoryTemplateNo : categoryTemplateNo
            }
            , success : function (result) {
                if(result > 0) {
                    alert("탬플릿이 삭제되었습니다.");
                    location.href="/detail.ca?categoryNo=" + categoryNo;
                } else {
                    alert("탬플릿이 삭제되지 않았습니다.");
                }
            }
            , error : function () {
                  console.log("탬플릿 삭제 ajax 통신 실패");
            }
        });
    }
</script>
</body>
</html>
