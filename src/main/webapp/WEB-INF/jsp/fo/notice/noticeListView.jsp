<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

	<jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>

 	<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="https://kenwheeler.github.io/slick/slick/slick-theme.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>




    <style>

    .hover tr:hover {
    background-color: #f5f5f5;
  	}

        /* ---------------------------------- */

        .search2>form {
            position: relative;
            width: 200px;

        }

        .search2>form>img {
            position : absolute;
    width: 17px;
    top: 10px;
    right: 30px;
    margin: 0;
        }

        .search2>form>input {
           border: 1px solid #bbb;
		    border-radius: 8px;
		    padding: 10px 12px;
		    font-size: 14px;
        }

        /* ---------------------------------- */


        /* 공지사항 */
        table {
        border-collapse: collapse;
        width: 100%;
        }

        td, th {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
        }

        #boardtext {
        background-color:#ffffff;
        border: solid 0.1rem #19a7ce;
        border-radius: 0.7rem;
        color: #19a7ce;
        font-family : Roboto, 'Source Sans Pro';
        font-size: 1.2rem;
        font-weight: 500;
        line-height: 1.1725;
        text-align: center;
        }

        .auto-group-t8bp-ei9 {
        align-items:  center;
        flex-shrink:  0;
        height : 4.6rem;
        margin-bottom: 11.9rem;
        width: 100%;
        }

        .btn-group { float: right; }

        #list, #insertList { /* 버튼크기를 지정 */
              font-size: 18px;
		    width: 100px;
		    height: 100%;
		    border: none;
		    color: white;
		    border-radius: 5px;
		    background-color: #19A7CE;
		    cursor: pointer;
        }

        #QZWUheUHEXEqWaaaEWt8BP {
        background-color: #19a7ce;
        box-shadow: 0 0.4rem 0.4rem rgba(0, 0, 0, 0.25);
        color: #ffffff;
        display: flex;
        font-family: Inter, 'Source Sans Pro';
        font-size: 1.2rem;
        font-weight: 400;
        line-height: 1.2125;
        white-space: nowrap;
        width: 36.4rem;
        }

        .mId {
    text-decoration: none;
     color: black;
  }
  	.enrollbo {
  	    text-decoration: none;
     color: white;
  	}

	/*-------------  버튼 스타일 ---------------*/

		#page {
		  text-align: center;
		  display: inline-flex;
		  align-items: center;
		  justify-content: space-around
		}
		.page_btn {
		  align-items: center;
		}
		.pagination {
		  list-style: none;
		  padding: 0;
		  margin-top: 20px;
		}
		.pagination li {
		  display: inline;
		  text-align: center;
		}
		/* 숫자들에 대한 스타일 지정 */
		.pagination a {
		  float: left;
		  display: block;
		  font-size: 14px;
		  text-decoration: none;
		  padding: 5px 12px;
		  color: #797979;
		  line-height: 1.5;
		}
		.first { margin-right: 15px; }
		.last { margin-left: 15px; }
		.first:hover, .last:hover, .arrow_left:hover, .arrow_right:hover {
		  color: #146C94;
		}
		.pagination a:active {
		  cursor: default;
		  color: #69ABCE;
		}
		.pagination a:active {
		  outline: none;
		}
		.num {
		  margin-left: 3px;
		  padding: 0;
		  width: 30px;
		  -moz-border-radius: 100%;
		  -webkit-border-radius: 100%;
		  border-radius: 100%;
		}
		.num:hover {
		  background-color: #146C94;
		  color: #FFFFFF;
		}
		.num:active, .modal .num:active {
		  background-color: #69ABCE;
		  cursor: pointer;
		}

		.title{
            width : 250px;
            height : 70px;
            margin : 30px 0px 0px 15px;
            box-sizing : border-box;
            align-items : center;
            display : flex;
        }

           .bar {
            width : 12px;
            height : 70px;
            background-color : #146C94;
        }

         .title_text{
            width : 200px;
            height : 50px;
            font-size : 40px;
            font-weight : bold;
            padding : 0px 0px 7px 10px;
        }

    </style>
</head>
<body>

		<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

    	<div id="container">

        		<!-- 배너 -->
				<div class="title_all" style="padding-top: 50px; padding-bottom: 25px">
				<div class="title">
                <div class="bar"></div>
                <div class="title_text">공지사항</div>
				</div>
				</div>

        <!-- 공지사항 -->
        <div class="board">

                <br/>

