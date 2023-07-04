<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
 *  {
        box-sizing: border-box; /*전체에 박스사이징*/
        outline: none; /*focus 했을때 테두리 나오게 */
     }

    body{
        font-family: 'Noto Sans KR', sans-serif;
        font-size:14px;
        background-color: #f5f6f7;
        line-height: 1.5em;
        color : #222;
        margin: 0;
    }

    a{
        text-decoration: none;
        color: #222;
    }

    /*member sign in*/
    .member{
        width: 400px;
        /* border: 1px solid #000; */
        margin: auto; /*중앙 정렬*/
        padding: 0 px;
        margin-bottom: 20px;
    }

    .member .logo{
        /*로고는 이미지라 인라인 블록이니까 마진 오토 안됨 블록요소만 됨 */
        display: block;
        margin :60px px;
    }

    .member .field{
        margin :5px 0; /*상하로 좀 띄워주기*/
    }

    .logo {
        width: 345px;
        margin: 0 auto;
    }

    .member b{
        /* border: 1px solid #000; */
        display: block; /*수직 정렬하기 */
        margin-bottom: 5px;
    }

    /*input 중 radio 는 width 가 100%면 안되니까 */
    .member input:not(input[type=radio]),.member select{
        border: 1px solid #dadada;
        padding: 15px;
        width: 100%;
        margin-bottom: 5px;
    }

    .member input[type=button],
    .member input[type=submit]{
    background-color: #19A7CE;
    color:#fff
    }

    .member input:focus, .member select:focus{
        border: 1px solid #19A7CE;
    }

    .field.birth div{ /*field 이면서 birth*/
        display: flex;
        gap:10px; /*간격 벌려줄때 공식처럼 사용핟나 */
    }

    /* .field.birth div > * {  gap 사용한거랑 같은 효과를 줌 
        flex:1;
    } */

    .field.tel-number div {
        display: flex;
    }

    .field.tel-number div input:nth-child(1){
        flex:2;
    }

    .field.tel-number div input:nth-child(2){
        flex:1;
    }

    .field.gender div{
        border: 1px solid #dadada;
        padding: 15px 5px;
        background-color: #fff;
    }

    .placehold-text{
        display: block; /*span 으로 감싸서 크기영역을 블록요소로 만들어ㅜ저야한다*/
        position:relative;
        /* border: 1px solid #000; */
    }

    .placehold-text:before{ 
        position:absolute; /*before은 inline 요소이기 때문에 span으로 감싸줌 */
        right : 1px;
        top:13px;
        pointer-events: none; /*자체가 가지고 있는 pointer event 를 없애준다 */
    }

    .userpw{
        background:url(./images/images2/icon-01.png) no-repeat center right 15px;
        background-size: 20px;
        background-color: #fff;
    }

    .userpw-confirm{
        background:url(./images/images2/icon-02.png) no-repeat center right 15px;
        background-size: 20px;
        background-color: #fff;
    }

    .member-footer {
        text-align: center;
        font-size: 12px;
        margin-top: 20px;
    }

    .member-footer div a:hover{
        text-decoration: underline;
        color:#19A7CE;
    }

    .member-footer div a:after{
        content:'|';
        font-size: 10px;
        color:#bbb;
        margin-right: 5px;
        margin-left: 7px;
        /*살짝 내려가 있기 때문에 위로 올려주기 위해 transform 사용하기*/
        display: inline-block;
        transform: translateY(-1px);

    }
    
    #submit1:hover {
    	cursor: pointer;
	}
	
	#button1:hover {
		cursor:pointer;
	}
    .member-footer div a:last-child:after{
        display: none;
    }

    @media (max-width:768px) {
        .member{
            width: 100%;
        }
    }

