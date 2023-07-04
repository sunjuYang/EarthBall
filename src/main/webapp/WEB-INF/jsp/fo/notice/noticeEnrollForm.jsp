<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 작성</title>
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
        // 메인화면 페이지 로드 함수
        $(document).ready(function () {
            $('#summernote').summernote({
                placeholder: '내용을 작성하세요',
                height: 400,
                maxHeight: 400,
                focus : true,
                lang : 'ko-KR',
                toolbar: [
			    // [groupName, [list of button]]
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
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'] });

            /* callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
						uploadSummernoteImageFile(files[0],this);
					},
					onPaste: function (e) {
						var clipboardData = e.originalEvent.clipboardData;
						if (clipboardData && clipboardData.items && clipboardData.items.length) {
							var item = clipboardData.items[0];
							if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
								e.preventDefault();
							}
						}
					}
				}
	}); */

    /**
	* 이미지 파일 업로드
	*/
	/* function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
            enctype: 'multipart/form-data',
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	} */

	        // 작성 버튼 클릭 함수
	        $(document).on('click','#saveBtn',function() {
	            saveContent();
	        });
	        // 취소 버튼 클릭
	        $(document).on('click','#resetBtn',function() {
	            window.location.href ="list.no";
	        })

	    });

       		 // 데이터 저장
		       function saveContent() {
		    // get value
		    var summernoteContent = $('#summernote').summernote('code'); //summer note (description)
		    var noticeTitle = $("#post_title").val();
		    var noticeCategory = $("#category").val();

		    // Save to server
		    $.ajax({
		        type: "POST",
		        url: "/insert.no",
		        data: { noticeTitle : noticeTitle, noticeContent : summernoteContent, noticeCategory : noticeCategory},
		        success: function(response) {
		            console.log(response);

		            alert("글 작성 완료");
		            window.location.href="list.no"; // redirect to another page
		        },
		        error: function(e) {
		            alert("글 작성 실패");
		        }
		    });
		}

    </script>

<body>
</head>


<h1>공지사항 작성</h1>
<hr>

<input id="post_title" name="noticeTitle" class="no-margin basic_input title_name w100p mb24" type="text" placeholder="제목" required><br><br>
<input id="id" name="admin" class="no-margin basic_input title_name w100p mb24" value="admin" readonly><br><br>
<select id="category" name="noticeCategory">
 <option value="category1">공지사항</option>
<option value="category2">배송안내</option>
<option value="category3">안내사항</option>
<option value="category4">이벤트/혜택</option>
</select><br><br>
<textarea id="summernote" name="noticeContent"></textarea>

<div class="enrollFormBtn">
  <button type="button" id="resetBtn" class="btn btn-danger">목록으로</button>
  <button type="button" class="btn btn-primary" id="saveBtn">작성</button>
</div>




</body>
</html>