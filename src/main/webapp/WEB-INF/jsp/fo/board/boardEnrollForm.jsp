<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 작성하기</title>
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

        #post_title, #id {
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
        $(document).ready(function() {
            $('#summernote').summernote({
                placeholder: '내용을 작성하세요',
                height: 400,
                maxHeight: 400,
                focus: true,
                lang: 'ko-KR',
                toolbar: [
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                    ['color', ['forecolor', 'color']],
                    ['table', ['table']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['height', ['height']],
                    ['view', ['fullscreen', 'help']]
                ],
                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
                fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
                callbacks: {
                    onImageUpload: function(files, editor, welEditable) {
                            uploadSummernoteImageFile(files[i], editor, welEditable);
                        }
                    }
            });
        });

        function uploadSummernoteImageFile(file, editor, welEditable) {
            var data = new FormData();
            data.append("file", file);
            $.ajax({
                data: data,
                type: "POST",
                url: "/uploadSummernoteImageFile",
                cache: false,
                contentType: false,
                processData: false,
                success: function(url) {
                    $(editor).summernote('editor.insertImage', url);
                }
            });
        }

        function saveContent() {
            var summernoteContent = $('#summernote').summernote('code');
            var boardTitle = $("#post_title").val();
            var memberId = $("#id").val();

            $.ajax({
                type: "POST",
                url: "/insert.bo",
                data: {
                    boardTitle: boardTitle,
                    boardContent: summernoteContent,
                    memberId: memberId
                },
                success: function(response) {
                    alert("글 작성 완료");
                    window.location.href = "list.bo";
                },
                error: function(e) {
                    alert("글 작성 실패");
                }
            });
        }

        $(document).on('click', '#saveBtn', function() {
            saveContent();
        });

        $(document).on('click', '#resetBtn', function() {
            window.location.href = "list.bo";
        });
    </script>
</head>
<body>
    <h1>글 작성하기</h1><hr>
    <input id="post_title" name="boardTitle" class="no-margin basic_input title_name w100p mb24" type="text" placeholder="제목" required="required"> <br><br>
    <input id="id" name="memberId" class="no-margin basic_input title_name w100p mb24" value="${loginUser.memberId}" readonly> <br><br>
    <textarea id="summernote" name="boardContent"></textarea>
    <div class="enrollFormBtn">
        <button type="reset" id="resetBtn" class="btn btn-danger">목록으로</button>
        <button type="button" class="btn btn-primary" id="saveBtn">작성</button>
    </div>

<script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "8094ae3e-4590-4830-854a-710d02743bc2"
  });
</script>
</body>
</html>
