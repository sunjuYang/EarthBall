<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지 수정하기</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>


<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<style>
    .enrollFormBtn {
        float: right;
    }

    #boardTitle, #memberId {
        font-size: 20px;
        border: none;
        border-bottom: 1px solid rgba(128, 128, 128, 0.3);
        border-radius: 0;
        padding: 8px 118px 8px 0;
        line-height: 1.2;
    }
</style>

<!-- 썸머노트 스크립트 -->
<script>
    // 메인화면 페이지 로드 함수
    $(document).ready(function () {
        $('#summernote').summernote({
            placeholder: '내용을 작성하세요',
            height: 400,
            maxHeight: 400,
            focus : true,
            lang : 'ko-KR',
            toolbar: [
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                ['color', ['forecolor','color']],
                ['table', ['table']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['view', ['fullscreen', 'help']]
            ],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
        });
    });
</script>

<script type="text/javascript">
function updateBoardBtn() {
    var noticeTitle = $("input[name=noticeTitle]");
    var noticeContent = $("#summernote").summernote("code");
    var noticeNo = $("input[type=hidden][name=noticeNo]").val();
    var noticeCategory = $("#category").val();

    var updateBoard = {
        noticeTitle: noticeTitle.val(),
        memberId: "${loginUser.memberId}",
        noticeContent: noticeContent,
        noticeNo: noticeNo,
        noticeCategory: noticeCategory
    };
</script>


<body>
<h1>글 수정하기</h1><hr>
<form method="post" action="update.no">
<input type="hidden" name="noticeNo" value="${b.noticeNo}">
<input id="boardTitle" name="noticeTitle" class="no-margin basic_input title_name w100p mb24" type="text"  value="${b.noticeTitle}" required> <br><br>
<input id="memberId" name="memberId" class="no-margin basic_input title_name w100p mb24" value="${loginUser.memberName}" readonly> <br><br>
<select id="category" name="noticeCategory" required>
  <option value="category1">공지사항</option>
<option value="category2">배송안내</option>
<option value="category3">안내사항</option>
<option value="category4">이벤트/혜택</option>
</select>
<br><br>
<textarea id="summernote" name="noticeContent" required="required" >${b.noticeContent}</textarea>
<div class="enrollFormBtn">
    <button type="reset" id="resetBtn" class="btn btn-danger" onclick="javascript:history.go(-1);">목록</button>
    <button type="submit" class="btn btn-primary" id="saveBtn" onclick="updateBoardBtn()">수정</button>
</div>
</form>
</body>
</html>
