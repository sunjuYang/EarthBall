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
      width: calc(100% - (1.625rem * 2));
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
	  margin-left: 1.5rem;
    }
	.insertForm{
		width: 100%;
	}
	.insertForm td{
		padding: 10px 20px;
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
			<script>
				console.log('${beforeData}');
				console.log('${beforeAtta}');
			</script>
			<!-- Content wrapper -->
			<div class="content-wrapper">
				<!-- Content -->
				<div class="content">
					<div class="listArea">
						<h1 class="title">매장 수정</h1>
						<form action="updateStore.st" method="post" enctype="multipart/form-data">
							<input type="hidden" name="storeNo" value="${beforeData.storeNo}">
							<div>
								<table class="insertForm">
									<tr>
										<td width="150">매장명</td>
										<td><input type="text" name="storeName" id required style="width: 50%" value="${beforeData.storeName}"></td>
									</tr>
									<tr>
										<td style="display: flex;">
											<span style="margin: 0px; width: 31px;">주소</span>
											<input type="button" value="주소검색" 
											id="addressSearchBtn"
											style="width: 70%; height: 25px; border-radius: 10px; border: none; background-color: #19a7ce; color: white; font-weight: 600;">
										</td>
										<td style="width: 500px;">
											<input type="text" name="storeAddress" required style="width: 50%;" id="address_kakao" value="${beforeData.storeAddress}">
										</td>
									</tr>
									<tr>
										<td>상세주소</td>
										<td>	
											<input type="text" style="width: 50%;" name="storeDetailAddress" value="${beforeData.storeDetailAddress}">
										</td>
		
									</tr>
									<tr>
										
										<td>전화번호</td>
										<td><input type="text" name="storePhone" required style="width: 50%;" value="${beforeData.storePhone}" pattern="(\d{2}-\d{4}-\d{4})|(\d{4}-\d{4}-\d{4})|(\d{3}-\d{4}-\d{4})" placeholder="xx-xxxx-xxxx 또는 xxx-xxxx-xxxx 또는 xxxx-xxxx-xxxx 형식으로 입력해주세요!" title="xx-xxxx-xxxx 또는 xxx-xxxx-xxxx 또는 xxxx-xxxx-xxxx 형식으로 입력해주세요!" /> </td>
									</tr>
									<tr style="margin: 10px 0;">
										<td >운영시간</td>
										<td>
											<div style="display: flex; align-items: center;">
												<label for="startHour" style="margin-right: 10px;">시작 시간:</label>
												<input type="radio" name="startAmPm" id="startAm" value="am" checked style="margin-right: 5px;">
												<label for="startAm" style="margin-right: 5px;">오전</label>
												<input type="radio" name="startAmPm" id="startPm" value="pm" style="margin-right: 5px;">
												<label for="startPm" style="margin-right: 10px;">오후</label>
												<select name="startHour" id="start-hour" style="padding: 5px;">
													<option value="0">0</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
												</select>
												<span> : </span>
												<select name="startMin" id="startMin" style="padding: 5px;">
													<option value="00">00</option>
												<option value="30">30</option>
												</select>
											</div>
											<div style="display: flex; align-items: center;">
												<label for="endHour" style="margin-right: 10px;">종료 시간:</label>
												<input type="radio" name="endAmPm" id="endAm" value="am" checked style="margin-right: 5px;">
												<label for="endAm" style="margin-right: 5px;">오전</label>
												<input type="radio" name="endAmPm" id="endPm" value="pm" style="margin-right: 5px;">
												<label for="endPm" style="margin-right: 10px;">오후</label>
												
												<select name="endHour" id="endHour" style="padding: 5px;">
													<option value="0">0</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
												</select>
												<span> : </span>
												<select name="endMin" id="endMin" style="padding: 5px;">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<td>매장 상세설명</td>
										<td>
											<textarea name="storeInfo"  rows="10" required style="width: 80%; resize: none;">${beforeData.storeInfo}</textarea>
										</td>
									</tr>
                                    <tr>
										<td>사진</td>
										<td>
											<table class="fileArea">
                                                <tr>
                                                    <td>
                                                        <div>
                                                            <input type="file" class="upfile1" name="upfiles" onchange="loadImg(this, 1);" > 
                                                            <img id="preview1" onclick="upfile();" src="/resources/fo/upfiles/${ beforeAtta[0].changerName }">
                                                            <input type="hidden" name="changeNames" value="${ beforeAtta[0].changerName }"> <!-- 기존에 파일이 있을 경우만 넘어가는놈 -->

                                                        </div>
                                                        <div>로고(필수)</div>
                                                    </td>
                                                </tr>
												<tr>
													<td>
														<div>
                                                            <input type="file" class="upfile2" name="upfiles" onchange="loadImg(this, 2);" > 
                                                            <img id="preview2" onclick="upfile();" src="/resources/fo/upfiles/${ beforeAtta[1].changerName }">
                                                            
                                                            <input type="hidden" name="changeNames" value="${ beforeAtta[1].changerName }"> <!-- 기존에 파일이 있을 경우만 넘어가는놈 -->
                                                            
                                                        </div>
														<div>매장사진 1번(필수)</div>
													</td>
													<td>
														<div>
                                                            <input type="file" class="upfile3" name="upfiles" onchange="loadImg(this, 3);" > 
                                                            <img id="preview3" onclick="upfile();" src="/resources/fo/upfiles/${ beforeAtta[2].changerName }">
                                                            
                                                            <input type="hidden" name="changeNames" value="${ beforeAtta[2].changerName }"> <!-- 기존에 파일이 있을 경우만 넘어가는놈 -->
                                                            
                                                        </div>
														<div>매장사진 2번(필수)</div>
													</td>
													<td>
														<div>
                                                            <input type="file" class="upfile4" name="upfiles" onchange="loadImg(this, 4);"> 
                                                            <img id="preview4" onclick="upfile();" src="/resources/fo/upfiles/${ beforeAtta[3].changerName }">
                                                            
                                                            <input type="hidden" name="changeNames" value="${ beforeAtta[3].changerName }"> <!-- 기존에 파일이 있을 경우만 넘어가는놈 -->
                                                            
                                                        </div>
														<div>매장사진 3번</div>
													</td>
												</tr>
												<tr>
													<td>
														<div>
                                                            <input type="file" class="upfile5" name="upfiles" onchange="loadImg(this, 5);"> 
                                                            <img id="preview5" onclick="upfile();" src="/resources/fo/upfiles/${ beforeAtta[4].changerName }">
                                                            
                                                            <input type="hidden" name="changeNames" value="${ beforeAtta[4].changerName }"> <!-- 기존에 파일이 있을 경우만 넘어가는놈 -->
                                                            
                                                        </div>
														<div>매장사진 4번</div>
													</td>
													<td>
														<div>
                                                            <input type="file" class="upfile6" name="upfiles" onchange="loadImg(this, 6);"> 
                                                            <img id="preview6" onclick="upfile();" src="/resources/fo/upfiles/${ beforeAtta[5].changerName }">
                                                            
                                                            <input type="hidden" name="changeNames" value="${ beforeAtta[5].changerName }"> <!-- 기존에 파일이 있을 경우만 넘어가는놈 -->
                                                            
                                                        </div>
														<div>매장사진 5번</div>
													</td>
													<td>
														<div>
                                                            <input type="file" class="upfile7" name="upfiles" onchange="loadImg(this, 7);"> 
                                                            <img id="preview7" onclick="upfile();" src="/resources/fo/upfiles/${ beforeAtta[6].changerName }">
                                                            
                                                            <input type="hidden" name="changeNames" value="${ beforeAtta[6].changerName }"> <!-- 기존에 파일이 있을 경우만 넘어가는놈 -->
                                                            
                                                        </div>
														<div>매장사진 6번</div>
													</td>
												</tr>
												<tr>
													<td>
														<div>
                                                            <input type="file" class="upfile8" name="upfiles" onchange="loadImg(this, 8);">
                                                            <img id="preview8" onclick="upfile();" src="/resources/fo/upfiles/${ beforeAtta[7].changerName }">
                                                            
                                                            <input type="hidden" name="changeNames" value="${ beforeAtta[7].changerName }"> <!-- 기존에 파일이 있을 경우만 넘어가는놈 -->
                                                            
                                                        </div>
														<div>매장사진 7번</div>
													</td>
													<td>
														<div>
                                                            <input type="file" class="upfile9" name="upfiles" onchange="loadImg(this, 9);"> 
                                                            <img id="preview9" onclick="upfile();" src="/resources/fo/upfiles/${ beforeAtta[8].changerName }">
                                                            
                                                            <input type="hidden" name="changeNames" value="${ beforeAtta[8].changerName }"> <!-- 기존에 파일이 있을 경우만 넘어가는놈 -->
                                                            
                                                        </div>
														<div>매장사진 8번</div>
													</td>
													<td>
														<div>
                                                            <input type="file" class="upfile10" name="upfiles" onchange="loadImg(this, 10);"> 
                                                            <img id="preview10" onclick="upfile();" src="/resources/fo/upfiles/${ beforeAtta[9].changerName }">
                                                            
                                                            <input type="hidden" name="changeNames" value="${ beforeAtta[9].changerName }"> <!-- 기존에 파일이 있을 경우만 넘어가는놈 -->
                                                            
                                                        </div>
														<div>매장사진 9번</div>
													</td>
												</tr>
												
											</table>
										</td>
									</tr>
                                </table>
                            </div>
                            <div class="btn-area">
                                <button type="submit">수정</button>
                                <input type="button" value="취소" onclick="home();">
                            </div>
                        </form>
                    </div>
                </div>
        <!-- / Content -->

        <!-- Footer -->
        <footer class="content-footer footer bg-footer-theme">
          <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
            <div class="mb-2 mb-md-0">
              
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

	var startPm = document.getElementById("startPm");
	var endAm = document.getElementById("endAm");

	startAm.addEventListener("change", function() {
		if (startAm.checked) {
			endAm.disabled = false;
		} else {
			if (startPm.checked) {
			endAm.disabled = true;
			}
		}
	});

	startPm.addEventListener("change", function() {
	if (startPm.checked) {
		endAm.disabled = true;
	} else {
		if (!startAm.checked) {
		endAm.disabled = false;
		}
	}
	});

    function home(){
        location.href = "/main";
    }
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
    // 첨부 파일 취소 버튼 클릭 시 이미지 초기화
    function upfile(){
		$(event.target).siblings("input[type=hidden]").val("");
		$(event.target).attr("src", null);
	}
	

</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("addressSearchBtn").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector(".storeDeailAddress]").focus(); //상세입력 포커싱

            }
        }).open();
    });
}
</script>
</body>
</html>