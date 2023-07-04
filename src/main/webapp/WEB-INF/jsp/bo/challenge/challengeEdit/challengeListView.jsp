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

  <style>
    #searchForm {
      width:80%;
      margin:auto;
    }
    #searchForm>* {
      float:left;
      margin:5px;
    }
    .select {width:20%;}
    .text {width:53%;}
    .searchBtn {width:20%;}

    .custom-select {
      height: 40px;
      width: 120px;
    }

  </style>

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
          <h4 class="fw-bold">챌린지 참여 게시판 </h4>
          <!-- HTML5 Inputs -->
          <div class="card mb-2">
            <div class="card-body">
              <div class="row">
                <div class="col-sm-10">

                  <form id="searchForm" action="/search.chall" method="get" align="center">
                    <div class="text">
                      <input type="text" class="form-control" placeholder="검색어를 입력하세요." name="keyword" required>
                    </div>
                    <button type="submit" class="btn btn-primary">검색</button>
                  </form>

                </div>
              </div>
            </div>
          </div>
          <!-- Hoverable Table rows -->
          <div class="card mb-2">
            <div class="table-responsive text-nowrap" id="challengeList">
              <table class="table table-hover">
                <thead>
                <tr>
                  <th class="text-center" width="10%">챌린지 번호</th>
                  <th class="text-center" width="15%">카테고리</th>
                  <th class="text-center" width="25%">챌린지명</th>
                  <th class="text-center" width="20%">챌린지 기간</th>
                  <th class="text-center" width="20%">진행상태</th>
                  <th class="text-center" width="10%">회원ID</th>
                </tr>
                </thead>
                <tbody class="table-border-bottom-0">
                <c:forEach var="chall" items="${ boChallengeList }">
                  <tr>
                    <td class="text-center chNo" data-ch-no="${chall.chNo}"><strong>${chall.chNo}</strong></td>
                    <td class="text-center chNo" data-ch-no="${chall.chNo}"><strong>${chall.categoryName}</strong></td>
                    <td class="text-center chNo" data-ch-no="${chall.chNo}"><strong>${chall.chTitle}</strong></td>
                    <td class="text-center chNo" data-ch-no="${chall.chNo}"><strong>${chall.day}</strong></td>
                    <td class="text-center chNo" data-ch-no="${chall.chNo}"><strong>${chall.chStatName}</strong></td>
                    <td class="text-center chNo" data-ch-no="${chall.chNo}"><strong>${chall.memberId}</strong></td>
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
                        <a class="page-link" href="list.chall?currentPage=${ pageInfo.currentPage - 1 }"><i
                                class="tf-icon bx bx-chevron-left"></i></a>
                      </li>
                    </c:otherwise>
                  </c:choose>
                  <c:forEach var="page" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1">
                    <li class="page-item">
                      <a class="page-link" href="list.chall?currentPage=${ page }">${ page }</a>
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
                        <a class="page-link" href="list.chall?currentPage=${ pageInfo.currentPage + 1 }"><i
                                class="tf-icon bx bx-chevron-right"></i></a>
                      </li>
                    </c:otherwise>
                  </c:choose>
                </ul>
              </nav>
              <!--/ Basic Pagination -->
            </div>
          </div>

<jsp:include page="/WEB-INF/jsp/bo/common/commonScript.jsp" />
<script type="text/javascript">

  $(document).on('click', '#challengeList .chNo', function () {
    let chNo = $(this).data('chNo');
    location.href = "/detail.chall?chNo=" + chNo;
  });

</script>
</body>
</html>
