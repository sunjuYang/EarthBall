<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>오픈한 챌린지</title>
  <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
  <link rel="stylesheet" href="/resources/fo/css/mypage/commonMyPage.css?after">
  <link rel="stylesheet" href="/resources/fo/css/mypage/myChallenge.css">

</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp" />

<!-- 메인 컨텐츠 -->
<div id="container">
  <!-- Sidebar Menu -->
  <jsp:include page="/WEB-INF/jsp/fo/common/myPageSidebar.jsp" />
  <!-- Main Content -->
  <div class="main-content">

    <jsp:include page="/WEB-INF/jsp/fo/common/mypageProfile.jsp" />

    <div class="main-content2">

      <h2>오픈한 챌린지 <span>${ challengeList.size() }</span></h2>
      <button class="btn_4" onclick="myConfirmList('${ loginUser.memberId }');">인증한 챌린지 보기</button><br><br>

      <!-- content_1 시작 -->
      <div id="content_1">
        <!-- 카드 한 장 시작 -->
        <c:forEach var="chall" items="${challengeList}">
          <div class="chall_Card" onclick="challengeDetailView('${chall.chNo}');">
            <div class="chall_Title">
              <table>
                <input type="hidden" name="chNo" value="${chall.chNo}">
                <tr>
                  <td rowspan="2"><img src="/resources/fo/img/logo.png" style="width: 50px; height: 50px;" alt=""></td>
                  <td id="challTitle"><h5 style="margin: 5px;">${chall.chTitle}</h5></td>
                </tr>
                <tr>
                  <td><span class="userId">${chall.memberId}</span></td>
                </tr>
              </table>
            </div>

            <img src="${chall.filePath}" style="width: 95%;">

            <div class="chall_Date" align="center">
              <c:choose>
                <c:when test="${chall.chStartDay eq chall.chEndDay}">
                  <span>${chall.chStartDay}</span>
                </c:when>
                <c:otherwise>
                  <span>${chall.chStartDay} ~ ${chall.chEndDay}</span>
                </c:otherwise>
              </c:choose>
            </div>

            <div class="chall_Tag">
              <ul>
                <li><span class="tag">${chall.categoryName}</span></li>
                <li><span class="tag">${chall.chStatName}</span></li>
              </ul>
            </div>
          </div>
        </c:forEach>
        <!-- 카드 한 장 끝 -->

      </div>
      <!-- content_1 끝-->


      <!-- 페이징바 넣을 자리 시작 -->
      <div id="page">
        <div class="page_btn" align="center">

          <ul class="pagination">
            <li> <a href="/list.myChallenge?memberId=${loginUser.memberId}&currentPage=1" class="first">처음 페이지</a> </li>

            <c:choose>
              <c:when test="${ pageInfo.currentPage eq 1}">
                <li> <a href="#" class="arrow_left" disabled> << </a>  </li>
              </c:when>
              <c:otherwise>
                <li> <a href="/list.myChallenge?memberId=${loginUser.memberId}&currentPage=${pageInfo.currentPage - 1}" class="arrow_left" disabled> << </a>  </li>
              </c:otherwise>
            </c:choose>


            <c:forEach var="page" begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1">
              <li> <a href="/list.myChallenge?memberId=${loginUser.memberId}&currentPage=${page}" class="active num"> ${page} </a>  </li>
            </c:forEach>


            <c:choose>
              <c:when test="${pageInfo.currentPage eq pageInfo.maxPage}">
                <li> <a href="#" class="arrow_right" disabled> >> </a> </li>
              </c:when>
              <c:otherwise>
                <li> <a href="/list.myChallenge?memberId=${loginUser.memberId}&currentPage=${pageInfo.currentPage + 1}" class="arrow_right" disabled> >> </a> </li>
              </c:otherwise>
            </c:choose>

            <li> <a href="/list.myChallenge?memberId=${loginUser.memberId}&currentPage=${pageInfo.maxPage}" class="last">끝 페이지</a> </li>
          </ul>
        </div>
      </div>

      <!-- 페이징바 넣을 자리 끝 -->



    </div>
  </div>

</div>

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp" />

<script>
  // 챌린지 상세조회로 넘기기
  function challengeDetailView(chNo) {
    location.href="/detailView.chall?chNo=" + chNo;
  }

  function myConfirmList(memberId) {
    location.href="/list.myConfirm?memberId=" + memberId;
  }
</script>

</body>
</html>
