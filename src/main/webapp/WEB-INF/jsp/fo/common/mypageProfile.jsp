<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="profile">
  <div class="profile-1">
      <img class="profile-picture" onclick="openModal();" src="/resources/fo/upfiles/${loginUser.memberImg}">
    <div>
    <p class="memberName">${loginUser.memberName}님 환영합니다!</p>
    <p style="margin: 0;">현재 등급은 ${loginUser.gradeName} 입니다.</p>
    </div>
  </div>
  <div class="profile-2">
    포인트 <br>
    <span class="point">${loginUser.totalPoint}</span>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">프로필</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form enctype="multipart/form-data">
        <div class="modal-body">
    
          <div>
          <input type="file" name="upfile">
          <input type="hidden" name="changeName" value="${ loginUser.memberImg }">
          </div>
        
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >닫기</button>
        <button type="button" class="btn btn-primary" onclick="insertProfile();">변경</button>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
	function openModal(){
		$('#exampleModal').modal('show');
	}
	
	function insertProfile(){
		var memberId = '${loginUser.memberId}';
		var profileImg = $("input[name=upfile]")[0].files[0];
		var changeName = $("input[name=changeName]").val();
	
		console.log(profileImg);
		console.log(memberId);
		console.log(changeName);
	
		var formData = new FormData();
	
		formData.append("memberId", memberId);
		formData.append("changeName", changeName);
	
		if(profileImg != null){
		formData.append("profileImg", profileImg);
		}else{
		alert("프로필 사진을 선택해주세요.");
		return;
		}
	
		$.ajax({
		url: "insertProfile",
		type: "post",
		data: formData,
		processData: false,
		contentType: false,
		success: function(result){
			console.log("성공");
			$('#exampleModal').modal('hide');
			location.reload();
		},
		error: function(){
			console.log("실패");
			$('#exampleModal').modal('hide');
		}
		});
	}
</script>