<table>
    <thead>
        <tr>
            <th colspan="8">
                <div style="display: grid; grid-template-columns: 1fr auto;">
                    <div style="text-align: center;">
                            <h4 style="margin: 0;">배송 및 운영관련 공지사항 게시판입니다.</h4>
                    </div>
                    <div style="text-align: right;">
                <c:if test="${loginUser.memberId eq 'admin'}">
                            <button id="insertList">
                                <a class="enrollbo" href="enrollForm.no">글작성</a>
                            </button>
                        </c:if>
                    </div>
                </div>
            </th>
        </tr>
    </thead>
           <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">공지사항</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
          <a class="nav-link" href="list.bo">1:1문의</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="list.faq">FAQ</a>
        </li>
      </ul>
    </div>

  </div>
</nav>
             <tr>
      <th>No</th>
      <th>
        <select id="categoryFilter" onchange="changeCategory()">
          <option value="all">전체</option>
          <option value="category1">공지사항</option>
          <option value="category2">배송안내</option>
          <option value="category3">안내사항</option>
          <option value="category4">이벤트/혜택</option>

        </select>
      </th>
      <th>제목</th>
      <th>작성일</th>
      <th>조회수</th>
    </tr>
  </thead>
  <tbody class="hover">
  <c:forEach var="b" items="${list}">
    <tr class="noticeRow" data-category="${b.noticeCategory}" onclick="location.href='${pageContext.request.contextPath}/detail.no?bno=${b.noticeNo}'">
      <td class="bno">${b.noticeNo}</td>
      <td>
 <c:choose>
  <c:when test="${b.noticeCategory == 'category1'}">
    공지사항
  </c:when>
  <c:when test="${b.noticeCategory == 'category2'}">
    배송안내
  </c:when>
  <c:when test="${b.noticeCategory == 'category3'}">
    안내사항
  </c:when>
  <c:when test="${b.noticeCategory == 'category4'}">
    이벤트/혜택
  </c:when>
  <c:otherwise>
    기타
  </c:otherwise>
</c:choose>
      </td>
      <td>${b.noticeTitle}</td>
      <td>${b.noticeDate}</td>
      <td>${b.noticeView}</td>
    </tr>
  </c:forEach>
</tbody>
</table>


<script>
  var selectedCategory = "all"; // 기본적으로 모든 카테고리를 보여주기 위해 "all"로 초기화

  // 페이지 로드 시 초기 필터링
  window.onload = function() {
    filterByCategory();
  };

  function changeCategory() {
    selectedCategory = document.getElementById("categoryFilter").value;
    filterByCategory();
  }

  function filterByCategory() {
    var noticeRows = document.getElementsByClassName("noticeRow");

    for (var i = 0; i < noticeRows.length; i++) {
      var category = noticeRows[i].getAttribute("data-category");
      if (selectedCategory === "all" || category === selectedCategory) {
        noticeRows[i].style.display = "table-row";
      } else {
        noticeRows[i].style.display = "none";
      }
    }
  }
</script>
<br>
<div id="page_search" align="center">
  <div id="page">
    <div class="page_btn" align="center">
      <ul class="pagination">
        <li><a href="/list.no?cPage=1" class="first">처음 페이지</a></li>

        <c:choose>
          <c:when test="${pi.currentPage eq 1}">
            <li><a href="#" class="arrow_left" disabled> &lt;&lt; </a></li>
          </c:when>
          <c:otherwise>
            <li><a href="/list.no?cPage=${pi.currentPage - 1}" class="arrow_left"> &lt;&lt; </a></li>
          </c:otherwise>
        </c:choose>

        <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}" step="1">
          <li>
            <a href="/list.no?cPage=${page}" class="active num">${page}</a>
          </li>
        </c:forEach>

        <c:choose>
          <c:when test="${pi.currentPage eq pi.maxPage}">
            <li><a href="#" class="arrow_right" disabled> &gt;&gt; </a></li>
          </c:when>
          <c:otherwise>
            <li><a href="/list.no?cPage=${pi.currentPage + 1}" class="arrow_right"> &gt;&gt; </a></li>
          </c:otherwise>
        </c:choose>

        <li>
          <a href="/list.no?cPage=${pi.maxPage}" class="last">끝 페이지</a>
        </li>
      </ul>
    </div>
  </div>
</div>

    </div>
</div>
<script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "8094ae3e-4590-4830-854a-710d02743bc2"
  });
</script>
<!-- page_search div -->

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>
</body>

</html>