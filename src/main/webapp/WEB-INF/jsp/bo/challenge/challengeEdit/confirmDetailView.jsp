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
    .sub_title {
      padding: 7px;
      display: inline-block;
      font-size: 20px;
      margin-left: 45px;
      border-radius: 5px;
      color: #146C94;
      font-weight: 900;
      border: #146C94 1px dashed;
      display: inline-block;
    }

    .values {
      margin-left: 40px;
      display: flex;
      align-items: center;
      font-size: 18px;
    }

    .valuesTextarea {
      margin-left: 60px;
      display: flex;
      align-items: center;
      font-size: 18px;
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
          <h4 class="fw-bold">챌린지 인증 게시판 상세 </h4>

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
                  <td class="text-center chNo" id="memberId"><strong>${confirm.memberId}</strong></td>
                </tr>
                </tbody>
              </table>
            </div>
          </div>
          <!--/ Hoverable Table rows -->

          <div class="card mb-2">
            <div class="card-body">
              <h4 class="fw-bold" id="chConTitle">${confirm.chConTitle}</h4>
              <input type="hidden" name="chNo" value="${confirm.chNo}">
            </div>
          </div>


          <div class="card mb-2">
            <div class="card-body">
              <h4 class="fw-bold">챌린지 상세 내용</h4> <hr>
              <div class="row">
                <div class="col-sm-10">
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
                                     class="image-box" style="width: 800px"/>
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
                </div>
              </div>
            </div>
          </div>


          <!-- HTML5 Inputs -->
          <div class="card mb-2">
            <div class="card-body">
              <div class="row">
                <div class="col-sm-10">
                  <button type="button" class="btn btn-primary" onclick="deleteConfirm(${confirm.chConNo});">삭제</button>
                </div>
              </div>
            </div>
          </div>


        </div>
      </div>

      <jsp:include page="/WEB-INF/jsp/bo/common/commonScript.jsp" />
      <script type="text/javascript">

        function deleteConfirm(chConNo) {

          let chNo = $("input[type=hidden][name=chNo]").val();            // 챌린지 일련번호
          let chConTitle = '${confirm.chConTitle}';      // 챌린지 인증 제목
          let memberId = '${confirm.memberId}';    // 회원아이디

          let deleteConfirmInfo = { // 인증 기본 정보
            chNo: chNo
            , chConNo : chConNo
            , chConTitle: chConTitle
            , memberId: memberId
          }

          $.ajax({
            url : "deleteBo.conf"
            , type : "post"
            , data : JSON.stringify(deleteConfirmInfo)
            , contentType: 'application/json'
            , success : function (result) {
              if (result > 0) {
                alert("챌린지 인증이 삭제되었습니다.");
                location.href = "/list.conf";
              } else {
                alert("챌린지 인증이 삭제되지 않았습니다.");
              }
            }
            , error: function () {
              console.log("챌린지 인증 삭제 ajax 통신 실패");
            }
          });
        }

      </script>
</body>
</html>
