<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>챌린지 요청 전_카테고리 선정</title>

    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>

    <!-- CSS 영역-->
    <link rel="stylesheet" href="/resources/fo/css/challenge/challengeCategoryChoice.css">

</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

<!-- 내용 영역 시작 -->
<div class="wrap">
    <!-- 타이틀 시작-->
    <div id="title">
        <div id="bar_1"></div>
        <div id="title_text">챌린지 오픈 - 카테고리 선택</div>
    </div>
    <!-- 타이틀 끝-->


    <!-- 설명 부분 시작 -->
    <div class="describe">
        <div class="bar_2" style="margin-top: 30px;"></div>
        <p id="describe_1" align="center">
            각 카테고리 별로 생성할 수 있는 챌린지의 다양한 예시 입니다. <br>
            예시를 참고하여 <span class="accent">챌린지의 카테고리</span>를 <span class="accent">선택</span>해 주시기 바랍니다. <br>
        </p>
        <div class="bar_2"></div>
    </div>
    <!-- 설명 부분 끝 -->


    <!-- 선택 버튼 부분 시작 -->
    <div class="choice" align="center">

      <c:forEach var="category" items="${categoryList}">
        <div class="choice_one">
            <button class="btn_2" onclick="challengeForm(${category.categoryNo});">${category.categoryName}</button>
            <ul class="choice_one_list">
                <c:forEach var="code" items="${category.codeList}">
                    <li>${code.codeName}</li>
                </c:forEach>
            </ul>
        </div>
      </c:forEach>

    </div>
    <!-- 선택 버튼 부분 끝 -->

</div>
<!-- 내용 영역 끝 -->

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>


<script>
    function challengeForm(categoryNo) {   // 해당하는 카테고리 번호의 오픈 폼으로 연결
        location.href = "openForm.chall?categoryNo=" + categoryNo;
    }
</script>


</body>
</html>
