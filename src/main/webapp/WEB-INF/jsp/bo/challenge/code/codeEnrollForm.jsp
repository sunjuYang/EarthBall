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
          <h4 class="fw-bold">공통 코드 등록</h4>

          <!-- Basic Layout -->
          <div class="col-xl">
            <div class="card mb-4">
              <div class="card-body">
                <div class="mb-3">
                  <label class="form-label">그룹코드</label> ${grp.grpCode}
                  <input type="hidden" name="grpCode" value="${grp.grpCode}">
                </div>
                <div class="mb-3">
                  <label class="form-label">그룹코드명</label> ${grp.grpCodeName}
                </div>
                <div class="mb-3">
                  <label class="form-label" for="code">공통코드</label>
                  <input type="text" class="form-control" name="code" id="code"
                         placeholder="1~8글자의 코드를 입력해주세요.(영어, 숫자 입력가능)">
                </div>
                <div class="mb-3">
                  <label class="form-label" for="codeName">공통코드명</label>
                  <input type="text" class="form-control" name="codeName" id="codeName" placeholder="공통코드명">
                </div>
                <div class="mb-3">
                  <label class="form-label" for="sortNo">우선순위 번호</label>
                  <input type="text" class="form-control" name="sortNo" id="sortNo" placeholder="sortNo">
                </div>
                <button type="button" class="btn btn-primary" onclick="codeValidate();">생성하기</button>
                <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">생성취소</button>
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
    function codeValidate() {
        let grpCode = $("input[name=grpCode]").val();
        let code = $("input[name=code]").val();
        let codeName = $("input[name=codeName]").val();
        let sortNo = $("input[name=sortNo]").val();

        let regExp = /^(?=.*[a-zA-Z0-9]).{1,8}$/;

        if (!regExp.test(code)) {
            alert("8글자의 코드를 입력해주세요.(영어, 숫자 입력가능)");
            $("input[name=code]").focus();
            return;
        }

        regExp = /^[가-힣a-zA-Z\s]{2,}$/;     // 한글, 영어 또는 공백문자가 2번 이상 반복되도록

        if (!regExp.test(codeName)) {
            alert("2글자 이상의 코드를 입력해주세요.(영어, 한글만 사용가능)");
            $("input[name=codeName]").focus();
            return;
        }

        regExp = /^[0-9]+$/;

        if (!regExp.test(sortNo)) {
            alert("우선순위는 숫자로만 입력해주세요.");
            $("input[name=sortNo]").focus();
            return;
        }

        let data = {
            code: code
            , codeName: codeName
            , sortNo: sortNo
            , grpCode: grpCode
        };

        $.ajax({
            url: "insert.code"
            , type: "post"
            , data: data
            , success: function (result) {
                if (result > 0) {
                    alert("공통코드가 생성되었습니다.");
                    console.log("공통코드 생성 성공");
                    location.href = "list.grp";
                } else {
                    alert("공통코드가 생성되지 않았습니다.");
                    console.log("공통코드 생성 실패");
                }
            }
            , error: function () {
                console.log("공통코드 생성 ajax 통신 실패");
            }
        });
    }
</script>
</body>
</html>
