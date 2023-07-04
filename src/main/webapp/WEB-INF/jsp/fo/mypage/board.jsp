<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>1:1문의 내역</title>
  <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
  <link rel="stylesheet" href="/resources/fo/css/mypage/commonMyPage.css?after">
  <link rel="stylesheet" href="/resources/fo/css/mypage/myChallenge.css">

  <style type="text/css">

    .hover tr:hover {
    background-color: #f5f5f5;
  	}

  	 table {
        border-collapse: collapse;
        width: 100%;
        }

        td, th {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
        }

  </style>
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

      <h2>1:1문의 <span>${ mylist.size()} 개</span></h2>

      <!-- content_1-->
      <div id="content_1">
     <table>
        <tr>
            <th>No</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>작성일</th>
        </tr>
        <tbody class="hover">
            <c:forEach var="bm" items="${mylist}">
                <tr onclick="boardDetailView('${bm.boardNo}');">
                    <td class="bno">${bm.boardNo}</td>
                    <td>${bm.boardTitle}</td>
                    <td>${bm.memberId}</td>
                    <td>${bm.boardDate}</td>
                    <input type="hidden" value="${bm.originName}" name="originName" />

                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
      <!-- content_1 끝-->


      <!-- 페이징바 넣을 자리 시작 -->
      <div id="page">
        <div class="page_btn" align="center">

          <ul class="pagination">
            <li> <a href="/list.mybo?memberId=${loginUser.memberId}&currentPage=1" class="first">처음 페이지</a> </li>

            <c:choose>
              <c:when test="${ pi.currentPage eq 1}">
                <li> <a href="#" class="arrow_left" disabled> << </a>  </li>
              </c:when>
              <c:otherwise>
                <li> <a href="/list.mybo?memberId=${loginUser.memberId}&currentPage=${pageInfo.currentPage - 1}" class="arrow_left" disabled> << </a>  </li>
              </c:otherwise>
            </c:choose>


            <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}" step="1">
              <li> <a href="/list.mybo?memberId=${loginUser.memberId}&currentPage=${page}" class="active num"> ${page} </a>  </li>
            </c:forEach>


            <c:choose>
              <c:when test="${pi.currentPage eq pi.maxPage}">
                <li> <a href="#" class="arrow_right" disabled> >> </a> </li>
              </c:when>
              <c:otherwise>
                <li> <a href="/list.mybo?memberId=${loginUser.memberId}&currentPage=${[pi.currentPage + 1]}" class="arrow_right" disabled> >> </a> </li>
              </c:otherwise>
            </c:choose>

            <li> <a href="/list.mybo?memberId=${loginUser.memberId}&currentPage=${pageInfo.maxPage}" class="last">끝 페이지</a> </li>
          </ul>
        </div>
      </div>

      <!-- 페이징바 넣을 자리 끝 -->



    </div>
  </div>

</div>

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp" />

<script>
  function boardDetailView(boardNo) {
    location.href="/detail.bo?bno=" + boardNo;
  }
</script>

</body>
</html>
