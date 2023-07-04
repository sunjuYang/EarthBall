<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>챌린지 인증 상세</title>

  <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>

  <!-- CSS 영역-->
  <link rel="stylesheet" href="/resources/fo/css/challenge/confirmDetailview.css">

  <!-- js 영역-->

</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

<!-- 내용 영역 시작 -->
<div class="wrap">
  <!-- 타이틀 시작-->
  <div id="title">
    <div id="bar_1"></div>
    <div id="title_text">챌린지 인증 상세</div>
  </div> <br><br>
  <!-- 타이틀 끝-->


  <div class="basic_info">
    <div class="info_title">
      <h2>기본 정보</h2>
      <div class="bar_2"></div>
      <br>
    </div>

    <div class="basic_form_1">
      <span class="form_title">챌린지명</span>
      <span class="form_content">${challenge.chTitle}</span> <br><br>


      <span class="form_title">카테고리 </span>
      <span class="form_content">${challenge.categoryName}</span> <br><br>

      <span class="form_title">도전기간 </span>
      <span class="form_content">${challenge.chStartDay}</span> ~ <span
        class="form_content">${challenge.chEndDay}</span> <br><br>

      <span class="form_title">진행상태 </span>
      <span class="form_content">진행중</span> <br><br>


    </div>

  </div> <br>


  <div class="template">
    <div class="info_title">
      <h2>인증 정보</h2>
      <div class="bar_2"></div>
      <br> <br>
    </div>

    <div class="text">
      <div class="text_class_1">
        <h1 style="color: #146C94; font-weight: 800">${chConfirm.chConTitle}</h1>

      </div>

      <c:if test="${ not empty loginUser && loginUser.memberId eq chConfirm.memberId}"> <!-- 로그인한 유저와 인증 게시글 작성자 일치 할 때만 보이는 버튼 -->
        <div class="text_class_2">
          <button class="btn_4" onclick="confirm_update(${chConfirm.chConNo});">수정</button> &nbsp;&nbsp;
          <button class="btn_4" onclick="confirm_delete(${chConfirm.chConNo});">삭제</button>
        </div>
      </c:if>
    </div>
    <br>
    <hr>
    <br>

    <!-- for문 -->
    <c:forEach var="temp" items="${templateList}">

    <!-- 탬플릿 폼 안 영역 시작-->
    <div class="temp_content">

      <!-- select 문 일 경우-->
      <c:if test="${temp.inputType eq 'select'}">
        <div class="select">
          <span class="sub_title">${temp.chSubTitle}</span>

          <c:forEach var="detail" items="${temp.chDetailInfoList}">
            <c:forEach var="code" items="${temp.codeList}">
              <c:if test="${code.code eq detail.code}">
                <span class="values">${code.codeName}</span>
              </c:if>
            </c:forEach>
          </c:forEach>
          </select>

        </div>
        <br>
      </c:if>


      <!-- checkbox 일 경우 -->
      <c:if test="${temp.inputType eq 'checkbox'}">
        <div class="checkbox">
          <span class="sub_title">${temp.chSubTitle}</span>

          <c:forEach var="detail" items="${temp.chDetailInfoList}">
            <c:forEach var="code" items="${temp.codeList}">
              <c:if test="${code.code eq detail.code}">
                <span class="values">${code.codeName} </span>
              </c:if>
            </c:forEach>
          </c:forEach>

        </div>
        <br>
      </c:if>


      <!-- radio 일 경우 -->
      <c:if test="${temp.inputType eq 'radio'}">

        <div class="radio">
          <span class="sub_title">${temp.chSubTitle}</span>

          <c:forEach var="detail" items="${temp.chDetailInfoList}">
            <c:forEach var="code" items="${temp.codeList}">
              <c:if test="${code.code eq detail.code}">
                <span class="values">${code.codeName}</span>
              </c:if>
            </c:forEach>
          </c:forEach>

        </div>
        <br>
      </c:if>


      <!-- text 일 경우 -->
      <c:if test="${temp.inputType eq 'text'}">
        <div class="text">
          <span class="sub_title">${temp.chSubTitle}</span>

          <span class="values">${temp.chDetailInfoList[0].chDetailInfoData}</span>

        </div>
        <br>
      </c:if>



      <!-- textarea 일 경우 -->
      <c:if test="${temp.inputType eq 'textarea'}">
        <div class="textarea">
          <span class="sub_title">${temp.chSubTitle}</span> <br>

          <span class="valuesTextarea">${temp.chDetailInfoList[0].chDetailInfoData}</span>

        </div>
        <br>
      </c:if>


      <!-- img 파일일 경우 -->
      <c:if test="${temp.inputType eq 'file'}">
        <div class="img">
          <span class="sub_title">${temp.chSubTitle}</span> <br>

          <div class="img_class">
            <div class="basic_form_2">
              <div class="flex-container">
                <div class="wrapper">
                  <img src="${empty temp.chDetailInfoList ? '' : temp.chDetailInfoList[0].filePath}"
                       class="image-box"/>
                  <input type="hidden" name="${temp.categoryTemplateNo}_${temp.inputType}">
                  </label>
                </div>
              </div>
            </div>
          </div>
        </div>
        <br>
      </c:if>


      <!-- number 일 경우 -->
      <c:if test="${temp.inputType eq 'number'}">
        <div class="number">
          <span class="sub_title">${temp.chSubTitle}</span> <br>

          <span class="values">${temp.chDetailInfoList[0].chDetailInfoData}</span>

        </div>
        <br>
      </c:if>


      <!-- range 일 경우 -->
      <c:if test="${temp.inputType eq 'range'}">
        <div class="range">
          <span class="sub_title">${temp.chSubTitle}</span> <br>

          <div class="ranger_class">
            <input type="range" name="${temp.categoryTemplateNo}_${temp.inputType}" min="0" max="100"
                   step="5"
                   class="range_size"
                   style="width: 750px;"
                   list="tickmarks"
                   value="${temp.chDetailInfoList[0].chDetailInfoData}">
            <datalist id="tickmarks">
              <c:forEach var="i" begin="0" end="100" step="5">
              <option value="${i}">i</option>
              </c:forEach>
          </div>
        </div>
        <br>
      </c:if>


      <!--datetime-local : 연도, 월, 일, 오전/오후 여부, 시, 분 입력 -->
      <c:if test="${temp.inputType eq 'datetime-local'}">
        <div class="datetime">
          <span class="sub_title">${temp.chSubTitle}</span> <br>

          <div class="datetime_class">
            <input type="datetime-local" name="${temp.categoryTemplateNo}_${temp.inputType}"
                   class="datetime_size"
                   value="${temp.chDetailInfoList[0].chDetailInfoData}"
                   readonly>
          </div>
        </div> <br>
      </c:if>
      </c:forEach>

      <div class="reply">
        <table id="replyArea" class="table" align="center">
          <thead>

          <c:choose>
            <c:when test="${ empty loginUser }">
              <!-- 로그인 전 -->
              <tr>
                <th colspan="3">
                  <textarea class="form-control" name="reContent" cols="55" rows="2" style="resize:none; width:900px; height: 150px;" readonly>로그인한 사용자만 이용이 가능한 서비스입니다. 로그인 후 이용해주세요.</textarea>
                </th>
                <th style="vertical-align:middle"><button class="btn_5" disabled>등록하기</button></th>
              </tr>
            </c:when>
            <c:otherwise>
              <!-- 로그인 후 -->
              <tr>
                <th colspan="3">
                  <textarea class="form-control" name="reContent" cols="55" rows="2" style="resize:none; width:1050px; height: 150px;" placeholder="댓글을 남겨주세요."></textarea>
                </th>
                <th style="vertical-align:middle"><button class="btn_5" onclick="addReply();">등록하기</button></th>
              </tr>
            </c:otherwise>
          </c:choose>

          <tr>
            <td colspan="3">댓글(<span id="rcount"></span>)</td>
          </tr>
          </thead>
          <tbody>

          </tbody>
        </table>
      </div>

      <!-- 히든 들 -->
      <input type="hidden" name="chNo" value="${challenge.chNo}"> <!-- 챌린지의 번호 -->
      <input type="hidden" name="memberId" value="${loginUser.memberId}"> <!-- 로그인한 사람 아이디 -->
      <input type="hidden" name="chConNo" value="${chConfirm.chConNo}">  <!-- 챌린지 인증의 번호 -->
      <input type="hidden" name="writer" value="${chConfirm.memberId}">  <!-- 챌린지 인증 작성자 -->

    </div>
    <!-- 탬플릿 폼 안 영역 끝-->
  </div>


  <script>
    $(document).ready(function () {
      selectReplyList();
    });

      function confirm_update(chConNo) {
          location.href="updateForm.con?chConNo=" + chConNo;
      }

      function confirm_delete(chConNo) {

        // TB_CH_CONFIRM 챌린지 인증 정보 넘기기
        let chNo = $("input[type=hidden][name=chNo]").val();            // 챌린지 일련번호
        let chConTitle = $("input[type=text][name=chConTitle]").val();      // 챌린지 인증 제목
        let memberId = $("input[type=hidden][name=writer]").val();       // 회원아이디

        let deleteConfirmInfo = { // 인증 기본 정보
          chNo: chNo
          , chConNo : chConNo
          , chConTitle: chConTitle
          , memberId: memberId
        }

        $.ajax({
           url : "/delete.con"
          , type : "post"
          , data: JSON.stringify(deleteConfirmInfo)
          , contentType: 'application/json'
          , success : function (result) {
             if(result > 0) {

                $.ajax({  // 포인트 삭감용 ajax
                       url : "/insertPoint",
                       type : "post",
                       data : { pointContent : "챌린지 인증 삭제", // 포인트 추가 / 삭감 사유
                                pointNum : 100, // 추가 / 삭감할 포인트
                                status : "-", // 추가 시 "+" / 삭감 시 "-"
                                memberId : "memberId" }// 로그인한 회원의 아이디
                });

               alert("챌린지 인증 게시글이 삭제되었습니다. 챌린지 인증 게시글을 삭제하였으므로 포인트가 삭감됩니다.");
               location.href="/listView.con?chNo=" + chNo;
             } else {
               alert("챌린지 인증 게시글이 삭제되지 않았습니다.");
             }
          }
          , error : function () {
             console.log("챌린지 인증 게시글 삭제용 ajax 통신 실패");
          }
        });
      }


      /* 댓글 용 */
      function addReply() {	// 댓글 작성용 ajax

        let chNo = $("input[type=hidden][name=chNo]").val();
        let chConNo = $("input[type=hidden][name=chConNo]").val();
        let reContent = $("[name=reContent]").val();
        let memberId = $("input[type=hidden][name=memberId]").val();

        let replyData = {
          chNo : chNo
          , chConNo : chConNo
          , reContent : reContent
          , memberId : memberId
        }

        if($("[name=reContent]").val().trim().length != 0) {	// 즉, 유효한 내용이 한글자라도 있을 경우
          $.ajax({
            url : "/rinsert.con"
            , type : "post"
            , data : replyData
            , success : function(result) {
              if(result == 'success') {
                selectReplyList();
                $("[name=reContent]").val("");	// 초기화 효과
              }
            }
            , error : function() {
              console.log("댓글 작성용 ajax 통신 실패!");
            }
          });
        } else {
          alertify.alert("알림", "댓글 작성 후 등록 요청해주세요.");
        }
      }


      function selectReplyList() {

        let chNo = $("input[type=hidden][name=chNo]").val();
        let chConNo = $("input[type=hidden][name=chConNo]").val();
        let loginUser = $("input[type=hidden][name=memberId]").val();

        let selectReplyData = JSON.stringify({
          chNo : chNo
          , chConNo: chConNo
        });

        $.ajax({
          url : "/rlist.con"
          , type : "post"
          , data : selectReplyData
          , contentType: 'application/json'
          , success : function(result) {
            console.log("reply 넘어왔나?: ", result);
            let resultStr = "";

            for(var i = 0; i < result.length; i++) {
              resultStr += "<tr>"
                      + 	"<td style='width: 10%;'>" + result[i].memberId + "</td>"
                      + 	"<td style='width: 60%;'>" + result[i].reContent + "</td>"
                      + 	"<td style='width: 20%;'>" + result[i].reCreateDate + "</td>"

                      // 로그인 한 유저인 경우에만 수정 및 삭제 버튼 추가
                      if(loginUser === result[i].memberId) {
                        resultStr += "<td style='width: 10%;'>"
                                +           "<button class='btn_6' onclick='deleteReply(" + result[i].reNo + ")'>삭제</button>"
                                +     "</td>"
                      }
                      resultStr += "</tr>";
            }
            $("#replyArea>tbody").html(resultStr);
            $("#rcount").text(result.length);
          }
          , error : function() {
            console.log("댓글 조회용 ajax 통신 실패!");
          }
        });
      }

      function editReply(reNo) {  // 댓글 수정용

      }

      function deleteReply(reNo) {  // 댓글 삭제용
        console.log("reNo : ", reNo);

        $.ajax({
          url : "/rdelete.con"
          , type : "post"
          , data : {reNo : reNo}
          , success : function (result) {
            if(result > 0) {
              console.log("댓글 삭제 성공");
              selectReplyList();
            }
          }
          , error() {
            console.log("댓글 삭제 ajax 통신 실패");
          }
        });
      }
  </script>


</div>
<!-- 내용 영역 끝 -->

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>

</body>
</html>
