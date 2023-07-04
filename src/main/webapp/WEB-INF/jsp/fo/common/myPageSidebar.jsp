<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="sidebar">
  <h2 class="divider"></h2>
  <ul class="menu1">
    <li><a href="/list.myChallenge?memberId=${ loginUser.memberId }">챌린지 현황</a></li>
    <li><a href="diaryList.me?memberId=${ loginUser.memberId }">환경 일기 </a></li>
    <li><a href="/list.myOrder?memberId=${ loginUser.memberId }">주문 관리</a></li>
    <li><a href="list.like?memberId=${ loginUser.memberId }">찜 목록</a></li>
    <li><a href="list.mybo?memberId=${loginUser.memberId}">1:1문의</a></li>
    <li><a href="/list.myPoint?memberId=${loginUser.memberId}">포인트 내역</a></li>
    <li><a href="updateInfo.me">내 정보 수정</a></li>
    <li><a href="" data-toggle="modal" data-target="#deleteForm">회원탈퇴</a></li>
  </ul>
</div>

 <!-- 회원탈퇴를 누르면 나오는 모달창 -->
        <div class="modal fade" id="deleteForm">
        	<div class="modal-dialog modal-sm">
        		<div class="modal-content">
        		
        			<div class="modal-header">
        				<h4 class="modal-title">회원탈퇴</h4>
        				<button type="button" class="close" data-dismiss="modal" onclick="closeModal();">&times;</button>
        			</div>
        			
        			<form action="delete.me" method="post">
        				<div class="modal-body">
        					<div align="center">
        						탈퇴 후 복구는 불가능할 수 있습니다. <br>
        						정말로 탈퇴 하시겠습니까? <br>
        					</div>
        					<br>
        						<label for="memberPwd" class="mr-sm-2">비밀번호 확인 : </label>
        						<input type="password" class="form-control mb-2 mr-sm-2" placeholder="비밀번호를 입력해주세요" id='"memberPwd' name="memberPwd"> <br>
        						<input type="hidden" name="memberId" value="${ loginUser.memberId }"> 
        				</div>
        				
        				<div class="modal-footer" align="center">
        					<button type="submit" class="btn btn-danger">탈퇴하기</button>
        				</div>
        			</form>
        		</div>
        	</div>
        </div>
        
        <script>
			$(document).ready(function() {
			    $('a[data-toggle="modal"]').on('click', function(e) {
			        e.preventDefault();  // prevent navigation
			        var target = $(this).attr('data-target');
			        $(target).modal('show');
			    });
			});
			
			$(document).ready(function() {
			    $('#my-modal .my-button').on('click', function() {
			        console.log('Button clicked!');
			    });
			});

			$(document).ready(function() {
			    $(".close").click(function() {
			        $("#deleteForm").modal("hide");
			    });
			});
			
		</script>
