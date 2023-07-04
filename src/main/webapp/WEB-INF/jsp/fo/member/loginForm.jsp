<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="https://kenwheeler.github.io/slick/slick/slick-theme.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>
	body {
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
	}
	
	.login-wrapper {
		width: 400px;
		height: 350px;
		padding: 40px;
		box-sizing: border-box;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}

	.login-wrapper > h2 {
		font-size: 24px;
		color: #19A7CE;
		margin-bottom: 20px;
	}

	#login-form > input {
		width: 100%;
		height: 48px;
		padding: 0 10px;
		box-sizing: border-box;
		margin-bottom: 16px;
		border-radius: 6px;
		background-color: #F8F8F8;
	}

	#login-form > input::placeholder {
		color: #D2D2D2;
	}

	#login-form > input[type="submit"] {
		color: #fff;
		font-size: 16px;
		background-color: #19A7CE;
		margin-top: 20px;
	}
	.loginLogo { text-decoration : none; }
	.logo{margin: 0 auto;}
	
</style>

<title>Login -</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
    <div class="login-wrapper">
        <h2><a href="/">
        <img class="logo" src="/resources/fo/img/logo2.png" alt="지구공 로고"></a></h2>
        <form id="login-form" action="${not empty store ? 'storeListView.st' : 'login.me'}" method="post">
		<c:if test="${not empty store}">
			<input type="hidden" name="store" value="${store}">
		</c:if>
		<input type="text" id="memberId" name="memberId" placeholder="아이디를 입력해주세요" value="${cookie.saveId.value}" required>
		<input type="password" id="memberPwd" name="memberPwd" placeholder="비밀번호를 입력해주세요" required>
		
		<c:choose>
			<c:when test="${not empty cookie.saveId}">			
				<label>
					<input type="checkbox" id="saveId" name="saveId" value="y" checked>
					<label for="saveId">아이디 저장</label>
					
				</label>
			</c:when>
			<c:otherwise>
				<label>
					<input type="checkbox" id="saveId" name="saveId" value="y">
					<label for="saveId">아이디 저장</label>
				</label>
			</c:otherwise>	
		</c:choose>
		
		<input type="submit" value="로그인">
		<input type="button" value="홈으로" onclick="location.href='/'">
		</form>
    </div>
    
    
    <% if(request.getAttribute("errorMsg") != null) { %>
	    <script>
	        alert('<%=request.getAttribute("errorMsg")%>');
	    </script>
	<% } %>
</body>
</html>
		