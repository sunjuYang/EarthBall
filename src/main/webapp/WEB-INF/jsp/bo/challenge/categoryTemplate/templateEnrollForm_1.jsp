<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>탬플릿 등록 폼</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        #enrollForm>table {width:100%;}
        #enrollForm>table * {margin:5px;}
    </style>
</head>
<body>


    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>탬플릿 생성</h2>
            <br>

            <form id="enrollForm" method="post" action="">
                <table algin="center">
                    <tr>
                        <th>카테고리 번호</th>
                        <td><input type="" class="form-control" name="categoryNo" value="${ category.categoryNo }" readonly></td>
                    </tr>
                    <tr>
                        <th>입력타입</th>
                        <td>
                            <select name="inputType" id="">
                                <option value="select">select</option>
                                <option value="checkbox">checkbox</option>
                                <option value="radio">radio</option>
                                <option value="text">text</option>
                                <option value="textarea">textarea</option>
                                <option value="file">file</option>
                                <option value="number">number</option>
                                <option value="range">range</option>
                                <option value="datetime-local">datetime-local</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>챌린지 소제목</th>
                        <td>
                            <input type="text" class="form-control" name="subTitle" required>
                        </td>
                    </tr>
                    <tr>
                        <th>그룹코드</th>
                        <td>
                            <input type="text" class="form-control" name="grpCode" required>
                        </td>
                    </tr>
                    <tr>
                        <th>우선순위</th>
                        <td>
                            <input type="number" name="sortNo" min="0" max="20" step="1">
                        </td>
                    </tr>



                </table>
                <br>

                <div align="center">
                    <button type="button" class="btn btn-primary" onclick="insertTemp();" >생성하기</button>
                    <button type="reset" class="btn btn-danger" onclick="javascript:history.go(-1);">생성취소</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>

    <script>
        function insertTemp() {

            let categoryNo = $("input[name=categoryNo]").val();
            let categoryTemplateNo = $("input[name=templateNo]").val();
            let inputType = $("select[name=inputType]").val();
            let chSubTitle = $("input[name=subTitle]").val();
            let grpCode = $("input[name=grpCode]").val();
            let sortNo = $("input[name=sortNo]").val();

            let data = {
                  categoryNo : categoryNo
                , categoryTemplateNo : categoryTemplateNo
                , inputType : inputType
                , chSubTitle : chSubTitle
                , grpCode : grpCode
                , sortNo : sortNo
            }

            $.ajax({
                  url : "insert.te"
                , type : "post"
                , data : data
                , success : function () {
                    alert("탬플릿이 생성되었습니다.");
                    console.log("탬플릿 생성 성공");
                    location.href="/detail.ca?categoryNo=" + categoryNo ;
                }
                , error : function () {
                    alert("탬플릿이 생성되지 않았습니다.");
                    console.log("탬플릿 생성 실패");
                }
            });
            return true;
        }

    </script>

</body>
</html>
