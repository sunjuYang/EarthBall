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

  <!-- js 영역-->

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
      <button class="btn_1" onclick="detailView(${challenge.chNo});">챌린지 소개</button>
      <button class="btn_2" onclick="confirmList(${challenge.chNo});">인증목록</button>
    </div> <br>


    <div class="basic_info">
      <div class="info_title">
        <h3>기본 정보</h3>
        <div class="bar_2"></div>
        <br>
      </div>

      <div class="basic_form_1">
        <span class="form_title">챌린지명</span>
        <span class="form_content">${challenge.chTitle}</span> <br><br>

        <span class="form_title">카테고리 </span>
        <span class="form_content">${challenge.categoryName}</span> <br><br>

        <span class="form_title">도전기간 </span>
        <c:choose>
          <c:when test="${challenge.chStartDay eq challenge.chEndDay}">
            <span class="form_content">${challenge.chStartDay}</span><br><br>
          </c:when>
          <c:otherwise>
            <span class="form_content">${challenge.chStartDay}</span> ~ <span class="form_content">${challenge.chEndDay}</span> <br><br>
          </c:otherwise>
        </c:choose>

        <span class="form_title">진행상태 </span>
        <span class="form_content">${challenge.chStatName}</span> <br><br>
      </div>

    </div><br>


    <div class="template">
      <div class="info_title">
        <h3>챌린지 상세 내용</h3>
        <div class="bar_2" style="width: 220px;"></div>
        <br>
      </div>


      <!-- 탬플릿 폼 안 영역 시작-->
      <div class="temp_content">
        ${challenge.chContent}
      </div>
      <!-- 탬플릿 폼 안 영역 끝-->
    </div>
  </div>

  <!-- 내용 영역 끝 -->
<script>

  function confirmFormBtn(chNo) {
    if(${ not empty loginUser}) {
      location.href="/insertForm.con?chNo=" + chNo;
    } else {
      alert("로그인 후, 이용할 수 있는 서비스입니다.");
    }
  }

  function alertMsg() {
    alert("아직 진행 예정인 챌린지 입니다.");
  }

  function updateChallenge(chNo) {
      location.href="/updateForm.chall?chNo=" + chNo;
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


  function confirmList(chNo) {
    location.href="/listView.con?chNo=" + chNo;
  }

  function detailView(chNo) {
      location.href="/detailView.chall?chNo=" + chNo;
  }

  function serviceReady() {
    alert("서비스 준비 중 입니다.");
  }
</script>



<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>

</body>
</html>
