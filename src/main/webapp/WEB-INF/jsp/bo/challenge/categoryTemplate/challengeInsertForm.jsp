<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html
        lang="kr"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="/resources/admin/assets/"
        data-template="vertical-menu-template-free"
>
<head>
  <jsp:include page="/WEB-INF/jsp/bo/common/commonHead.jsp"/>

  <style>
    .content {
      background-color: rgb(247, 245, 245);
      width: 80%;
      margin: auto;
    }

    .innerOuter {
      border: 1px solid lightgray;
      width: 80%;
      margin: auto;
      padding: 5% 10%;
      background-color: white;
    }

    #enrollForm > table {
      width: 100%;
    }

    #enrollForm > table * {
      margin: 5px;
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
      <jsp:include page="/WEB-INF/jsp/bo/common/commonLayoutNavbar.jsp"/>
      <!-- / Navbar -->

      <!-- Content wrapper -->
      <div class="content-wrapper">
        <!-- Content -->
        <div class="container-xxl flex-grow-1 container-p-y">
          <h4 class="fw-bold">챌린지 오픈</h4>

          <!-- Basic Layout -->
          <div class="col-xl">
            <div class="card mb-4">
              <div class="card-body">
                <form>
                  <div class="mb-3">
                    <label class="form-label">기본 정보</label>
                    <label class="form-label">챌린지명</label>
                    <input type="text" class="form-control" placeholder="챌린지명 입력란">
                    <label class="form-label">카테고리</label>
                    <input type="text" class="form-control" value="${category.categoryName}" name="" readonly>
                    <label class="form-label">도전기간</label> <br>
                    <input type="date"> ~ <input type="date"> <br>
                    <label class="form-label">썸네일 이미지</label> <br>
                    <input type="file" class="form-control-file border" name="" accept="image/*">
                  </div>
                  <hr>

                  <!--//////////////////일단은 여기까지 함////////////////////////-->

                  <div class="mb-3">


                    <!--for문!!!-->
                    <c:forEach var="temp" items="${templateList}">
                    <h5 style="color:blue">${temp.chSubTitle}</h5>

                    <!-- select 박스면!!! -->
                    <c:if test="${temp.inputType eq 'select'}">
                      <${temp.inputType} name="${temp.categoryTemplateNo}_${temp.inputType}">

                      <c:forEach var="code" items="${temp.codeList}">
                        <option value=“${code.code}”>${code.codeName}</option>
                      </c:forEach>

                      </select><br><br>
                    </c:if>

                    <!-- checkbox면!!! -->
                    <c:if test="${temp.inputType eq 'checkbox'}">
                      <c:forEach var="code" items="${temp.codeList}">
                        <input type="${temp.inputType}" id=“${temp.categoryTemplateNo}_${code.code}”
                               name="${temp.categoryTemplateNo}_${temp.inputType}">
                        <label for=“${temp.categoryTemplateNo}_${code.code}”> ${code.codeName} </label>
                      </c:forEach><br><br>
                    </c:if>


                    <!-- radio라면!!! -->
                    <c:if test="${temp.inputType eq 'radio'}">
                      <c:forEach var="code" items="${temp.codeList}">
                        <input type=${temp.inputType} id=“${temp.categoryTemplateNo}_${code.code}”
                               name=“${temp.categoryTemplateNo}_${temp.inputType}”>
                        <label for=“${temp.categoryTemplateNo}_${code.code}”> ${code.codeName} </label>
                      </c:forEach><br><br>
                    </c:if>


                    <!--textarea 일 때 -->
                    <c:if test="${temp.inputType eq 'textarea'}">
                      <textarea name=“${temp.categoryTemplateNo}_${temp.inputType}” style="resize: none; width: 800px; height: 50px"></textarea><br><br>
                  </c:if>


                  <!-- 이미지 파일일 때 -->
                  <c:if test="${temp.inputType eq 'file'}">
                  <input type=${temp.inputType} name=“${temp.categoryTemplateNo}_${temp.inputType}” accept=“image/*”><br><br>
                  </c:if>


                  <!-- number -->
                  <c:if test="${temp.inputType eq 'number'}">
                        <input type="number" name="${temp.categoryTemplateNo}_${temp.inputType}" min="0" max="100"
                               step="1"
                               class="number_size"><br><br>
                  </c:if>


                  <!-- range 일 경우 -->
                  <c:if test="${temp.inputType eq 'range'}">
                        <input type="range" name="${temp.categoryTemplateNo}_${temp.inputType}" min="0" max="100"
                               step="5"
                               class="range_size"
                               list="tickmarks"
                               style="width: 750px;"/>
                        <datalist id="tickmarks">
                          <c:forEach var="i" begin="0" end="100" step="5">
                            <option value="${i}">i</option>
                          </c:forEach>
                        </datalist><br><br>
                  </c:if>


                  <!--datetime-local : 연도, 월, 일, 오전/오후 여부, 시, 분 입력 -->
                  <c:if test="${temp.inputType eq 'datetime-local'}">
                        <input type="datetime-local" name="${temp.categoryTemplateNo}_${temp.inputType}"
                               class="datetime_size"><br><br>
                  </c:if>
                  </c:forEach>
                    <br><br>

                  <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">확인완료</button>
                  </div>
                </form>
              </div>
            </div>
        </div>
        <!-- / Content -->


        <!-- Footer -->
        <footer class="content-footer footer bg-footer-theme">
          <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
            <div class="mb-2 mb-md-0">
              ©
              <script>
                document.write(new Date().getFullYear());
              </script>
            </div>
          </div>
        </footer>
        <!-- / Footer -->

        <div class="content-backdrop fade"></div>
      </div>
      <!-- Content wrapper -->
    </div>
    <!-- / Layout page -->
  </div>

  <!-- Overlay -->
  <div class="layout-overlay layout-menu-toggle"></div>
</div>
<jsp:include page="/WEB-INF/jsp/bo/common/commonScript.jsp"/>

</div>


</body>
</html>
