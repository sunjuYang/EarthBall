const canvas = document.getElementById("jsCanvas");
const ctx = canvas.getContext("2d");
const colors = document.getElementsByClassName("jsColor");
const range = document.getElementById("jsRange");
const mode =  document.getElementById("jsMode");

const INITIAL_COLOR = "#000000"
const CANVAS_SIZE= 660;
const CANVAS_SIZE1= 400;

ctx.strokeStyle = "#2c2c2c";

canvas.width= CANVAS_SIZE;
canvas.height = CANVAS_SIZE1;
ctx.strokeStyle = INITIAL_COLOR;
ctx.fillStyle = INITIAL_COLOR;
ctx.lineWidth = 3.5;

let painting = false;
let filling = false;

function stopPainting() {
    painting = false;
}

function startPainting() {
    painting = true;
}

function onMouseMove(event) {

    const x = event.offsetX;
    const y = event.offsetY;
    if (!painting) {
        ctx.beginPath();
        ctx.moveTo(x, y);
    } else if (painting) {
        ctx.lineTo(x, y);
        ctx.stroke();
    }
}

function handleColorClick(event) {
    const color = event.target.style.backgroundColor;
    ctx.strokeStyle = color;
    ctx.fillStyle = color;
}

function handleRangeChange(event) {
    const size = event.target.value;
    ctx.lineWidth = size;
}

function handleModeClick() {
    if(filling === true) {
        filling = false;
        $("#jsMode").html("채우기");
    } else {
        filling = true;
        $("#jsMode").html("그리기");
    }
}

function handleCanvasClick() {
    if ( filling) {
        ctx.fillRect(0, 0, CANVAS_SIZE, CANVAS_SIZE1);
    }
}

if(canvas) {
    canvas.addEventListener("mousemove", onMouseMove);
    canvas.addEventListener("mousedown", startPainting);
    canvas.addEventListener("mouseup", stopPainting);
    canvas.addEventListener("mouseleave", stopPainting);
    canvas.addEventListener("click", handleCanvasClick);
}


Array.from(colors).forEach(color =>
    color.addEventListener("click", handleColorClick));

if(range) {
    range.addEventListener("input", handleRangeChange);
}

if(mode) {
    mode.addEventListener("click", handleModeClick);
}

function colorChange(color){
    ctx.strokeStyle = color;
}

// 전체 지우기
function clearAll(){
	if(window.confirm("전체 지우기 하시겠습니까?")) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    }
}


// 날씨 선택 안 할 시 경고창 띄우기
function validateSelection() {
  var weatherInput = document.getElementById("weather");

  if (weatherInput.value === "") {
    // 날씨 버튼 또는 캔버스가 선택되지 않은 경우
    alert("날씨를 선택해주세요.");
    return false; // 다음으로 진행되지 않음
  }

  return true; // 선택이 유효하면 다음으로 진행
}

// 이미지 전송
 function drawingBtn() {

	 if (!validateSelection()) {
    // 선택이 유효하지 않은 경우
    return false; // 글 등록 중단
  }

  // 내용 최소 글자수 200자
  var content = document.getElementById('dyBoardContent').value;
  if(content.length < 150) {
    alert("최소 150자 이상 입력해야 합니다.");
     return false;
  }
	 console.log("호출되나?")

    var imgDataUrl = canvas.toDataURL('image/png');

    var blobBin = atob(imgDataUrl.split(',')[1]);	// base64 데이터 디코딩
    var array = [];
    for (var i = 0; i < blobBin.length; i++) {
        array.push(blobBin.charCodeAt(i));
    }
    var file = new Blob([new Uint8Array(array)], {type: 'image/png'});	// Blob 생성
    var formdata = new FormData();	// formData 생성
    formdata.append("file", file, "image.png");	// file data 추가

	let dyBoardWriter = document.getElementById('dyBoardWriter').innerText;
    let dyBoardTitle = document.getElementById('dyBoardTitle').value;
    let dyBoardContent = document.getElementById('dyBoardContent').value;
	let weather = document.getElementById('weather').value;

    formdata.append('dyBoardWriter', dyBoardWriter);
    formdata.append('dyBoardTitle', dyBoardTitle);
    formdata.append('dyBoardContent', dyBoardContent);
    formdata.append('weather', weather);


    $.ajax({
        type : 'post',
        url : '/diaryInsert.bo',
        data : formdata,
        processData : false,	// data 파라미터 강제 string 변환 방지!!
        contentType : false,	// application/x-www-form-urlencoded; 방지!!
        success : function (data) {

           if(data === "게시글 등록 완료") {

			// 포인트 지급
			plusPoint();

			   alert(data);
			   location.href = "diaryListView.bo";
		   } else {

			   alert(data);
		   }

        }, error : function() {
		 		alert("게시글 등록 실패");
		}
    });

    }

