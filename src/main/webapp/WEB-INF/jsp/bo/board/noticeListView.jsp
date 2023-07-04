<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <jsp:include page="/WEB-INF/jsp/bo/common/commonHead.jsp" />
</head>

<style>

    .hover tr:hover {
    background-color: #f5f5f5;
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
    <h4 class="fw-bold">공지사항</h4>
        <table>
        <thead>
        <tr>
        <th>No</th>
      <th>
        <select id="categoryFilter" onchange="changeCategory()">
          <option value="all">전체</option>
          <option value="category1">Category 1</option>
          <option value="category2">Category 2</option>
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
            Category 1
          </c:when>
          <c:when test="${b.noticeCategory == 'category2'}">
            Category 2
          </c:when>
          <c:otherwise>
            etc
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

 <form id="postForm" action="" method="post">
 	<input type="hidden" name="bno" value="${b.noticeNo}">
 </form>

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
<jsp:include page="/WEB-INF/jsp/bo/common/commonScript.jsp" />
<script type="text/javascript">

</script>
</body>
</html>