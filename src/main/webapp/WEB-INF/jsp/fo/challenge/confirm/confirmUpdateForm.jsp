<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>챌린지 인증 수정</title>

    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>

    <!-- CSS 영역-->
    <link rel="stylesheet" href="/resources/fo/css/challenge/confirmUpdateForm.css">

    <!-- js 영역-->

</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

<!-- 내용 영역 시작 -->
<div class="wrap">
    <!-- 타이틀 시작-->
    <div id="title">
        <div id="bar_1"></div>
        <div id="title_text">챌린지 인증 수정</div>
    </div> <br>
    <!-- 타이틀 끝-->


    <div class="basic_info">
        <div class="info_title">
            <h2>기본 정보</h2>
            <div class="bar_2"></div>
            <br>
        </div>

        <div class="basic_form_1">
            <span class="form_title">챌린지명</span>
            <span class="form_content">${challenge.chTitle}</span> <br><br>

            <span class="form_title">카테고리 </span>
            <span class="form_content">${challenge.categoryName}</span> <br><br>

            <span class="form_title">도전기간 </span>
            <span class="form_content">${challenge.chStartDay}</span> ~ <span
                class="form_content">${challenge.chEndDay}</span> <br><br>

            <span class="form_title">진행상태 </span>
            <span class="form_content">진행중</span> <br><br>

            <input type="hidden" name="chNo" value="${challenge.chNo}">
            <input type="hidden" name="chConNo" value="${chConfirm.chConNo}">
            <input type="hidden" name="memberId" value="${loginUser.memberId}">

        </div>

    </div>

    <div class="template">
        <div class="info_title">
            <h2>인증 정보</h2>
            <div class="bar_2"></div>
            <br>
        </div>

        <div class="text">
            <span class="sub_title">인증 제목</span>
            <div class="text_class">
                <input type="text" class="text_size" name="chConTitle" value="${chConfirm.chConTitle}" required>
            </div>
        </div>
        <br>
        <hr>
        <br>

        <!-- for문 -->
        <c:forEach var="temp" items="${templateList}">

        <!-- 탬플릿 폼 안 영역 시작-->
        <div class="temp_content">


            <!-- select 문 일 경우-->
            <c:if test="${temp.inputType eq 'select'}">
                <div class="select">
                    <span class="sub_title">${temp.chSubTitle}</span>


                    <select class="select_class" name="${temp.categoryTemplateNo}_${temp.inputType}">
                        <c:forEach var="code" items="${temp.codeList}">

                            <option value="${code.code}"
                            <c:forEach var="detail" items="${temp.chDetailInfoList}">
                                <c:if test="${code.code eq detail.code}">selected</c:if>> ${code.codeName}</option>

                            </c:forEach>>
                        </c:forEach>
                    </select>

                </div>
                <br>
            </c:if>


            <!-- checkbox 일 경우 -->
            <c:if test="${temp.inputType eq 'checkbox'}">
                <div class="checkbox">
                    <span class="sub_title">${temp.chSubTitle}</span>

                    <div class="checkbox_class">

                        <c:forEach var="code" items="${temp.codeList}">
                            <input type="checkbox" id="${temp.categoryTemplateNo}_${code.code}"
                                   name="${temp.categoryTemplateNo}_${temp.inputType}" value="${code.code}"
                            <c:forEach var="detail" items="${temp.chDetailInfoList}">
                                   <c:if test="${code.code eq detail.code}">checked</c:if>
                            </c:forEach>> <!-- 디테일인포에 코드가 있고, 코드의 코드랑 일치한다면 체크드 -->
                            <label for="${temp.categoryTemplateNo}_${code.code}" class="check_font">
                                <span>${code.codeName}</span>
                            </label>
                        </c:forEach>

                    </div>
                </div>
                <br>
            </c:if>


            <!-- radio 일 경우 -->
            <c:if test="${temp.inputType eq 'radio'}">

                <div class="radio">
                    <span class="sub_title">${temp.chSubTitle}</span>

                    <div class="radio_class">

                        <c:forEach var="code" items="${temp.codeList}">
                            <input type="radio" id="${temp.categoryTemplateNo}_${code.code}"
                                   name="${temp.categoryTemplateNo}_${temp.inputType}" value="${code.code}"
                            <c:forEach var="detail" items="${temp.chDetailInfoList}">
                                   <c:if test="${code.code eq detail.code}">checked</c:if>
                            </c:forEach>>
                            <label for="${temp.categoryTemplateNo}_${code.code}">
                                <span class="radio_font">${code.codeName}</span>
                            </label>
                        </c:forEach>

                    </div>
                </div>
                <br>
            </c:if>


            <!-- text 일 경우 -->
            <c:if test="${temp.inputType eq 'text'}">
                <div class="text">
                    <span class="sub_title">${temp.chSubTitle}</span>

                    <div class="text_class">
                        <input type="text" class="text_size" name="${temp.categoryTemplateNo}_${temp.inputType}"
                               value="${temp.chDetailInfoList[0].chDetailInfoData}">
                    </div>

                </div>
                <br>
            </c:if>


            <!-- textarea 일 경우 -->
            <c:if test="${temp.inputType eq 'textarea'}">
                <div class="textarea">
                    <span class="sub_title">${temp.chSubTitle}</span> <br>

                    <div class="textarea_class">
                    <textarea name="${temp.categoryTemplateNo}_${temp.inputType}" id="" cols="95" rows="10"
                              class="textarea_font"
                              style="resize:none;">${temp.chDetailInfoList[0].chDetailInfoData}</textarea>
                    </div>
                </div>
                <br>
            </c:if>


            <!-- img 파일일 경우 -->
            <c:if test="${temp.inputType eq 'file'}">
                <div class="img">
                    <span class="sub_title">${temp.chSubTitle}</span> <br>

                    <div class="img_class">
                        <div class="basic_form_2">
                            <div class="flex-container">
                                <div class="wrapper">
                                    <img src="${empty temp.chDetailInfoList ? '' : temp.chDetailInfoList[0].filePath}"
                                         class="image-box"/>
                                    <input type="file" class="fileUpload" accept="image/*"
                                           data-category-template-no="${temp.categoryTemplateNo}"
                                           data-input-type="${temp.inputType}">
                                    <input type="hidden" name="${temp.categoryTemplateNo}_${temp.inputType}" value="${empty temp.chDetailInfoList ? '' : temp.chDetailInfoList[0].fileNo}">
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
            </c:if>


            <!-- number 일 경우 -->
            <c:if test="${temp.inputType eq 'number'}">
                <div class="number">
                    <span class="sub_title">${temp.chSubTitle}</span> <br>

                    <div class="number_class">
                        <input type="number" name="${temp.categoryTemplateNo}_${temp.inputType}" min="0" max="100"
                               step="1"
                               class="number_size"
                               value="${temp.chDetailInfoList[0].chDetailInfoData}">
                    </div>
                </div>
                <br>
            </c:if>


            <!-- range 일 경우 -->
            <c:if test="${temp.inputType eq 'range'}">
                <div class="range">
                    <span class="sub_title">${temp.chSubTitle}</span> <br>

                    <div class="ranger_class">
                        <input type="range" name="${temp.categoryTemplateNo}_${temp.inputType}" min="0" max="100"
                               step="5"
                               class="range_size"
                               list="tickmarks"
                               style="width: 750px;"
                               value="${temp.chDetailInfoList[0].chDetailInfoData}">
                        <datalist id="tickmarks">
                            <c:forEach var="i" begin="0" end="100" step="5">
                                <option value="${i}">i</option>
                            </c:forEach>
                        </datalist>
                    </div>
                </div>
                <br>
            </c:if>


            <!--datetime-local : 연도, 월, 일, 오전/오후 여부, 시, 분 입력 -->
            <c:if test="${temp.inputType eq 'datetime-local'}">
                <div class="datetime">
                    <span class="sub_title">${temp.chSubTitle}</span> <br>

                    <div class="datetime_class">
                        <input type="datetime-local" name="${temp.categoryTemplateNo}_${temp.inputType}"
                               class="datetime_size"
                               value="${temp.chDetailInfoList[0].chDetailInfoData}">
                    </div>
                </div>
            </c:if>
            </c:forEach>


        </div>
        <!-- 탬플릿 폼 안 영역 끝-->
    </div>


    <div class="btn_div">
        <button class="btn_1" onclick="confirm_challenge();">챌린지 인증 수정</button>
        <button class="btn_1" onclick="javascript:history.go(-1);">수정 취소</button>
    </div>


    <script>
        function confirm_challenge() {
            // TB_CH_CONFIRM 챌린지 인증 정보 넘기기
            let chNo = $("input[type=hidden][name=chNo]").val();            // 챌린지 일련번호
            let chConNo = $("input[type=hidden][name=chConNo]").val();            // 챌린지 인증일련번호
            let chConTitle = $("input[type=text][name=chConTitle]").val();      // 챌린지 인증 제목
            let memberId = $("input[type=hidden][name=memberId]").val();       // 회원아이디

            // 자 그럼 이제부터 여기에 챌린지 상세 정보 데이터 담기.....
            let templateList = []
            <c:forEach var="temp" items="${templateList}">
            templateList.push({
                categoryTemplateNo: '${temp.categoryTemplateNo}'
                , inputType: '${temp.inputType}'
            });
            </c:forEach>

            let list = []       // 이게 TB_CH_DETAIL_INFO
            for (let i = 0; templateList.length > i; i++) {
                // 만약 code랑 fileNo이 없을 경우
                if (templateList[i].inputType == 'text' || templateList[i].inputType == 'number'
                    || templateList[i].inputType == 'range' || templateList[i].inputType == 'datetime-local') {

                    list.push({
                        categoryTemplateNo: templateList[i].categoryTemplateNo,
                        chDetailInfoData: $('input[name=' + templateList[i].categoryTemplateNo + "_" + templateList[i].inputType + ']').val(),
                        code: null,
                        fileNo: null
                    });
                }

                if (templateList[i].inputType == 'textarea') {
                    list.push({
                        categoryTemplateNo: templateList[i].categoryTemplateNo,
                        chDetailInfoData: $('textarea[name=' + templateList[i].categoryTemplateNo + "_" + templateList[i].inputType + ']').val(),
                        code: null,
                        fileNo: null
                    });
                }

                if (templateList[i].inputType == 'file') {
                    list.push({
                        categoryTemplateNo: templateList[i].categoryTemplateNo,
                        chDetailInfoData: null,
                        code: null,
                        fileNo: $('input[name=' + templateList[i].categoryTemplateNo + "_" + templateList[i].inputType + ']').val()
                    });
                }

                if (templateList[i].inputType == 'select') {
                    list.push({
                        categoryTemplateNo: templateList[i].categoryTemplateNo,
                        chDetailInfoData: null,
                        code: $('select[name=' + templateList[i].categoryTemplateNo + "_" + templateList[i].inputType + ']').val(),
                        fileNo: null
                    });
                }
                if (templateList[i].inputType == 'radio') {
                    list.push({
                        categoryTemplateNo: templateList[i].categoryTemplateNo,
                        chDetailInfoData: null,
                        code: $('input[name=' + templateList[i].categoryTemplateNo + "_" + templateList[i].inputType + ']:checked').val(),
                        fileNo: null
                    });
                }
                if (templateList[i].inputType == 'checkbox') {
                    $('input[type="checkbox"][name=' + templateList[i].categoryTemplateNo + "_" + templateList[i].inputType + ']').each(function () {
                        if ($(this).is(':checked')) {
                            list.push({
                                categoryTemplateNo: templateList[i].categoryTemplateNo,
                                chDetailInfoData: null,
                                code: $(this).val(),
                                fileNo: null
                            });
                        }
                    });
                }
            }

            let confirmInfo = { // 인증 기본 정보
                chNo: chNo
               , chConNo: chConNo
                , chConTitle: chConTitle
                , memberId: memberId
                , chDetailInfoList: list
            }

            $.ajax({
                url: "/update.con"
                , type: "post"
                , data: JSON.stringify(confirmInfo)
                , contentType: 'application/json'
                , success: function (result) {
                    if (result > 0) {
                        alert("챌린지 인증이 성공적으로 수정되었습니다.");
                        location.href="detailView.con?chConNo=" + chConNo;
                    } else {
                        alert("챌린지 인증이 수정되지 않았습니다.");
                    }
                }
                , error: function () {
                    alert("챌린지 인증이 수정되지 않았습니다.");
                    console.log("챌린지 인증 수정 ajax 호출 실패");
                }
            });
        }

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
    </script>


</div>
<!-- 내용 영역 끝 -->

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>

</body>
</html>