// 수정하기
 function updateBtn() {

	 console.log($("#dyBoardNo").val())

  // 내용 최소 글자수 150자
  var content = document.getElementById('dyBoardContent').value;
  if(content.length < 150) {
    alert("최소 150자 이상 입력해야 합니다.");
     return false;
  }
	 console.log("호출되나?")

    var imgDataUrl = canvas.toDataURL('image/png');

    var blobBin = atob(imgDataUrl.split(',')[1]);	// base64 데이터 디코딩
    var array = [];
    for (var i = 0; i < blobBin.length; i++) {
        array.push(blobBin.charCodeAt(i));
    }
    var file = new Blob([new Uint8Array(array)], {type: 'image/png'});	// Blob 생성
    var formdata = new FormData();	// formData 생성
    formdata.append("file", file, "image.png");	// file data 추가

	let dyBoardWriter = document.getElementById('dyBoardWriter').innerText;
    let dyBoardTitle = document.getElementById('dyBoardTitle').value;
    let dyBoardContent = document.getElementById('dyBoardContent').value;
	let weather = document.getElementById('weather').value;
	let dyBoardNo = $("#dyBoardNo").val();
	let originName = $("#originName").val();
	let changeName = $("#changeName").val();

    formdata.append('dyBoardWriter', dyBoardWriter);
    formdata.append('dyBoardTitle', dyBoardTitle);
    formdata.append('dyBoardContent', dyBoardContent);
    formdata.append('weather', weather);
    formdata.append('dyBoardNo', dyBoardNo);
    formdata.append('originName', originName);
    formdata.append('changeName', changeName);

    console.log(formdata.get("originName"))
    console.log(formdata.get("changeName"))

    $.ajax({
        type : 'post',
        url : '/dyUpdate.bo',
        data : formdata,
        processData : false,	// data 파라미터 강제 string 변환 방지!!
        contentType : false,	// application/x-www-form-urlencoded; 방지!!
        success : function (data) {

           if(data === "게시글 등록 완료") {

			   alert(data);
			   location.href = "diaryListView.bo";
		   } else {

			   alert(data);
		   }

        }, error : function() {
		 		alert("게시글 등록 실패");
		}
    });

    }

// 포인트 넣어주기
function plusPoint() {

	let dyBoardWriter = document.getElementById('dyBoardWriter').innerText;

	$.ajax({
		url : "/insertPoint",
		type : "post",
		data : {
			pointContent : "일기 작성", // 포인트적립 사유 ex) 일기 작성, 챌린지 인증
			pointNum : 100, // 부여할 포인트값
			status : "+",
			memberId : dyBoardWriter // 로그인한 회원 아이디
		},
		success : function(result) {

			if(result == "1") {

				console.log("포인트 내역 추가 성공");
			} else {
				console.log("포인트 내역 추가 실패");
			}
		},
		error : function() {
			console.log("포인트 추가 ajax 실패");
		}
	});
}

