<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="common.jsp"/>
<link rel="stylesheet" href="/resources/fo/css/common/main.css">
<script type="text/javascript" src="/resources/fo/js/common/main.js"></script>

</head>
<body>

	<jsp:include page="header.jsp"/>

	<div id="container">
        <!-- 배너 -->
        <div class="mainSlide">
            <div><img src="/resources/fo/img/banner1.png" onclick="location.href='detailView.pro?productNo=94'"></div>
            <div><img src="/resources/fo/img/banner2.png" onclick="location.href='detailView.pro?productNo=92'"></div>
            <div><img src="/resources/fo/img/banner3.png" onclick="location.href='detailView.pro?productNo=93'"></div>
        </div>
        <!--  베스트 아이템 -->
        <div id="bestArea">
            <div id="bestBox">
                <div id="bestText">
                    <div style="display: flex;">
                        <div style="width: 8px; height: 45px; margin-right: 8px; background-color: #19a7ce"></div>
                        <h1 style="margin: 0;">BEST SELLER</h1>
                    </div>
                    <br>
                    <p style="margin: 0;">
                        제로웨이스트 입문자도 <br>
                        어려움 없이 사용할 수 있는 <br>
                        베스트 제품
                    </p>
                </div>
                <div><img src="/resources/fo/img/best1.png" id="bestImg"></div>
            </div>
            <div id="bestList">
                <!-- 아이템 시작 -->
                <c:forEach var="p" items="${productList}">
                    <div class="product" onclick="detailView();">
                        <div>
                            <a href="detailView.pro?productNo=${ p.productNo }" class="product-img"><img src="/resources/fo/upfiles/${ p.changerName }"></a>
                        </div>
                        <div class="product-info">
                            <div class="product-name">
                                <a href="detailView.pro?productNo=${ p.productNo }"><p>${ p.productName }</p></a>
                            </div>
                            <div class="product-price">
                                <p>${ p.price }원</p>
                            </div>
                            <div class="product-icon">
                                <div><i class="xi-speech-o"></i>${ p.reviewCount }</div>
                                <div><i class="xi-heart-o"></i>${ p.likeCount }</div>
                                <div><i class="xi-cart-o"></i></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <!-- 아이템 끝 -->
            </div>
        </div>
        <!-- 챌린지 -->
        <div id="challengeArea">
            <div id="challengeBox">
                <div id="challengeText">
                    <div style="display: flex;">
                        <div style="width: 8px; height: 90px; margin-right: 8px; background-color: #19a7ce"></div>
                        <h1 style="margin: 0;">NEW CHALLENGE</h1>
                    </div>
                    <br>
                    <p style="margin: 0;">
                        환경보호 챌린지는 환경 문제에 <br>
                        대한 인식을 높이고, 사회적인 <br>
                        변화를 이끌기 위해 개인 또는 <br>
                        그룹이 참여하는 활동입니다. 이 <br>
                        챌린지들은 사람들이 지구 환경 <br>
                        에 대한 책임을 느끼고 행동을 <br>
                        취하도록 독려하며, 지속 가능한 <br>
                        방식으로 삶을 살도록 돕습니다.
                    </p>
                </div>
                <div><img src="/resources/fo/img/banner4.png" id="challengeImg"></div>
            </div>
            <div id="challengeList">

                <!-- 카드 한 장 시작 -->
                <c:forEach var="chall" items="${challengeList}">
                <div class="chall_Card" onclick="challengeDetailView('${chall.chNo}');">
                    <div class="chall_Title">
                        <table>
                            <input type="hidden" name="chNo" value="${chall.chNo}">
                            <tr>
                                <td rowspan="2"><img src="/resources/fo/img/logo.png" style="width: 50px; height: 50px;" alt=""></td>
                                <td id="challTitle"><h5 style="margin: 5px;">${chall.chTitle}</h5></td>
                            </tr>
                            <tr>
                                <td><span class="userId">${chall.memberId}</span></td>
                            </tr>
                        </table>
                    </div>

                    <img src="${chall.filePath}" alt="">

                    <div class="chall_Date" align="center">
                        <c:choose>
                            <c:when test="${chall.chStartDay eq chall.chEndDay}">
                                <span>${chall.chStartDay}</span>
                            </c:when>
                            <c:otherwise>
                                <span>${chall.chStartDay} ~ ${chall.chEndDay}</span>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="chall_Tag">
                        <ul>
                            <li><span class="tag">${chall.categoryName}</span></li>
                            <li><span class="tag">${chall.chStatName}</span></li>
                        </ul>
                    </div>
                </div>
                </c:forEach>
                <!-- 카드 한 장 끝 -->
                </div>
            </div>



        <!-- 에코 다이어리 -->
        <div id="diaryArea">
            <div id="diaryBox">
                <div id="diaryText">
                    <div style="display: flex;">
                        <div style="width: 8px; height: 45px; margin-right: 8px; background-color: #19a7ce"></div>
                        <h1 style="margin: 0;">ECO DIARY</h1>
                    </div>
                    <br>
                    <p style="margin: 0;">
                        환경일기는 환경보호 및<br>
                        지속 가능성을 촉진하기 위해 <br>
                        개발된 다이어리입니다.
                    </p>
                </div>
                <div><img src="/resources/fo/img/k.png" id="diaryImg"></div>
            </div>

            <!-- <div class="diarySlide"> -->
            <div class="list-area">
                <c:forEach var="d" items="${ diaryList }">
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
                            <div class="mainContent">
                                <div class="photo" style="margin-right: 10px;"><img src="/resources/fo/img/logo.png"></div>
                                <div class="dyC">
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
                                </div> -->

                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <script>
                $(function() {
                        $('.imgBorder, .title2').click(function() {
                            let bno = $(this).children(".bno").val();

                            //console.log(bno);

                        location.href = "diaryDetailView.bo?bno=" +bno ;
                        });
                });

            </script>


    </div>  <!-- container 끝 : 이 밖에 나가면 틀 튀어나감... -->
</div>

<script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "8094ae3e-4590-4830-854a-710d02743bc2"
  });
</script>

    <jsp:include page="footer.jsp"/>

</body>
</html>
