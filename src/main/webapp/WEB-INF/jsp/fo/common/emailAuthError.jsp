<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 2023-06-18
  Time: 오후 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>이메일 인증 후 사용가능한 서비스입니다.</title>

    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>

    <link rel="stylesheet" href="/resources/fo/css/common/emailAuthError.css">
</head>
<body>

<div class="container">
  <h1>Email Verification</h1>
  <p>이메일 인증 후 이용이 가능합니다.</p>
  <button onclick="emailAuth();">인증하기</button>
</div>

<script>
  function emailAuth() {
    location.href="/myPage.me?memberId=" + '${loginUser.memberId}';
  }
</script>

</body>
</html>
