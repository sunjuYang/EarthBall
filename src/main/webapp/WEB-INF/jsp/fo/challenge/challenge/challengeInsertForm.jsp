<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>챌린지 오픈 요청 화면</title>

  <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>

  <!-- CSS 영역-->
  <link rel="stylesheet" href="/resources/fo/css/challenge/challengeInsertForm.css">


  <!-- include libraries(jQuery, bootstrap) -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <!-- include summernote css/js -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

  <!-- js 영역-->
  <script>
      $(document).ready(function () {
          $('#chContent').summernote();
      });
  </script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

<!-- 내용 영역 시작 -->
<div class="wrap">
  <!-- 타이틀 시작-->
  <div id="title">
    <div id="bar_1"></div>
    <div id="title_text">챌린지 오픈</div>
  </div>
  <!-- 타이틀 끝-->


  <div class="basic_info">
    <div class="info_title">
      <h2>기본 정보</h2>
      <div class="bar_2"></div>
      <br>
      <span>[ 기본 정보 ] 사항은 필수 입력 사항입니다. *</span>
    </div>

    <div class="basic_form_1">
      <span class="form_title">챌린지명 <span class="star">*</span></span>
      <input type="text" class="form_text" placeholder="챌린지명을 입력해주세요." name="chTitle" required> <br><br>

      <span class="form_title">카테고리 <span class="star">&nbsp;</span>&nbsp;</span>
      <input type="hidden" name="categoryNo" value="${category.categoryNo}">
      <input type="text" class="form_text" value="${category.categoryName}" readonly> <br><br>

      <span class="form_title">도전기간 <span class="star">*</span></span>
      <input type="date" class="form_date" name="chStartDay" required>
      ~ <input type="date" class="form_date" name="chEndDay" required><br><br>
    </div>

    <div class="basic_form_2">
      <div class="flex-container">
        <div class="wrapper">
          <span class="form_title" align="right;">썸네일 <span class="star">*</span></span>
          <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg"
               class="image-box" style="width: 200px;"/>
          <input type="file" accept="image/*" name="fileNo" id="fileNo" onchange="uploadImage();"/>
          <input type="hidden" name="resultFileNo" value="">
        </div>
      </div>
    </div>
  </div>


  <div class="template">
    <div class="info_title">
      <h2>챌린지 상세 내용</h2>
      <div class="bar_2"></div>
      <br>
    </div>

    <!-- 탬플릿 폼 안 영역 시작-->
    <div class="temp_content">

      <div class="textarea">
        <div class="textarea_class">
          <textarea name="chContent" id="chContent"></textarea>
        </div>
      </div>
    </div>


    <div class="btn_div">
      <button class="btn_1" id="openBtn" onclick="open_request();">챌린지 오픈 요청하기</button>
      <button class="btn_1">다음 챌린지를 기약하기</button>
    </div>


    <script type="text/javascript">
        $(document).on("change", ".fileUpload", function () {
            let $this = $(this);
            let fileInput = $(this)[0].files[0];
            let categoryTemplateNo = $(this).data('categoryTemplateNo');
            let inputType = $(this).data('inputType');

            if (fileInput) {
                let imageType = /^image\//;

                if (!imageType.test(fileInput.type)) {
                    // 이미지 파일이 아닐 경우 처리
                    console.error('Selected file is not an image.');
                    return;
                }

                let formData = new FormData();
                formData.append('file', fileInput);

                $.ajax({
                    url: '/challenge/file-upload',
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        // 업로드 성공 시 처리
                        console.log('Image uploaded successfully.');
                        $this.siblings(".image-box").attr("src", response.filePath);
                        $("input[name=" + categoryTemplateNo + "_" + inputType + "]").val(response.fileNo);

                    },
                    error: function () {
                        // 업로드 실패 시 처리
                        console.error('Image upload failed.');
                    }
                });
            } else {
                // 파일이 선택되지 않았을 경우 처리
                console.error('No file selected.');
            }
        });


        function uploadImage() {
            let fileInput = $('#fileNo')[0].files[0];
            if (fileInput) {
                let imageType = /^image\//;

                if (!imageType.test(fileInput.type)) {
                    // 이미지 파일이 아닐 경우 처리
                    console.error('Selected file is not an image.');
                    return;
                }

                let formData = new FormData();
                formData.append('file', fileInput);

                $.ajax({
                    url: '/challenge/file-upload',
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        // 업로드 성공 시 처리
                        console.log('Image uploaded successfully.');
                        $("#fileNo").siblings(".image-box").attr("src", response.filePath);
                        $("input[name=resultFileNo][type=hidden]").val(response.fileNo);
                        console.log("fileNo : ", $("input[name=resultFileNo][type=hidden]").val(response.fileNo));
                    },
                    error: function () {
                        // 업로드 실패 시 처리
                        console.error('Image upload failed.');
                    }
                });
            } else {
                // 파일이 선택되지 않았을 경우 처리
                console.error('No file selected.');
            }

        }

        function open_request() {
            let chTitle = $("input[name=chTitle]");                     //챌린지명
            let categoryNo = $("input[name=categoryNo]").val();         // 카테고리일련번호   값!!!
            let chStartDay = $("input[name=chStartDay]");               // 챌린지시작일
            let chEndDay = $("input[name=chEndDay]");                   // 챌린지종료일
            let fileNo = $("input[name=resultFileNo][type=hidden]").val();  // 파일번호
            let markupStr = $("#chContent").summernote("code");         // 챌린지 내용

            let challengeData = { // 기본 정보 데이터
                chTitle: chTitle.val()
                , categoryNo: categoryNo
                , chStartDay: chStartDay.val()
                , chEndDay: chEndDay.val()
                , memberId: "${loginUser.memberId}"
                , fileNo: fileNo
                , chContent : markupStr
            }

            $.ajax({
                url: "/openRequest.chall"
                , type: "post"
                , data: JSON.stringify(challengeData)
                , contentType: 'application/json'
                , success: function (result) {
                    if (result > 0) {
                        alert("챌린지가 성공적으로 오픈되었습니다.");
                        location.href = "/main.chall"
                    } else {
                        alert("챌린지 오픈에 실패하였습니다.");
                    }
                }
                , error: function () {
                    console.log("챌린지 오픈용  ajax 연결 실패");
                }
            });
        }

        $("#chContent").summernote({
            height : 700
            , minHeight : null
            , maxHeight : null
            , focus : true
        });



    </script>


  </div>
  <!-- 내용 영역 끝 -->


  <jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>

</body>
</html>
