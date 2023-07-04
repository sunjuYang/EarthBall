<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EcoDiary</title>
    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
    <link rel="stylesheet" href="/resources/fo/css/diary/diaryEnrollForm.css">
    <link rel="stylesheet" href="/resources/fo/css/diary/diaryDetailView.css">

</head>
<body>

		<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

		<div id="container">
		    <!-- 화면  -->
				<div class="outer1_1">
					 <div class="detail_header">
							<div class="photo">
								<img src="/resources/fo/img/logo.png">
								<div class="detail_id" id="dyBoardWriter">${ d.dyBoardWriter }</div>
							</div>
							<form id="updateForm" action="dyUpdate.bo" method="post">
								<input type="hidden" name="dyBoardNo" id="dyBoardNo" value="${ d.dyBoardNo }">
								<input type="hidden" name="filePath" value="${ d.changeName }">
			         </div>
			   	</div>


		    <div id="outer1">
		        <div id="a">
		            <div class="b" >
		                <span id="year"></span>년
		                <span id="month"></span>월
		                <span id="date"></span>일
		                <span id="day"></span>요일
		            </div>

		            <div id="c">
		                <div class="icon">
		                    <div id="c_1">
		                        <svg xmlns="http://www.w3.org/2000/svg" width="50px" height="40px" fill="currentColor"
		                              class="bi-sun" viewBox="0 0 16 16">
		                            <path d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6zm0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
		                        </svg>
		                    </div>
		                    <div id="c_2">
		                        <svg xmlns="http://www.w3.org/2000/svg" width="50px" height="40px" fill="currentColor"
		                             class="iconBtn" id="bi bi-cloud" id="f" viewBox="0 0 16 16">
		                            <path d="M4.406 3.342A5.53 5.53 0 0 1 8 2c2.69 0 4.923 2 5.166 4.579C14.758 6.804 16 8.137 16 9.773 16 11.569 14.502 13 12.687 13H3.781C1.708 13 0 11.366 0 9.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383zm.653.757c-.757.653-1.153 1.44-1.153 2.056v.448l-.445.049C2.064 6.805 1 7.952 1 9.318 1 10.785 2.23 12 3.781 12h8.906C13.98 12 15 10.988 15 9.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 4.825 10.328 3 8 3a4.53 4.53 0 0 0-2.941 1.1z"/>
		                        </svg>
		                    </div>
		                    <div id="c_3">
		                        <svg xmlns="http://www.w3.org/2000/svg" width="50px" height="40px" fill="currentColor"
		                             class="iconBtn" id="bi bi-umbrella" id="g" viewBox="0 0 16 16">
		                            <path d="M8 0a.5.5 0 0 1 .5.5v.514C12.625 1.238 16 4.22 16 8c0 0 0 .5-.5.5-.149 0-.352-.145-.352-.145l-.004-.004-.025-.023a3.484 3.484 0 0 0-.555-.394A3.166 3.166 0 0 0 13 7.5c-.638 0-1.178.213-1.564.434a3.484 3.484 0 0 0-.555.394l-.025.023-.003.003s-.204.146-.353.146-.352-.145-.352-.145l-.004-.004-.025-.023a3.484 3.484 0 0 0-.555-.394 3.3 3.3 0 0 0-1.064-.39V13.5H8h.5v.039l-.005.083a2.958 2.958 0 0 1-.298 1.102 2.257 2.257 0 0 1-.763.88C7.06 15.851 6.587 16 6 16s-1.061-.148-1.434-.396a2.255 2.255 0 0 1-.763-.88 2.958 2.958 0 0 1-.302-1.185v-.025l-.001-.009v-.003s0-.002.5-.002h-.5V13a.5.5 0 0 1 1 0v.506l.003.044a1.958 1.958 0 0 0 .195.726c.095.191.23.367.423.495.19.127.466.229.879.229s.689-.102.879-.229c.193-.128.328-.304.424-.495a1.958 1.958 0 0 0 .197-.77V7.544a3.3 3.3 0 0 0-1.064.39 3.482 3.482 0 0 0-.58.417l-.004.004S5.65 8.5 5.5 8.5c-.149 0-.352-.145-.352-.145l-.004-.004a3.482 3.482 0 0 0-.58-.417A3.166 3.166 0 0 0 3 7.5c-.638 0-1.177.213-1.564.434a3.482 3.482 0 0 0-.58.417l-.004.004S.65 8.5.5 8.5C0 8.5 0 8 0 8c0-3.78 3.375-6.762 7.5-6.986V.5A.5.5 0 0 1 8 0zM6.577 2.123c-2.833.5-4.99 2.458-5.474 4.854A4.124 4.124 0 0 1 3 6.5c.806 0 1.48.25 1.962.511a9.706 9.706 0 0 1 .344-2.358c.242-.868.64-1.765 1.271-2.53zm-.615 4.93A4.16 4.16 0 0 1 8 6.5a4.16 4.16 0 0 1 2.038.553 8.688 8.688 0 0 0-.307-2.13C9.434 3.858 8.898 2.83 8 2.117c-.898.712-1.434 1.74-1.731 2.804a8.687 8.687 0 0 0-.307 2.131zm3.46-4.93c.631.765 1.03 1.662 1.272 2.53.233.833.328 1.66.344 2.358A4.14 4.14 0 0 1 13 6.5c.77 0 1.42.23 1.897.477-.484-2.396-2.641-4.355-5.474-4.854z"/>
		                        </svg>
		                    </div>
		                    <div id="c_4">
		                        <svg xmlns="http://www.w3.org/2000/svg" width="50px" height="40px" fill="currentColor"
		                            class="iconBtn"  id="bi bi-snow" id="w" viewBox="0 0 16 16">
		                            <path d="M8 16a.5.5 0 0 1-.5-.5v-1.293l-.646.647a.5.5 0 0 1-.707-.708L7.5 12.793V8.866l-3.4 1.963-.496 1.85a.5.5 0 1 1-.966-.26l.237-.882-1.12.646a.5.5 0 0 1-.5-.866l1.12-.646-.884-.237a.5.5 0 1 1 .26-.966l1.848.495L7 8 3.6 6.037l-1.85.495a.5.5 0 0 1-.258-.966l.883-.237-1.12-.646a.5.5 0 1 1 .5-.866l1.12.646-.237-.883a.5.5 0 1 1 .966-.258l.495 1.849L7.5 7.134V3.207L6.147 1.854a.5.5 0 1 1 .707-.708l.646.647V.5a.5.5 0 1 1 1 0v1.293l.647-.647a.5.5 0 1 1 .707.708L8.5 3.207v3.927l3.4-1.963.496-1.85a.5.5 0 1 1 .966.26l-.236.882 1.12-.646a.5.5 0 0 1 .5.866l-1.12.646.883.237a.5.5 0 1 1-.26.966l-1.848-.495L9 8l3.4 1.963 1.849-.495a.5.5 0 0 1 .259.966l-.883.237 1.12.646a.5.5 0 0 1-.5.866l-1.12-.646.236.883a.5.5 0 1 1-.966.258l-.495-1.849-3.4-1.963v3.927l1.353 1.353a.5.5 0 0 1-.707.708l-.647-.647V15.5a.5.5 0 0 1-.5.5z"/>
		                        </svg>
		                    </div>
		                </div>
		            </div>
		        </div>

				<input type="hidden" id="weather" value="${d.weather}"> <!-- 날씨 상태값 -->

		        <script>
					$(function() {

						// 날씨관련
						let weather = ${d.weather};
						let iconId = "";
						let activeColor = "";

						console.log(weather);

						switch(weather) {
						case 1 : iconId = "#c_1"; activeColor = "active1";  break;
						case 2 : iconId = "#c_2"; activeColor = "active2";  break;
						case 3 : iconId = "#c_3"; activeColor = "active3";  break;
						case 4 : iconId = "#c_4"; activeColor = "active4";  break;
						}

						var target = document.querySelector(iconId);
						target.classList.add(activeColor);

						// 날짜관련
						let createDate = "${ d.dyCreateDate }"; // "2023-06-08"
						// console.log(createDate);

						let year = createDate.split("-")[0]; // "2023"
						let month = createDate.split("-")[1]; // "06"
						let date = createDate.split("-")[2]; // "08"

						$("#year").text(year);
						$("#month").text(month);
						$("#date").text(date);

					    var week = new Array('일', '월', '화', '수', '목', '금', '토');

					    var today = new Date(createDate).getDay();
					    var todayLabel = week[today];

					    $("#day").text(todayLabel);

					});
				</script>

		        <div id="draw1">
		            <canvas id="jsCanvas" class="canvas" name="file" ></canvas>
		        </div>

		      	<script>
					    $(document).ready(function() {
					        const canvas = document.getElementById('jsCanvas');
					        const context = canvas.getContext('2d');
					        const img = new Image();

					        img.onload = function() {
					            if (canvas && context ) {
					                context.globalCompositeOperation = 'source-over';
					                context.drawImage(img, 0, 0, canvas.width, canvas.height);
					            }
					        };

					        img.src = "${ d.changeName }";
					    });
				</script>

				<!--  기존 첨부파일이 있을 경우 :  기존 첨부파일의 원본명과 수정명을 같이 넘겨줄 것 -->
				<input type="hidden"  id="changeName" name="changeName" value="${ d.changeName}">
					</form>
		        <div class="controls">
		            <div class="controls_range">
		                <input type="range" id="jsRange" min="2.0" max="10.0" value="2.5" step="0.1"/>
		            </div>
		            <div class="controls_colors" id="JSColors">
		                <div class="controls_color jsColor" style="background-color: black;"></div>
		                <div class="controls_color jsColor" style="background-color: white;"></div>
		                <div class="controls_color jsColor" style="background-color: red;"></div>
		                <div class="controls_color jsColor" style="background-color: orange;"></div>
		                <div class="controls_color jsColor" style="background-color: yellow;"></div>
		                <div class="controls_color jsColor" style="background-color: green;"></div>
		                <div class="controls_color jsColor" style="background-color: yellowgreen;"></div>
		                <div class="controls_color jsColor" style="background-color: pink;"></div>
		                <div class="controls_color jsColor" style="background-color: skyblue;"></div>
		                <div class="controls_color jsColor" style="background-color: blue;"></div>
		                <div class="controls_color jsColor" style="background-color: purple;"></div>
		            </div>
		            <script src="app.js"></script>

		            <div class="controls_btns">
		                <button type="button" id="jsMode">채우기</button>
		                <button type="button" onclick="colorChange('white')">지우개</button>
		                <button type="button" onclick="clearAll()">전체지우기</button>
		            </div>

		        </div>

		    </div>

		    <div class="outer2">
		    <br>
		        <div class="title">제목: <input type="text"  maxlength="10"  id="dyBoardTitle" required   value="${ d.dyBoardTitle }"></div>
                <div class="content"><textarea id="dyBoardContent"  maxlength="500" required  >${ d.dyBoardContent }</textarea></div>
		    </div>

		    <div class="submit_btn1">
		        <button type="button" onclick="updateBtn()">글등록</button>
		    </div>
		   </div>

		<script type="text/javascript" src="/resources/fo/js/diary/diary.js"></script>

		<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>


</body>
</html>