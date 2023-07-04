<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>챌린지 상세 화면</title>

  <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>

  <!-- CSS 영역-->
  <link rel="stylesheet" href="/resources/fo/css/challenge/challengeDetailView.css">
  <link rel="stylesheet" href="/resources/fo/css/challenge/confirmListView.css">

  <!-- js 영역-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

<!-- 내용 영역 시작 -->
<div class="wrap">
  <!-- 타이틀 시작-->
  <div id="title">

    <div id="title_1">
      <img src="${challenge.filePath}" id="thumbnail" alt="">
    </div>

    <div id="title_2">
      <div id="title_2_1">
        <!-- <div id="bar_1"></div> -->
        <div id="title_text">에코챌린지</div>
        <div id="title_title">${challenge.chTitle}</div>
      </div>
      <div id="title_2_2">
                <span>
                <div id="title_profile_photo" style="  width: 150px;">
                  <img src="/resources/fo/img/logo.png" id="profile" alt="">
                </div>
              </span>
        <span style="  display: flex;">

                <div id="title_profile_btn" style="width: 300px;">
                  <div style="font-size: 25px;">
                    ${challenge.memberId}
                  </div>
                  <div style="  text-align: right;">
                    <c:if test="${ not empty loginUser && loginUser.memberId eq challenge.memberId}">
                      <button class="btn_4" onclick="updateChallenge(${challenge.chNo});">수정</button>
                      <button class="btn_4" onclick="deleteChallenge(${challenge.chNo})">삭제</button>
                    </c:if>
                  </div>
                  <div>
                    <c:choose>
                      <c:when test="${challenge.chStatName eq '진행중' || challenge.chStatName eq '진행완료'}" >
                        <button class="btn_3" onclick="confirmFormBtn(${challenge.chNo});">챌린지 참여(인증하기)</button>
                      </c:when>
                      <c:otherwise>
                        <button class="btn_3" onclick="alertMsg();">챌린지 참여(인증하기)</button>
                      </c:otherwise>
                    </c:choose>
                  </div>
                  <div>
                    <button class="btn_3" onclick="serviceReady();">챌린지 채팅 참여</button>
                  </div>
                </div>
              </span>
      </div>
    </div>

  </div>
  <!-- 타이틀 끝-->

  <div class="btn_div">
    <button class="btn_2" onclick="detailViewChallenge(${challenge.chNo});">챌린지 소개</button>
    <button class="btn_1" onclick="confirmList(${challenge.chNo});">인증목록</button>
  </div> <br>


  <div class="basic_info">
    <div class="info_title">
      <h2>인증 게시판</h2>
      <div class="bar_2"></div>
      <br>
    </div>


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

        <c:if test="${empty chConfirms}">
          <tr>
            <td colspan="4">챌린지 인증 게시글이 없습니다.</td>
          </tr>
        </c:if>

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
  </div>

  <!-- 페이징바 넣을 자리 시작 -->
  <div id="page">
    <div class="page_btn" align="center">


      <ul class="pagination">
        <li> <a href="/listView.con?currentPage=1" class="first">처음 페이지</a> </li>

        <c:choose>
          <c:when test="${ pageInfo.currentPage eq 1}">
            <li> <a href="#" class="arrow_left" disabled> << </a>  </li>
          </c:when>
          <c:otherwise>
            <li> <a href="/listView.con?currentPage=${pageInfo.currentPage - 1}" class="arrow_left" disabled> << </a>  </li>
          </c:otherwise>
        </c:choose>


        <c:forEach var="page" begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1">
          <li> <a href="/listView.con?currentPage=${page}" class="active num"> ${page} </a>  </li>
        </c:forEach>

        <c:choose>
          <c:when test="${pageInfo.currentPage eq pageInfo.maxPage}">
            <li> <a href="#" class="arrow_right" disabled> >> </a> </li>
          </c:when>
          <c:otherwise>
            <li> <a href="/listView.con?currentPage=${[pageInfo.currentPage + 1]}" class="arrow_right" disabled> >> </a> </li>
          </c:otherwise>
        </c:choose>

        <li> <a href="/listView.con?currentPage=${pageInfo.maxPage}" class="last">끝 페이지</a> </li>
      </ul>
    </div>
  </div>

  <!-- 페이징바 넣을 자리 끝 -->


</div>

<!-- 내용 영역 끝 -->
<script>
    function confirmFormBtn(chNo) {
        location.href="/insertForm.con?chNo=" + chNo;
    }

    function updateChallenge(chNo) {
        location.href="/updateForm.chall?chNo=" + chNo;
    }

    function alertMsg() {
      alert("아직 진행 예정인 챌린지 입니다.");
    }

    function deleteChallenge(chNo) {

        $.ajax({
            url : "delete.chall"
            , type : "get"
            , data : {
                chNo : chNo
            }
            , success : function (result) {
                if(result > 0) {
                    alert("챌린지가 삭제되었습니다.");
                    location.href="/main.chall";
                } else {
                    alert("챌린지가 삭제되지 않았습니다.");
                }
            }
            , error : function () {
                console.log("챌린지 삭제용 ajax 통신 실패")
            }
        });
    }

    // 챌린지 상세조회로 넘기기
    function detailViewChallenge(chNo) {
      location.href="/detailView.chall?chNo=" + chNo;
  }

  function detailViewConfirm(chConNo) {
      location.href="/detailView.con?chConNo=" + chConNo;
  }

  function serviceReady() {
      alert("서비스 준비 중 입니다.");
  }

</script>



<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>

</body>
</html>
