<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>환경일기</title>
  <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
  <link rel="stylesheet" href="/resources/fo/css/mypage/commonMyPage.css?after">
  <link rel="stylesheet" href="/resources/fo/css/mypage/diary.css">

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

       <h2>참여한 나의 일기 <span>${ list.size() }</span></h2>
        <div class="list-area">
		<c:forEach var="d" items="${ list }">
           <div class="thumbnail">
               <div class="thumbnail1">
                   <div class=a>
                       <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                            class="bi-eye-fill" viewBox="0 0 16 16">
                           <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                           <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                       </svg>
                       <div>${ d.dyCount }</div>
                   </div>

                   <div class="imgBorder">
                    <img src="${ d.changeName }">
                    <input type="hidden"  class="bno" value="${ d.dyBoardNo }">
                   </div>
               </div>
               <div class="title2">${ d.dyBoardTitle }
                	 <input type="hidden"  class="bno" value="${ d.dyBoardNo }">
               </div>

               <div class="thumbnail2">
                   <div>
                       <div class="photo" style="margin-right: 10px;"><img src="/resources/fo/img/logo.png"></div>
                       <div class="myContent">
                           <div>${ d.dyBoardWriter }</div>
                           <div class="myDate">${ d.dyCreateDate }</div>
                       </div>
                       <!--
                       <div class="icon1">
                           <div style="padding: 0; height: 22px;">
                               <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor"
                                    class="bi-heart" viewBox="0 0 16 16">
                                   <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357
                                   3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868
                                   3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                               </svg>
                           </div>
                           <div><span id="icon2">20</span></div>
                       </div>
                        -->
                   </div>
               </div>
           </div>
         	</c:forEach>

         	 <script>
		                	$(function() {
		                		 $('.imgBorder, .title2').click(function() {
		                			 let bno = $(this).children(".bno").val();

		                			 //console.log(bno);

		                			location.href = "diaryDetailView.bo?bno=" +bno ;
		                		 });
		                	});

		                </script>

         </div>

          <!-- 페이징바 넣을 자리 시작 -->
      <div id="page">
        <div class="page_btn" align="center">

          <ul class="pagination">
            <li> <a href="/diaryList.me?memberId=${loginUser.memberId}&currentPage=1" class="first">처음 페이지</a> </li>

            <c:choose>
              <c:when test="${ pi.currentPage eq 1}">
                <li> <a href="#" class="arrow_left" disabled> << </a>  </li>
              </c:when>
              <c:otherwise>
                <li> <a href="/diaryList.me?memberId=${loginUser.memberId}&currentPage=${pi.currentPage - 1}" class="arrow_left" disabled> << </a>  </li>
              </c:otherwise>
            </c:choose>


            <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}" step="1">
              <li> <a href="/diaryList.me?memberId=${loginUser.memberId}&currentPage=${page}" class="active num"> ${page} </a>  </li>
            </c:forEach>


            <c:choose>
              <c:when test="${pi.currentPage eq pi.maxPage}">
                <li> <a href="#" class="arrow_right" disabled> >> </a> </li>
              </c:when>
              <c:otherwise>
                <li> <a href="/diaryList.me?memberId=${loginUser.memberId}&currentPage=${pi.currentPage + 1}" class="arrow_right" disabled> >> </a> </li>
              </c:otherwise>
            </c:choose>

            <li> <a href="/diaryList.me?memberId=${loginUser.memberId}&currentPage=${pi.maxPage}" class="last">끝 페이지</a> </li>
          </ul>
        </div>
      </div>

      <!-- 페이징바 넣을 자리 끝 -->

         </div>
     </div>
 </div>

 <jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp" />

</body>
</html>