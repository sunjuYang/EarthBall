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
    .content{
      margin: 0.75rem auto 0;
      border-radius: 0.375rem;
      padding: 0 1.5rem;
      background-color: white;
      /* 그림자효과 */
      box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
    }
    .title{
      font-size: 1.5rem;
      font-weight: 600;
      margin-bottom: 1.5rem;
      margin-top: 1.5rem;
    }
	.insertForm{
		width: 100%;
		/* border: 1px solid #ddd; */
	}
	.insertForm tr{
		height: 50px;
		margin: 10px;
		/* border: 1px solid #ddd; */
	}
	.insertForm td{
		padding-right: 10px;
		/* border: 1px solid #ddd; */
	}
	.insertForm input{
		width: 400px;
		height: 40px;
		border-radius: 5px;
	}
	.btn-area{
		text-align: center;
		margin-top: 30px;
		margin-bottom: 30px;
	}
	.btn-area>*{
		width: 100px;
		height: 30px;
		border-radius: 10px;
		border: none;
		background-color: #19a7ce;
		color: white;
		font-weight: 600;
	}
	.btn-area>*:hover{
		background-color: #0d8db8;
	}
	.insertForm img{
		width: 300px;
		height: 300px;
	}
	#productInfo{
		width: 400px;
		height: 200px;
		resize: none;
	}
	.category{
		width: 100px;
		height: 40px;
		border-radius: 5px;
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
        <div class="container-xxl flex-grow-1 container-p-y content">
			<div class="listArea">
				<h1 class="title">상품 추가</h1>
				<form action="insert.pro" method="post" enctype="multipart/form-data">
					<div>
						<table class="insertForm">
							<tr>
								<td width="100">상품명</td>
								<td><input type="text" name="productName" required></td>
							</tr>
							<tr>
								<td>카테고리</td>
								<td>
									<select name="category" class="category" required>
										<option value="욕실">욕실</option>
										<option value="식품">식품</option>
										<option value="주방">주방</option>
										<option value="생활">생활</option>
										<option value="음료용품">음료용품</option>
										<option value="화장품">화장품</option>
										<option value="문구">문구</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>가격</td>
								<td><input type="number" name="price" required></td>
							</tr>
							<tr>
								<td>할인률</td>
								<td><input type="number" name="discount" required></td>
							</tr>
							<tr>
								<td>재고</td>
								<td><input type="number" name="stock" required></td>
							</tr>
							<tr>
								<td>상품 설명</td>
								<td><textarea name="productInfo" id="productInfo" required></textarea></td>
							</tr>
							<tr>
								<td>사진</td>
								<td>
									<table class="fileArea">
										<tr>
											<td>
												<div><input type="file" class="upfile1" name="upfiles" onchange="loadImg(this, 1);" required> <img id="preview1"></div>
												<div>메인이미지</div>
											</td>
											<td>
												<div><input type="file" class="upfile2" name="upfiles" onchange="loadImg(this, 2);"> <img id="preview2"></div>
												<div>2번</div>
											</td>
											<td>
												<div><input type="file" class="upfile3" name="upfiles" onchange="loadImg(this, 3);"> <img id="preview3"></div>
												<div>3번</div>
											</td>
											<td>
												<div><input type="file" class="upfile4" name="upfiles" onchange="loadImg(this, 4);"> <img id="preview4"></div>
												<div>4번</div>
											</td>
										</tr>
										<tr>
											<td>
												<div><input type="file" class="upfile5" name="upfiles" onchange="loadImg(this, 5);"> <img id="preview5"></div>
												<div>5번</div>
											</td>
											<td>
												<div><input type="file" class="upfile6" name="upfiles" onchange="loadImg(this, 6);"> <img id="preview6"></div>
												<div>6번</div>
											</td>
											<td>
												<div><input type="file" class="upfile7" name="upfiles" onchange="loadImg(this, 7);"> <img id="preview7"></div>
												<div>7번</div>
											</td>
											<td>
												<div><input type="file" class="upfile8" name="upfiles" onchange="loadImg(this, 8);"> <img id="preview8"></div>
												<div>8번</div>
											</td>
										</tr>
										<tr>
											<td>
												<div><input type="file" class="upfile9" name="upfiles" onchange="loadImg(this, 9);"> <img id="preview9"></div>
												<div>9번</div>
											</td>
											<td>
												<div><input type="file" class="upfile10" name="upfiles" onchange="loadImg(this, 10);"> <img id="preview10"></div>
												<div>10번</div>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<div class="btn-area">
						<button type="submit">추가</button>
						<input type="button" value="취소" onclick="window.history.back();">

					</div>
				</form>
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
	$(function(){
		$(".fileArea input[type=file]").hide();

		$("#preview1").click(function(){
			$(".upfile1").click();
		});
		$("#preview2").click(function(){
			$(".upfile2").click();
		});
		$("#preview3").click(function(){
			$(".upfile3").click();
		});
		$("#preview4").click(function(){
			$(".upfile4").click();
		});
		$("#preview5").click(function(){
			$(".upfile5").click();
		});
		$("#preview6").click(function(){
			$(".upfile6").click();
		});
		$("#preview7").click(function(){
			$(".upfile7").click();
		});
		$("#preview8").click(function(){
			$(".upfile8").click();
		});
		$("#preview9").click(function(){
			$(".upfile9").click();
		});
		$("#preview10").click(function(){
			$(".upfile10").click();
		});
	});

	function loadImg(input, num){
		if(input.files.length == 1){
			let reader = new FileReader();
			reader.readAsDataURL(input.files[0]);
			reader.onload = function(e){
				switch(num){
					case 1 : $("#preview1").attr("src", e.target.result); break;
					case 2 : $("#preview2").attr("src", e.target.result); break;
					case 3 : $("#preview3").attr("src", e.target.result); break;
					case 4 : $("#preview4").attr("src", e.target.result); break;
					case 5 : $("#preview5").attr("src", e.target.result); break;
					case 6 : $("#preview6").attr("src", e.target.result); break;
					case 7 : $("#preview7").attr("src", e.target.result); break;
					case 8 : $("#preview8").attr("src", e.target.result); break;
					case 9 : $("#preview9").attr("src", e.target.result); break;
					case 10 : $("#preview10").attr("src", e.target.result); break;
				}
			};
		}else{
			switch(num){
				case 1 : $("#preview1").attr("src", null); break;
				case 2 : $("#preview2").attr("src", null); break;
				case 3 : $("#preview3").attr("src", null); break;
				case 4 : $("#preview4").attr("src", null); break;
				case 5 : $("#preview5").attr("src", null); break;
				case 6 : $("#preview6").attr("src", null); break;
				case 7 : $("#preview7").attr("src", null); break;
				case 8 : $("#preview8").attr("src", null); break;
				case 9 : $("#preview9").attr("src", null); break;
				case 10 : $("#preview10").attr("src", null); break;
			}
		}
	}
	
</script>
</body>
</html>