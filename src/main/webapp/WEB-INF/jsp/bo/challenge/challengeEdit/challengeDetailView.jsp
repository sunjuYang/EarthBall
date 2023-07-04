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
          <h4 class="fw-bold">챌린지 참여 게시판 상세 </h4>

          <!-- Hoverable Table rows -->
          <div class="card mb-2">
            <div class="table-responsive text-nowrap" id="challengeList">
              <table class="table">
                <tbody class="table-border-bottom-0">
                  <tr>
                    <th class="text-center chNo"><strong>챌린지명</strong></th>
                    <td class="text-center chNo"><strong>${challenge.chTitle}</strong></td>
                  </tr>
                  <tr>
                    <th class="text-center chNo"><strong>카테고리</strong></th>
                    <td class="text-center chNo"><strong>${challenge.categoryName}</strong></td>
                  </tr>
                  <tr>
                    <th class="text-center chNo"><strong>도전기간</strong></th>

                    <c:choose>
                      <c:when test="${challenge.chStartDay eq challenge.chEndDay}">
                        <td class="text-center chNo"><strong>${challenge.chStartDay}</strong></td>
                      </c:when>
                      <c:otherwise>
                        <td class="text-center chNo"><strong>${challenge.chStartDay} ~ ${challenge.chEndDay}</strong></td> <br><br>
                      </c:otherwise>
                    </c:choose>

                  </tr>
                  <tr>
                    <th class="text-center chNo"><strong>진행상태</strong></th>
                    <td class="text-center chNo"><strong>${challenge.chStatName}</strong></td>
                  </tr>
                  <tr>
                    <th class="text-center chNo"><strong>회원ID</strong></th>
                    <td class="text-center chNo"><strong>${challenge.memberId}</strong></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <!--/ Hoverable Table rows -->

          <div class="card mb-2">
            <div class="card-body">
              <h4 class="fw-bold">챌린지 썸네일</h4> <hr>
              <div class="row">
                <div class="col-sm-10">
                  <img src="${challenge.filePath}" id="thumbnail" style="width: 700px">
                </div>
              </div>
            </div>
          </div>


          <div class="card mb-2">
            <div class="card-body">
              <h4 class="fw-bold">챌린지 상세 내용</h4> <hr>
              <div class="row">
                <div class="col-sm-10">
                  ${challenge.chContent}
                </div>
              </div>
            </div>
          </div>


          <!-- HTML5 Inputs -->
          <div class="card mb-2">
            <div class="card-body">
              <div class="row">
                <div class="col-sm-10">
                  <button type="button" class="btn btn-primary" onclick="deleteChallenge(${challenge.chNo});">삭제</button>
                </div>
              </div>
            </div>
          </div>


            </div>
          </div>

          <jsp:include page="/WEB-INF/jsp/bo/common/commonScript.jsp" />
          <script type="text/javascript">

            function deleteChallenge(chNo) {
              $.ajax({
                url : "deleteBo.chall"
                , type : "post"
                , data : {chNo : chNo}
                , success : function (result) {
                  if (result > 0) {
                    alert("챌린지가 삭제되었습니다.");
                    location.href = "/list.chall";
                  } else {
                    alert("챌린지가 삭제되지 않았습니다.");
                  }
                }
                , error: function () {
                  console.log("챌린지 삭제 ajax 통신 실패");
                }
              });
            }

          </script>
</body>
</html>
