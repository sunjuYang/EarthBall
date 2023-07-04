<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>챌린지 수정 화면</title>

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
    <div id="title_text">챌린지 수정</div>
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
      <input type="text" class="form_text" name="chTitle" value="${challenge.chTitle}" required> <br><br>

      <span class="form_title">카테고리 <span class="star">&nbsp</span></span>
      <input type="hidden" name="categoryNo" value="${challenge.categoryNo}">
      <input type="hidden" name="chNo" value="${challenge.chNo}">
      <input type="text" class="form_text" value="${challenge.categoryName}" readonly> <br><br>

      <span class="form_title">도전기간 <span class="star">*</span></span>
      <input type="date" class="form_date" name="chStartDay" value="${challenge.chStartDay}" required>
      ~ <input type="date" class="form_date" name="chEndDay" value="${challenge.chEndDay}" required><br><br>
    </div>

    <div class="basic_form_2">
      <div class="flex-container">
        <div class="wrapper">
          <span class="form_title" align="right;">썸네일 <span class="star">*</span></span>
          <img src="${challenge.filePath}"
               class="image-box"/>
          <input type="file" accept="image/*" name="fileNo" id="fileNo" onchange="uploadImage();"/>
          <input type="hidden" name="resultFileNo" value="${challenge.fileNo}">
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
          <textarea name="chContent" id="chContent">
            ${challenge.chContent}
          </textarea>
        </div>
      </div>
    </div>


    <div class="btn_div">
      <button class="btn_1" id="openBtn" onclick="updateChallengeBtn();">챌린지 수정</button>
      <button class="btn_1"onclick="javascript:history.go(-1);">챌린지 수정 취소</button>
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

        function updateChallengeBtn() {
            let chTitle = $("input[name=chTitle]");                     //챌린지명
            let categoryNo = $("input[name=categoryNo]").val();         // 카테고리일련번호   값!!!
            let chStartDay = $("input[name=chStartDay]");               // 챌린지시작일
            let chEndDay = $("input[name=chEndDay]");                   // 챌린지종료일
            let fileNo = $("input[name=resultFileNo][type=hidden]").val();  // 파일번호
            let markupStr = $("#chContent").summernote("code");         // 챌린지 내용
            let chNo = $("input[type=hidden][name=chNo]").val();

            let updateChallenge = { // 기본 정보 데이터
                chTitle: chTitle.val()
                , categoryNo: categoryNo
                , chStartDay: chStartDay.val()
                , chEndDay: chEndDay.val()
                , memberId: "${loginUser.memberId}"
                , fileNo: fileNo !
                , chContent : markupStr
                , chNo : chNo
            }

            $.ajax({
                url: "/update.chall"
                , type: "post"
                , data: JSON.stringify(updateChallenge)
                , contentType: 'application/json'
                , success: function (result) {
                    if (result > 0) {
                        alert("챌린지가 성공적으로 수정되었습니다.");
                        location.href = "/detailView.chall?chNo=" + chNo;
                    } else {
                        alert("챌린지 수정에 실패하였습니다.");
                    }
                }
                , error: function () {
                    console.log("챌린지 수정용  ajax 연결 실패");
                }
            });
        }
    </script>


  </div>
  <!-- 내용 영역 끝 -->


  <jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>

</body>
</html>
