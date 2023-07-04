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
          <h4 class="fw-bold">카테고리 생성</h4>

          <!-- Basic Layout -->
          <div class="col-xl">
            <div class="card mb-4">
              <div class="card-body">
                <form>
                  <div class="mb-3">
                    <label class="form-label" for="categoryName">카테고리명</label>
                    <input type="text" class="form-control" name="categoryName" id="categoryName"
                           placeholder="카테고리명을 입력하세요.">
                  </div>
                  <button type="button" class="btn btn-primary" onclick="categoryNameValidate();">생성하기</button>
                  <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">생성취소</button>
                </form>
              </div>
            </div>
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
<jsp:include page="/WEB-INF/jsp/bo/common/commonScript.jsp"/>
<script type="text/javascript">
    function categoryNameValidate() {
        let categoryName = $("input[type=text][name=categoryName]").val();
        let regExp = /^[가-힣]{2,}$/;
        if (!regExp.test(categoryName)) {
            alert("카테고리명은 2글자 이상의 한글로 입력해주세요.");
            $("input[type=text][name=categoryName]").focus();
            return false;
        }

        let data = {
            categoryName: categoryName
        };

        $.ajax({
            url: "insert.ca"
            , type: "post"
            , data: data
            , success: function (result) {

                if (result > 0) {
                    alert("카테고리가 생성되었습니다.");
                    console.log("카테고리 생성 성공");
                    location.href = "/list.ca";
                } else {
                    alert("카테고리가 생성되지 않았습니다.");
                    console.log("카테고리 생성 실패");
                }
            }
            , error: function () {
                console.log("카테고리 생성 ajax 통신 실패");
            }
        });
    }
</script>
</body>
</html>