// 포인트 삭제하기
function minusPoint() {

	let dyBoardWriter = document.getElementById('dyBoardWriter').innerText;

	$.ajax({
		url : "/insertPoint",
		type : "post",
		data : {
			pointContent : "일기 삭제", // 포인트적립 사유 ex) 일기 작성, 챌린지 인증
			pointNum : 100, // 부여할 포인트값
			status : "-",
			memberId : dyBoardWriter // 로그인한 회원 아이디
		},
		success : function(result) {

			if(result == "1") {

				console.log("포인트 삭제 성공");
			} else {
				console.log("포인트 삭제 실패");
			}
		},
		error : function() {
			console.log("포인트 추가 ajax 실패");
		}
	});
}


// 날씨 아이콘 버튼 이벤트
 document.querySelector('#c_1').addEventListener('click', function(event) {
  event.preventDefault();

  var target = document.querySelector('#c_1');
  if (target.classList.contains('active1')) {
    target.classList.remove('active1');
	document.getElementById("weather").value = "";
  } else {
    target.classList.add('active1');
	document.querySelector('#c_2').classList.remove('active2');
	document.querySelector('#c_3').classList.remove('active3');
	document.querySelector('#c_4').classList.remove('active4');

	document.getElementById("weather").value = "1";

  }

});

 document.querySelector('#c_2').addEventListener('click', function(event) {
  event.preventDefault();
  var target = document.querySelector('#c_2');
  if (target.classList.contains('active2')) {
    target.classList.remove('active2');
	document.getElementById("weather").value = "";
  } else {
    target.classList.add('active2');
    document.querySelector('#c_1').classList.remove('active1');
    document.querySelector('#c_3').classList.remove('active3');
	document.querySelector('#c_4').classList.remove('active4');

	document.getElementById("weather").value = "2";

  }


});

 document.querySelector('#c_3').addEventListener('click', function(event) {
  event.preventDefault();
  var target = document.querySelector('#c_3');
  if (target.classList.contains('active3')) {
    target.classList.remove('active3');
	document.getElementById("weather").value = "";
  } else {
    target.classList.add('active3');
    document.querySelector('#c_1').classList.remove('active1');
    document.querySelector('#c_2').classList.remove('active2');
	document.querySelector('#c_4').classList.remove('active4');

	document.getElementById("weather").value = "3";

  }

});

 document.querySelector('#c_4').addEventListener('click', function(event) {
  event.preventDefault();
  var target = document.querySelector('#c_4');
  if (target.classList.contains('active4')) {
    target.classList.remove('active4');
	document.getElementById("weather").value = "";
  } else {
    target.classList.add('active4');
    document.querySelector('#c_1').classList.remove('active1');
    document.querySelector('#c_2').classList.remove('active2');
	document.querySelector('#c_3').classList.remove('active3');

	document.getElementById("weather").value = "4";
 // console.log(document.getElementById("weather").value);
  }

});


// 오늘 날짜 자동 설정
const todayTime = () => {

var now = new Date();
var year = now.getFullYear();
var month = now.getMonth() + 1;
var date = now.getDate();
var day = now.getDay();

 var days = ['일', '월', '화', '수', '목', '금', '토'];
 var dayName = days[day];

	return {
        year: year,
        month: month,
        date: date,
        day: dayName
    };
};

const updateYear = () => {
    document.getElementById("year").textContent = todayTime().year.toString().padStart(4, "0");
};
updateYear();

const updateMonth = () => {
    document.getElementById("month").textContent = todayTime().month.toString().padStart(2, "0");
};
updateMonth();

const updateDate = () => {
    document.getElementById("date").textContent = todayTime().date.toString().padStart(2, "0");
};
updateDate();


const updateDay = () => {
    document.getElementById("day").textContent = todayTime().day;
};
updateDay();

//이전페이지(목록)으로 돌아가기
function goBack() {
  window.history.back();
}