</style>
<title>회원 정보 수정</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <div class="member">
        <!-- 1. 로고 -->
        <a href="/">
        <img class="logo" src="/resources/fo/img/logo2.png" alt="지구공 로고">
							 </a>
    <form action="update.me" method="post">
        <!-- 2. 필드 -->
        <div class="field">
            <b>아이디 *</b>
            <span class="placehold-text">
            <input type="text" name="memberId" value="${loginUser.memberId }" readonly ></span>
        </div>
        
        <div class="field">
		    <b>비밀번호 *</b>
		    <input id="memberPwd" class="userpw" type="password" placeholder="8자 이상 - 대문자 특수문자 포함 비밀번호를 입력해주세요" name="memberPwd" required>
		    <div id="checkPwdResult1" style="font-size : 0.8em; display : none"></div>
		</div>
		
		<div class="field">
		    <b>비밀번호 재확인 *</b>
		    <input id="checkPwd" class="userpw-confirm" type="password" placeholder="다시한번 입력해주세요" required>
		    <div id="checkPwdResult2" style="font-size : 0.8em; display : none"></div>
		</div>

        <div class="field">
            <b>닉네임 *</b>
            <input type="text" name="memberName" value="${loginUser.memberName}" readonly>
        </div>

        <!-- 3. 필드(생년월일) -->
        <div class="field birth" >
            <b>생년월일 *</b>
            <div>
                <input type="date"  name="birthDate" id="birthDate" value="${loginUser.birthDate}" required>                
    	   </div>
    	 </div>

        <!-- 4. 필드(성별) -->
		       <div class="field gender">
		    <b>성별</b>
		    <div>
		        <label>
		            <input type="radio" id="Male" value="M" name="gender">남자
		        </label>
		        <label>
		            <input type="radio" id="Female" value="F" name="gender">여자
		        </label>
		    </div>
		</div>
        <!-- 5. 이메일_전화번호 -->
        <div class="field">
            <b>본인 확인 이메일<small> *</small></b>
            <input type="email" placeholder="선택입력" name="email" value="${loginUser.email}" readonly>
        </div>
        
        <div class="field tel-number">
            <b>휴대전화 *</b>
            <div>
                <input type="text" placeholder="전화번호 입력 - 제외" name="phone" value="${ loginUser.phone }" maxlength="11" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
            </div>
            <input type="hidden" placeholder="인증번호를 입력하세요" disabled>
        </div>
        
        <div class="field tel-number">
            <b>주소 *</b>
            <div>
                <input type="tel" name="postCode" placeholder="우편번호" id="sample6_postcode" value="${loginUser.postCode }" required readonly >
                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" >
            </div>
	            <input type="text" name="address1" placeholder="주소"  id="sample6_address" value="${ loginUser.address1 }" required>
	            <input type="text" name="address2"placeholder="상세주소"  id="sample6_detailAddress" value="${ loginUser.address2 }" required>
	            <input type="text" placeholder="참고항목" id="sample6_extraAddress">
        </div>
        <!-- 6. 가입하기 버튼 -->
        <input type="submit" value="수정하기" id="submit1">

        </form>
        
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
        <script>
		    $(function() {
		        var gender = "${loginUser.gender}";
		        
		        if(gender) {
		        	
		            $("input[name=gender][value=" + gender + "]").prop("checked", true);
		            
		        }
		    });
		</script>
        
        <!-- 주소 API 등록 -->
        <script>
		    function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("sample6_extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample6_extraAddress").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample6_postcode').value = data.zonecode;
		                document.getElementById("sample6_address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("sample6_detailAddress").focus();
		            }
		        }).open();
		    }
		</script>
		
		<script>
	        
	        var memberPwd = document.getElementById('memberPwd');
	        var checkPwd = document.getElementById('checkPwd');
	        
	        
	        var checkPwdResult1 = document.getElementById('checkPwdResult1');
	        var checkPwdResult2 = document.getElementById('checkPwdResult2');
	        
	
	        var pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
	
	
	     
	        function validatePassword() {
	            if(!pwReg.test(memberPwd.value)) {
	                checkPwdResult1.style.color = 'red';
	                checkPwdResult1.style.display = 'block';
	                checkPwdResult1.innerHTML = '비밀번호는 최소 8자 이상이며, 대문자, 소문자, 숫자, 특수문자를 최소 하나 이상 포함해야 합니다.';
	                return;
	            } else {
	                checkPwdResult1.style.display = 'none';
	            }
	            
	            if(memberPwd.value === checkPwd.value) {
	                checkPwdResult2.style.color = 'green';
	                checkPwdResult2.style.display = 'block';
	                checkPwdResult2.innerHTML = '두 비밀번호가 일치합니다.';
	            } else {
	                checkPwdResult2.style.color = 'red';
	                checkPwdResult2.style.display = 'block';
	                checkPwdResult2.innerHTML = '두 비밀번호가 일치하지 않습니다.';
	            }
	        }
	        
	        memberPwd.onchange = validatePassword;
	        memberPwd.onkeyup = validatePassword;
	        checkPwd.onkeyup = validatePassword;
    </script>
		
		
        <!-- 7. 푸터 -->
        <div class="member-footer">
            <div>
                <a href="#none">이용약관</a>
                <a href="#none">개인정보처리방침</a>
                <a href="#none">회원정보 고객센터</a>
            </div>
            <span><a href="#none">Gigu0.</a></span>
        </div>
    </div>    

</body>
</html>