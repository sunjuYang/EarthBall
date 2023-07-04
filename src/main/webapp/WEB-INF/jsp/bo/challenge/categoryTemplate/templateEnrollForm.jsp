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
      <jsp:param name="menuId" value="51"/>
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
          <h4 class="fw-bold">탬플릿 생성</h4>

          <!-- Basic Layout -->
          <div class="col-xl">
            <div class="card mb-4">
              <div class="card-body">
                <form>
                  <div class="mb-3">
                    <label class="form-label" for="viewCategoryNo">카테고리 번호</label>
                    <input type="text" class="form-control" id="viewCategoryNo" value="${category.categoryNo}"
                           readonly="readonly">
                    <input type="hidden" name="categoryNo" value="${category.categoryNo}">
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="inputType">입력타입</label>
                    <select name="inputType" id="inputType" class="form-select">
                      <option value="select">select</option>
                      <option value="checkbox">checkbox</option>
                      <option value="radio">radio</option>
                      <option value="text">text</option>
                      <option value="textarea">textarea</option>
                      <option value="file">file</option>
                      <option value="number">number</option>
                      <option value="range">range</option>
                      <option value="datetime-local">datetime-local</option>
                    </select>
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="subTitle">챌린지 소제목</label>
                    <input type="text" class="form-control" name="subTitle" id="subTitle" placeholder="챌린지 소제목">
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="grpCode">그룹코드</label>
                    <select name="grpCode" id="grpCode" class="form-select">
                      <option value="">선택하세요</option>
                      <c:forEach var="item" items="${grpCodeList}">
                        <option value="${item.grpCode}">${item.grpCodeName}</option>
                      </c:forEach>
                    </select>
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="sortNo">우선순위</label>
                    <input type="number" class="form-control" name="sortNo" id="sortNo" placeholder="우선순위" min="0"
                           max="999" step="1">
                  </div>
                  <button type="button" class="btn btn-primary" onclick="insertTemp();">생성하기</button>
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
    function insertTemp() {
        let categoryNo = $("input[name=categoryNo]").val();
        let categoryTemplateNo = $("input[name=templateNo]").val();
        let inputType = $("select[name=inputType]").val();
        let chSubTitle = $("input[name=subTitle]").val();
        let grpCode = $("select[name=grpCode]").val();
        let sortNo = $("input[name=sortNo]").val();


        if (inputType == 'select' || inputType == 'checkbox' || inputType == 'radio') {
            if (grpCode == null || grpCode == undefined || grpCode == '') {
                alert("그룹코드 선택하세요.");
                $("select[name=grpCode]").focus();
                return;
            }
        } else {
            grpCode = null;
        }

        let data = {
            categoryNo: categoryNo
            , categoryTemplateNo: categoryTemplateNo
            , inputType: inputType
            , chSubTitle: chSubTitle
            , grpCode: grpCode
            , sortNo: sortNo
        }

        console.log("탬플릿 생성용 data : ", data);
        $.ajax({
            url: "insert.te"
            , type: "post"
            , data: data
            , success: function () {
                alert("탬플릿이 생성되었습니다.");
                console.log("탬플릿 생성 성공");
                location.href = "/detail.ca?categoryNo=" + categoryNo;
            }
            , error: function () {
                alert("탬플릿이 생성되지 않았습니다.");
                console.log("탬플릿 생성 실패");
            }
        });
    }
</script>
</body>
</html>