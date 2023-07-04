<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>포인트 내역</title>
  <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
  <link rel="stylesheet" href="/resources/fo/css/mypage/commonMyPage.css?after">
  <link rel="stylesheet" href="/resources/fo/css/mypage/myPoint.css">

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

      <h2>포인트 내역</h2>

      <!-- content_1-->
      <div id="content_1">
     <table>
        <tr>
            <th width="20%">적립일 / 사용일</th>
            <th width="50%">사유 / 내용</th>
            <th width="30%">포인트 내역</th>
        </tr>
        <tbody class="hover">
          <c:forEach var="pl" items="${pointList}">
            <tr>
              <c:if test="${empty pointList}">
              	<td colspan="5">누적된 포인트가 없습니다.</td>
              </c:if>
              <td>${pl.pointDate}</td>
              <td>${pl.pointContent}</td>
              <td class="point_area">${pl.status} <fmt:formatNumber value="${pl.pointNum}" pattern="###,###원"/></td>
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
            <li> <a href="/list.myPoint?memberId=${loginUser.memberId}&currentPage=1" class="first">처음 페이지</a> </li>

            <c:choose>
              <c:when test="${ pageInfo.currentPage eq 1}">
                <li> <a href="#" class="arrow_left" disabled> << </a>  </li>
              </c:when>
              <c:otherwise>
                <li> <a href="/list.myPoint?memberId=${loginUser.memberId}&currentPage=${pageInfo.currentPage - 1}" class="arrow_left" disabled> << </a>  </li>
              </c:otherwise>
            </c:choose>


            <c:forEach var="page" begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1">
              <li> <a href="/list.myPoint?memberId=${loginUser.memberId}&currentPage=${page}" class="active num"> ${page} </a>  </li>
            </c:forEach>


            <c:choose>
              <c:when test="${pageInfo.currentPage eq pageInfo.maxPage}">
                <li> <a href="#" class="arrow_right" disabled> >> </a> </li>
              </c:when>
              <c:otherwise>
                <li> <a href="/list.myPoint?memberId=${loginUser.memberId}&currentPage=${pageInfo.currentPage + 1}" class="arrow_right" disabled> >> </a> </li>
              </c:otherwise>
            </c:choose>

            <li> <a href="/list.myPoint?memberId=${loginUser.memberId}&currentPage=${pageInfo.maxPage}" class="last">끝 페이지</a> </li>
          </ul>
        </div>
      </div>

      <!-- 페이징바 넣을 자리 끝 -->
		<script>
		$(function() {

			let point = document.getElementsByClassName("point_area");

			for(let i = 0; i < point.length; i++) {

				if(point[i].innerText.includes("+")) {
					point[i].style.color = "#19A7CE";
				} else {
					point[i].style.color = "red";
				}
			}

		})


		</script>


    </div>
  </div>

</div>

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp" />

</body>
</html>
