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
          <h4 class="fw-bold">탬플릿 수정</h4>

          <!-- Basic Layout -->
          <div class="col-xl">
            <div class="card mb-4">
              <div class="card-body">
                <form>
                  <div class="mb-3">
                    <label class="form-label" for="viewCategoryNo">카테고리 번호</label>
                    <input type="text" class="form-control" id="viewCategoryNo" value="${categoryTemplate.categoryNo}"
                           readonly="readonly">
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="viewCategoryNo">탬플릿 번호</label>
                    <input type="text" class="form-control" id="categoryTemplateNo" value="${categoryTemplate.categoryTemplateNo}"
                           readonly="readonly">
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="inputType">입력타입</label>
                    <select name="inputType" id="inputType" class="form-select">
                      <option value="select" ${categoryTemplate.inputType == 'select' ? 'selected' : ''}>select</option>
                      <option value="checkbox" ${categoryTemplate.inputType == 'checkbox' ? 'selected' : ''}>checkbox</option>
                      <option value="radio" ${categoryTemplate.inputType == 'radio' ? 'selected' : ''}>radio</option>
                      <option value="textarea" ${categoryTemplate.inputType == 'textarea' ? 'selected' : ''}>textarea</option>
                      <option value="file" ${categoryTemplate.inputType == 'file' ? 'selected' : ''}>file</option>
                      <option value="number" ${categoryTemplate.inputType == 'number' ? 'selected' : ''}>number</option>
                      <option value="range" ${categoryTemplate.inputType == 'range' ? 'selected' : ''}>range</option>
                      <option value="datetime-local" ${categoryTemplate.inputType == 'datetime-local' ? 'selected' : ''}>datetime-local</option>
                    </select>
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="subTitle">챌린지 소제목</label>
                    <input type="text" class="form-control" name="subTitle" id="subTitle" placeholder="" value="${categoryTemplate.chSubTitle}">

                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="grpCode">그룹코드</label>
                    <select name="grpCode" id="grpCode" class="form-select">
                      <c:forEach var="item" items="${grpCodeList}">
                        <option value="${item.grpCode}" ${categoryTemplate.grpCode == item.grpCode ? 'selected' : ''}> ${item.grpCode} - ${item.grpCodeName}</option>
                      </c:forEach>
                    </select>
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="sortNo">우선순위</label>
                    <input type="number" class="form-control" name="sortNo" id="sortNo" placeholder="" min="0"
                           max="999" step="1" value="${categoryTemplate.sortNo}">
                  </div>
                  <button type="button" class="btn btn-primary" onclick="updateTemp();">수정하기</button>
                  <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">수정취소</button>
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
    function updateTemp() {
        let categoryNo = $("#viewCategoryNo").val();
        let categoryTemplateNo = $("#categoryTemplateNo").val();
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

        console.log("탬플릿 수정용 data : ", data);
        $.ajax({
            url: "update.te"
            , type: "post"
            , data: data
            , success: function () {
                alert("탬플릿이 수정되었습니다.");
                console.log("탬플릿 수정 성공");
                location.href = "/detail.ca?categoryNo=" + categoryNo;
            }
            , error: function () {
                alert("탬플릿이 수정되지 않았습니다.");
                console.log("탬플릿 수정 실패");
            }
        });
    }
</script>
</body>
</html>