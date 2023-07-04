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
                    <h4 class="fw-bold">공통 코드 수정</h4>

                    <!-- Basic Layout -->
                    <div class="col-xl">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="mb-3">
                                    <label class="form-label">그룹코드</label>
                                    <input type="text" class="form-control" value="${grp.grpCode}" readonly="readonly">
                                    <input type="hidden" name="grpCode" value="${grp.grpCode}">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">그룹코드명</label>
                                    <input type="text" class="form-control" value="${grp.grpCodeName}" readonly="readonly">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">공통코드</label>
                                    <input type="text" class="form-control" value="${code.code}" readonly="readonly">
                                    <input type="hidden" name="code" value="${code.code}">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="codeName">공통코드명</label>
                                    <input type="text" class="form-control" name="codeName" id="codeName" placeholder="공통코드명" value="${code.codeName}">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="sortNo">우선순위 번호</label>
                                    <input type="text" class="form-control" name="sortNo" id="sortNo" placeholder="sortNo"
                                           value="${code.sortNo}">
                                </div>
                                <button type="button" class="btn btn-primary" onclick="codeValidate();">수정하기</button>
                                <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">수정취소</button>
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

        let regExp = /^[가-힣a-zA-Z\s]{2,}$/;

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
            url: "update.code"
            , type: "post"
            , data: data
            , success: function (result) {
                if (result > 0) {
                    alert("공통코드가 수정되었습니다.");
                    location.href = 'list.grp';
                } else {
                    alert("공통코드가 수정되지 않았습니다.");
                }
            }
            , error: function () {
                console.log("공통코드 수정 ajax 통신 실패");
            }
        });
    }
</script>
</body>
</html>
