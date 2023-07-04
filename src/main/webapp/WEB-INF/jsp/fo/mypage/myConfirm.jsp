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

    <!-- js 영역-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

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

            <h2>인증한 챌린지 <span>${ chConfirms.size() }</span></h2>
            <button class="btn_4" onclick="myChallengeList('${ loginUser.memberId }');">오픈한 챌린지 보기</button><br><br>

            <div class="container mt-3">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>No</th>
                        <th>Title</th>
                        <th>ID</th>
                        <th>Data</th>
                    </tr>
                    </thead>


                    <tbody>
                    <c:forEach var="confirm" items="${chConfirms}">
                        <tr onclick="detailViewConfirm(${confirm.chConNo});">
                            <td>${confirm.chConNo}</td>
                            <td>${confirm.chConTitle}</td>
                            <td>${confirm.memberId}</td>
                            <td>${confirm.chConCreateDate}</td>
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
            </div>

            <!-- 페이징바 넣을 자리 시작 -->
            <div id="page">
                <div class="page_btn" align="center">

                    <ul class="pagination">
                        <li> <a href="/list.myConfirm?memberId=${loginUser.memberId}&currentPage=1" class="first">처음 페이지</a> </li>

                        <c:choose>
                            <c:when test="${ pageInfo.currentPage eq 1}">
                                <li> <a href="#" class="arrow_left" disabled> << </a>  </li>
                            </c:when>
                            <c:otherwise>
                                <li> <a href="/list.myConfirm?memberId=${loginUser.memberId}&currentPage=${pageInfo.currentPage - 1}" class="arrow_left" disabled> << </a>  </li>
                            </c:otherwise>
                        </c:choose>


                        <c:forEach var="page" begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1">
                            <li> <a href="/list.myConfirm?memberId=${loginUser.memberId}&currentPage=${page}" class="active num"> ${page} </a>  </li>
                        </c:forEach>


                        <c:choose>
                            <c:when test="${pageInfo.currentPage eq pageInfo.maxPage}">
                                <li> <a href="#" class="arrow_right" disabled> >> </a> </li>
                            </c:when>
                            <c:otherwise>
                                <li> <a href="/list.myConfirm?memberId=${loginUser.memberId}&currentPage=${pageInfo.currentPage + 1}" class="arrow_right" disabled> >> </a> </li>
                            </c:otherwise>
                        </c:choose>

                        <li> <a href="/list.myConfirm?memberId=${loginUser.memberId}&currentPage=${pageInfo.maxPage}" class="last">끝 페이지</a> </li>
                    </ul>
                </div>
            </div>

            <!-- 페이징바 넣을 자리 끝 -->



        </div>
    </div>

</div>

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp" />

<script>

    function myChallengeList(memberId) {
        location.href="/list.myChallenge?memberId=" + memberId;
    }

    function detailViewConfirm(chConNo) {
        location.href="/detailView.con?chConNo=" + chConNo;
    }
</script>

</body>
</html>
