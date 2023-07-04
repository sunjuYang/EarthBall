<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        
        <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
        
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4ce7a8706f16f48bba913a5def2af6a"></script>
        
<style>
html, body{
    height: 100%;
    width: 100%;
}

#map {
    height: 100%;
    width: 100%;
    z-index: 0;
}
.sidebar {
    height: 100%;
    width: 450px;
    position: fixed;
    z-index: 1;
    top: 0;
    left: -480px;
    background-color: #fff;
    transition: 0.5s;
}

#filterStore{
    padding: 10px 32px 0px 32px; height: 30%;
}
#backToMain{
    display: grid; 
    grid-template-columns: 10%;
}
#backIcon{

    width: 100%;
    margin: 0px;
    font-size: 10px;
    color: #5085BB;
}
#backIcon:hover{
    cursor: pointer;
    color: #5085BB;
}
#backIcon span{
    font-size: 20px;
}

.header {
    margin-bottom: 15px;
    font-size: 40px
}

.dropdown button {
    height: 50px;
    border-radius: 30px;
    margin: 5px;
    width: 98%;
    margin-right: 20px;
}

#dropClasificarFilters{
    width: 100%; 
    border-radius: 10px;
}

.dropdown-menu{
    border-radius: 10px;
}
.dropdownCate input{
    margin: 5px;
    height: 50px;
    border-radius: 30px;
    width: 116px;
    background-color: black;
    border: 1px solid black;
}

.input-container {
    position: relative;
}

.form-control{
    border-radius: 30px;
    height: 50px;
    margin: 5px;
    width: 378px;

}


.search-icon {
    font-size: 25px;
    position: absolute;
    top: 50%;
    right: 30px;
    transform: translateY(-50%);
    color: #777;
}

.search-icon:hover{
    cursor: pointer;
    color: #5085BB;
}

hr{
    margin: 0px;
}

#searchResult{
    font-size: 16px;
    padding: 3px;
}

#likeList{
    justify-self: end;
    font-size: 16px;
    border-radius: 25px;
    width: 100%;
    height: 100%;
    background-color: #6c757d;;
    text-align: center;
    color: white;
    padding: 3px 3px 3px 0px;
}

#likeList:hover{
    cursor: pointer;
    background-color: #5c636d;
}

#likeList>i{
    color:#ff0000;
    font-size: 18px;
}

#settingMap{
    justify-self: end;
    font-size: 16px;
    border-radius: 25px;
    width: 100%;
    height: 100%;
    background-color: #6c757d;;
    text-align: center;
    color: white;
    padding: 3px 3px 3px 0px;
}

#settingMap:hover{
    cursor: pointer;
    background-color: #5c636d;
}

#settingMap>i{
    color:white;
    font-size: 18px;
}

.btn{
    width: 100%;
}

.searchList{
    padding: 17px 32px;
    border-bottom: 1px solid #ddd;
}

.storeTitle{
    font-size: 25px;
    font-weight: bold;
}
.storeInfo{
    font-size: 15px;
    color: black;
}
.searchList:hover{
    cursor: pointer;
    background-color: #ddd;
}
.openbtn {
    font-size: 20px;
    cursor: pointer;
    background-color: #111;
    color: white;
    padding: 10px 15px;
    border: none;
    position: fixed;
    left: 0;
    transition: .5s;
    border-radius: 0 15px 15px 0;
    top: 210px;
    height: 80px;
}

.openbtn:hover {
    background-color: #444;
}

#sideBtn {
    transition: margin-left .5s;
    
}
.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}


.pageN {
    height: 5%;
    display: grid;
    justify-content: center;
    align-items: center;
}

.paging-area {
    display: flex;
    list-style-type: none;
    padding-top: 7px;
    padding-bottom: 2px;
}

.paging-btn, .paging-next, .paging-prev{
    display: inline-block;
    margin: 5px;
    padding: 5px 8px;
    background-color: white;
    color: #333;
    text-decoration: none;
    border-radius: 10px;
    width: 38px;
    height: 36px;
    font-size: 16px;
    border: none;
}
.paging-btn-dis{
    display: inline-block;
    margin-right: 5px;
    padding: 5px 10px;
    text-decoration: none;
    border-radius: 10px;
    width: 38px;
    height: 36px;
    font-size: 16px;
    border: none;
    background-color: black;
    color: white;
    
}
.paging-prev:hover {
    background-color: #333;
    color: #fff;
}
.paging-btn:hover{
    background-color: #333;
    color: #fff;
}
.paging-next:hover{
    background-color: #333;
    color: #fff;
}

.like-btn {
    transition:  0.3s ease;
}

.like-btn:hover {
    color: #e87272; /* 호버 시 배경색을 빨간색으로 변경 */
    
}

.like-btn.clicked {
    color: #ff0000; /* 클릭 시 배경색을 빨간색으로 유지 */
}

.like-btn.clicked:hover{
    color: #e87272; /* 호버 시 배경색을 빨간색으로 변경 */
}

.swiper-slide{
    border: none;
}


</style>
</head>
<body>
    <c:if test="${ not empty alertMsg }">
        <script>
            alert("${alertMsg}");
            
        </script>
        <c:remove var="alertMsg" scope="session"/>
    </c:if>

    <!-- 지도부분 -->
    <div id="map"></div>

    <!-- 사이드바 -->
    <div id="mySidebar" class="sidebar">
        <div id="filterStore" style="height: 250px;">
            <div id="backToMain" style="padding-left: 10px;">
                <div id="backIcon" onclick="backZigu()">
                    <img src="/resources/fo/img/logo.png" style="width: 30px; height: 30px;"><div>HOME</div>
                </div>
            </div>
            <div class="header">
                <span>친환경 매장찾기</span>
            </div>
            <div>
                <div class="dropdown dropdownCate">
                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="dropClasificarFilter">
                        지역 검색
                    </button>
                    <ul class="dropdown-menu" id="dropClasificarFilters">
                        <li><a class="dropdown-item" onclick="regionSearch(event)">지역 검색</a></li>
                        <li><a class="dropdown-item" onclick="nameSearch(event);">주소/매장명 검색</a></li>
                    </ul>
                </div>
            </div>
            
            <div id="regionSelect" style="display: flex;">
                <div class="dropdown citySearch" style="width: 129px;">
                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="dropCityFilter">
                        시/도 선택
                    </button>

                    <ul class="dropdown-menu">
                        <c:forEach var="city" items="${cityList}">
                            <li>
                                <a class="dropdown-item"  onclick="cityFilter(event);">${city.city}</a>
                            </li>                        
                        </c:forEach>
                    </ul>
                </div>

                <div class="dropdown provincesSearch" style="width: 129px;" >
                    <button class="btn btn-secondary dropdown-toggle dropRegion" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="dropProvinceFilter" disabled>구/군 선택</button>
                    <ul class="dropdown-menu" id="provinceFilter" style=" max-height: 530px; overflow-y: auto;">
                        
                    </ul>
                </div>

                <div class="dropdown dropdownCate">
                    <input class="btn btn-primary" type="submit" onclick="settingFilterMap();" value="검색" disabled>
                </div>
            </div>
        </div>
        
        <div style="display: grid; grid-template-columns: 30% 30% 40%; padding: 0px 32px 10px 32px;">
            <div id="searchResult" style="padding-top: 3px;">
                
            </div>
            <div style="justify-self: center; width: 80%;">
                <input type="checkbox" class="btn-check" id="btn-check-2-outlined" checked autocomplete="off" onclick="settingMap();">
                <label class="btn btn-outline-secondary" for="btn-check-2-outlined" style="padding: 3px; border-radius: 30px;">좋아요 순</label><br>
            </div>
            <c:choose>
                <c:when test="${empty loginUser}">
                    <div id="likeList" onclick="goLoginForm();" style="justify-self: end;">
                        <i class="xi-heart xi-2x"></i>&nbsp;<span>맘에 든 매장보기</span>
                    </div>
                </c:when>
                <c:otherwise>
                    <div id="likeList" onclick="likeMap();" style="justify-self: end;">
                        <i class="xi-heart xi-2x"></i>&nbsp;<span>맘에 든 매장보기</span>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <hr>
        <div style="overflow-y: scroll; overflow-x: hidden; position:relative; height: 570px;">
            <hr>
            
            <div id="store-list-area">
            </div>
        </div>
        <div class="pageN">
            <div id="paging-area">
            </div>
        </div> 
    </div>

    <!-- 사이드바 버튼 -->
    <div id="sideBtn" >
        <button id="sidebarButton" class="openbtn" onclick="toggleNav();">&gt;</button>  
    </div>

    <script>
        
        let storeList = []; // [{}, {}, ..]
        let markerList = []; // 각 매장에 대한 마커들 담기
        let overlayList = []; // 각 매장에 대한 오버레이들 담기

        // 1. 모든 요소들이 화면에 다 로딩된 후 로직 시작
        $(function() {
            // 2. 지도 셋팅하기 & 데이터 불러오기
            settingMap();
        });

        function settingMap() {
            storeList = [];
            markerList = []; // 각 매장에 대한 마커들 담기
            overlayList = []; // 각 매장에 대한 오버레이들 담기
            // 지도 지우기 
            $('#map').empty();
            // 2_1. 지도 셋팅 완료
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
                mapOption = { 
                    center: new kakao.maps.LatLng(37.533880, 126.896771),
                    level: 5
                };
            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
            
            // 체크한지 안한지 확인
            var checkbox = document.getElementById('btn-check-2-outlined');
            var orderLikeCheck = checkbox.checked;
            
            memberId = '${loginUser.memberId}';
            
            // 2_2. ajax 로 전체 매장 조회해오기
            
            $.ajax({
                url : "getStores.st",
                type : "get",
                data : {
                    memberId : memberId, 
                    orderLikeCheck : orderLikeCheck
                },
                success : function(result) {

                    var checkbox = document.getElementById('btn-check-2-outlined');
                    
                    makeMarker(result, map);
                    
                    var likeMapBtn = document.createElement('div');
                    likeMapBtn.setAttribute('id', 'likeList');
                    likeMapBtn.setAttribute('onclick', 'likeMap()');
                    likeMapBtn.innerHTML = '<i class="xi-heart xi-2x"></i>&nbsp;<span>맘에 든 매장보기</span>';
                    document.getElementById('settingMap').replaceWith(likeMapBtn);
                    var checkbox = document.getElementById('btn-check-2-outlined');
                    checkbox.disabled = false;
                }, 
                error : function() {
                    console.log("ajax 통신 실패!");
                }
            });
        }
        
        function regionSearch(event) {
            var region = $(event.target).text();
            $("#dropClasificarFilter").text(region);

            var regionSelectHtml = `
            <div class="dropdown citySearch" style="width: 129px;">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="dropCityFilter">
                    시/도 선택
                </button>
                <ul class="dropdown-menu">
                    <c:forEach var="city" items="${cityList}">
                        <li>
                            <a class="dropdown-item" onclick="cityFilter(event);">${city.city}</a>
                        </li>                        
                    </c:forEach>
                </ul>
            </div>

            <div class="dropdown provincesSearch" style="width: 129px;">
                <button class="btn btn-secondary dropdown-toggle dropRegion" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="dropProvinceFilter" disabled>구/군 선택</button>
                <ul class="dropdown-menu" id="provinceFilter" style="max-height: 530px; overflow-y: auto;"></ul>
            </div>

            <div class="dropdown dropdownCate">
                <input class="btn btn-primary" type="submit" onclick="settingFilterMap();" value="검색" disabled>
            </div>
            `;

        $("#regionSelect").html(regionSelectHtml);
        }

        function nameSearch(event){
            var name = $(event.target).text();
            $("#dropClasificarFilter").text(name);

            $("#regionSelect").empty();

            // input 태그와 아이콘을 포함하는 컨테이너 추가
            var containerHtml = '<div class="input-container"><input type="text" class="form-control" placeholder="주소/매장명 검색" id="searchInput"><i class="xi-search xi-2x search-icon" onclick="getValueFromInput()"></i></div>';
            $("#regionSelect").append(containerHtml);

            // 검색 입력란에 입력이 있을 때 검색 버튼 활성화
            $("#searchInput").on("input", function() {
                var searchInput = $(this).val();

                // 검색 입력 값이 비어있지 않을 때 검색 버튼 활성화
                if (searchInput.trim() !== "") {
                    $(".dropdownCate input").prop("disabled", false);
                } else {
                    $(".dropdownCate input").prop("disabled", true);
                }
            });
        }

        function cityFilter(event){
            var city = $(event.target).text();
            // 시/도 선택 시 드롭다운 메뉴에 선택한 시/도 표시
            $("#dropCityFilter").text(city);
            
            // 시/도 선택 시 검색 버튼 활성화
            enableSearchButton();
            

            $.ajax({
                url : "getCities.st",
                type : "get",
                data : {
                    city : city
                },
                success : function(result) {
                    // return 값 다 담기
                    province = result;
                    
                    let provinceFilterHtml = "";
                    for (let i = 0; i < province.length; i++) {
                        provinceFilterHtml += '<li><a class="dropdown-item" onclick="provinceFilter(event);">' + province[i].provinces + '</a></li>';
                    }
                    
                    // 생성된 HTML을 도시 드롭다운 메뉴에 적용
                    $("#provinceFilter").html(provinceFilterHtml);
                },
                error : function() {
                    console.log("ajax 통신 실패");
                }
            });
            // 구/군 선택 초기화
            $("#dropProvinceFilter").text("구/군 선택");

        }

        function provinceFilter(event){
            var province = $(event.target).text();
            
            $("#dropProvinceFilter").text(province);
            enableSearchButton();
        }

        function enableSearchButton() {
            var city = $("#dropCityFilter").text();
            var province = $("#dropProvinceFilter").text();
            
            // 시/도가 선택되었을 경우에만 검색 버튼 활성화
            if (city !== "시/도 선택") {
            $()
                $(".dropdownCate input").prop("disabled", false);
                $(".dropRegion").prop("disabled", false);
            }
        }

        function settingFilterMap() {

            storeList = [];
            markerList = []; // 각 매장에 대한 마커들 담기
            overlayList = []; // 각 매장에 대한 오버레이들 담기
            // 폼 데이터 가져오기
            var city = $("#dropCityFilter").text();
            var provinces = $("#dropProvinceFilter").text();
            if(provinces == "구/군 선택"){
                provinces = "";
            }

            
            var checkbox = document.getElementById('btn-check-2-outlined');
            checkbox.setAttribute('onclick', 'settingFilterMap();');
            var orderLikeCheck = checkbox.checked;
            memberId = '${loginUser.memberId}';
            // 2_2. ajax 로 전체 매장 조회해오기
            $.ajax({
                url : "getFilter.st",
                type : "get",
                data: {
                    city : city,
                    provinces : provinces,
                    memberId : memberId,
                    orderLikeCheck : orderLikeCheck
                },
                success : function(result) {

                    storMap = result;
                    storeList = storMap.storeList;
                    storeAttaList = storMap.storeAttaList;
                    
                    
                    if(storeList.length == 0){
                        $("#store-list-area").html("<div class='noResult'>검색 결과가 없습니다.</div>");
                        $("#searchResult").html("<span>총 </span>" + 0 + "<span>개의 결과</span>");
                        $("#paging-area").html("");
                        return;
                    }

                    document.getElementById('map').innerHTML = ""; // 맵 초기화
                    
                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
                        mapOption = { 
                            center: new kakao.maps.LatLng(storeList[0].storeLat, storeList[0].storeLon),
                            level: 5
                        };
                    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
                    
                    makeMarker(result, map);

                }, 
                error : function() {
                    console.log("ajax 통신 실패!");
                }

            });
        }

        function getValueFromInput() {
            var searchValue = document.getElementById("searchInput").value;
            storeList = [];
            markerList = []; // 각 매장에 대한 마커들 담기
            overlayList = []; // 각 매장에 대한 오버레이들 담기
            memberId = '${loginUser.memberId}';

            var checkbox = document.getElementById('btn-check-2-outlined');
            checkbox.setAttribute('onclick', 'getValueFromInput();');
            var orderLikeCheck = checkbox.checked;
            
            $.ajax({
                url : "getNameSearch.st",
                type : "get",
                data : {
                    searchValue : searchValue,
                    memberId : memberId,
                    orderLikeCheck : orderLikeCheck
                },
                success : function(result) {

                    storMap = result;
                    storeList = storMap.storeList;
                    storeAttaList = storMap.storeAttaList;
                    
                    if(storeList.length == 0){
                        $("#store-list-area").html("<div class='noResult'>검색 결과가 없습니다.</div>");
                        $("#searchResult").html("<span>총 </span>" + 0 + "<span>개의 결과</span>");
                        $("#paging-area").html("");
                        return;
                    }

                    document.getElementById('map').innerHTML = ""; // 맵 초기화

                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
                        mapOption = { 
                            center: new kakao.maps.LatLng(storeList[0].storeLat, storeList[0].storeLon),
                            level: 5
                        };
                    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                    makeMarker(result, map);

                },
                error : function() {
                    console.log("ajax 통신 실패");
                }
            })
        }

        // 마커 클릭이벤트에 대한 이벤트핸들러함수
        function clickListener(map, marker, overlay) {
            return function() {
                overlay.setMap(map);
            };
        }

        // 오버레이 닫는 함수
        function closeOverlay(index) {
            if (overlayList[index]) {
                overlayList[index].setMap(null);
            }
        }
        
        function showList(storeMap, cPage) {
			// 페이징처리 (목록보기)
            let storeList = storeMap.storeList;
            let storeAttaList = storeMap.storeAttaList;
            
			let listCount = storeList.length;

            let listAttaCount = storeAttaList.length;
			let currentPage = cPage;
            let pageLimit = 5;
            let boardLimit = 10;
            
            let maxPage = parseInt(Math.ceil(listCount / boardLimit));
            let startPage = parseInt((currentPage - 1) / pageLimit) * pageLimit + 1;
            let endPage = startPage + pageLimit - 1;
            
            if(endPage > maxPage) {
                endPage = maxPage;
            }
            
            let offset = (currentPage - 1) * boardLimit;
            let limit = boardLimit;
            
			let resultStr = "";
			for (let i = offset; i < Math.min(offset + limit, listCount); i++) {
                var memberId = `${loginUser.memberId}`;
                
                var storeNo = storeList[i].storeNo;
                
                var liked = storeList[i].isLiked;
                var likeBtnClass = liked ? "xi-heart xi-2x like-btn clicked" : "xi-heart xi-2x like-btn";
                
                if (i >= listCount) {
                    break;
                }
                
                var storeImgStr = "";
                if (storeAttaList.length === 0) {
                    storeImgStr = "<div class='swiper-slide' style='border: none;' ><img src='/resources/fo/img/k.png"+ "' alt='매장사진' style='width: 100%; height: 100%;')'></div>";
                } else{
                    for (let j = 0; j < storeAttaList.length; j++) {
                        if (storeAttaList[j].storeNo === storeNo) {
                            storeImgStr += "<div class='swiper-slide' style='border: none;' ><img src='/resources/fo/upfiles/" + storeAttaList[j].changerName + "' alt='매장사진' style='width: 100%; height: 100%;' onclick='openModal(\"/resources/fo/upfiles/" + storeAttaList[j].changerName + "\")'></div>";
                                        
                        }
                    }
                }
                
                // 동적으로 리스트 요소 생성
                resultStr += "<div class='searchList " + i + "' data-storelat='" + storeList[i].storeLat + "' data-storelon='" + storeList[i].storeLon + "' data-storeno='" + storeList[i].storeNo + "' style='display:flex'>" +
                                "<div class='storeInfo' style='width:100%;'>" +
                                "<span class='storeTitle'>" + storeList[i].storeName + "</span> " +
                                "<i class='" + likeBtnClass + "' style='width: 20px; margin-right:10px;'></i>" +
                                "<span id='storeLikes'>" + storeList[i].storeLikes + "</span> <br>" +
                                "<span class='storeInfo'><i class='xi-location-arrow' style='width: 20px;'></i>" + storeList[i].storeAddress + " " + storeList[i].storeDetailAddress + "</span> <br>" +
                                "<span class='storeInfo'><i class='xi-call ' style='width: 20px;'></i>" + storeList[i].storePhone + "</span> <br>" +
                                "<span class='storeInfo'><i class='xi-time-o' style='width: 20px;'></i>영업시간 " + storeList[i].businessHours + "</span>" +
                                    "<div class='detail-info' style='display: none;'>" +
                                    "<p style='margin:0px;'><i class='xi-comment-o' style='width: 20px;'></i><span class='storeInfoText'>" + storeList[i].storeInfo + "</span></p>" +
                                        "<div class='swiper-container' style='width:100%; height: 200px; margin-top : 15px;'>" +
                                            "<div class='swiper-wrapper'>" +
                                                storeImgStr +
                                            "</div>" +
                                        "</div>" +
                                    "</div>" +
                                "</div>" +
                            "</div>";
            } 
			$("#store-list-area").html(resultStr);
            
            const mySwipers = document.querySelectorAll('.swiper-container');
            mySwipers.forEach(function(swiperElement) {
                const mySwiper = new Swiper(swiperElement, {
                    spaceBetween: 50, //위 slidesPerview 여백
                    autoplay: {
                        delay: 2000
                    },
                    loop: true,
                    pagination: { // 호출(pager) 여부
                        el: ".swiper-pagination", //버튼을 담을 태그 설정
                        clickable: true // 버튼 클릭 여부
                    }
                });
            });
			// 페이징처리 (페이징바보기)
			let pagingStr = "";
			
			if(currentPage != 1) {
				pagingStr += "<button class='paging-prev'><i class='xi-arrow-left'></i></button>";
			}
			
			for(let p = startPage; p <= endPage; p++) {
				
				if(currentPage == p) {
					pagingStr += "<button class='paging-btn-dis' disabled>"
                                + 	p
                                + "</button>";
                } else {
                    pagingStr += "<button class='paging-btn'>"
                                + 	p
                                + "</button>";
				}
			} 
			
			if(currentPage != maxPage) {
				pagingStr += "<button class='paging-next'><i class='xi-arrow-right'></i></button>";
			}
			
			$("#paging-area").html(pagingStr);
			
			return currentPage;
        }

        function makeMarker(storeMap, map){
            // return 값 다 담기
            let storeList = storeMap.storeList;
            let storeAttaList = storeMap.storeAttaList;

            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            let currentPage= showList(storeMap, 1);
            
            let listCount = storeList.length;

            // 이벤트핸들러 중복 제거 해줘야함 

            $("#paging-area").off("click", ".paging-btn");
            $("#paging-area").off("click", ".paging-prev");
            $("#paging-area").off("click", ".paging-next");
            $("#store-list-area").off("click", ".searchList");
            $("#store-list-area").off("click", ".like-btn");

            $("#paging-area").on("click", ".paging-btn", function() {
                currentPage = showList(storeMap, Number($(this).text()));
                
            });
            $("#paging-area").on("click", ".paging-prev", function() {
                currentPage = showList(storeMap, Number(currentPage) - 1);
            });
            $("#paging-area").on("click", ".paging-next", function() {
                currentPage = showList(storeMap, Number(currentPage) + 1);
            });


            // 2_3. 조회해온 매장 수를 storeCount에 담기
            let storeCount = storeList.length;
            
            let storeCountStr = "<span>총 </span>" + storeCount + "<span>개의 결과</span>";
            $("#searchResult").html(storeCountStr);
            // 2_3_2. 조회해온 매장 데이터를 storeList에 담기s
            for (let i = 0; i < storeCount; i ++) {
                
                // 각 매장에 대한 마커 생성                        
                var imageSrc = '/resources/fo/img/shop.png', // 마커이미지의 주소입니다    
                    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
                    imageOption = {offset: new kakao.maps.Point(34, 60)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
                    
                // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                    markerPosition = new kakao.maps.LatLng(storeList[i].storeLat, storeList[i].storeLon); // 마커가 표시될 위치입니다

                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                    position: markerPosition, 
                    image: markerImage // 마커이미지 설정 
                });

                // 마커가 지도 위에 표시되도록 설정합니다
                marker.setMap(map);  

                markerList.push(marker);
                
                // 각 매장에 대한 오버레이 생성
                var content = 
                    '<div class="wrap">' + 
                    '    <div class="info">' + 
                    '        <div class="title">' + storeList[i].storeName + 
                    '            <div class="close" onclick="closeOverlay(' + i + ')" title="닫기"></div>' + 
                    '        </div>' + 
                    '        <div class="body">' + 
                    '            <div class="img" style="border : none">' +
                    '                <img src="/resources/fo/upfiles/' + storeList[i].changerName +'"' + ' " width="73" height="70">' +
                    '           </div>' + 
                    '            <div class="desc">' + 
                    '                <div class="ellipsis">'+ storeList[i].storeAddress + '</div>' + 
                    '                <div class="jibun ellipsis"> (지번) ' + storeList[i].jibunAddress +'</div>' + 
                    '                <div class="businessHours">'+ storeList[i].businessHours + ' </div>' + 
                    '            </div>' + 
                    '        </div>' + 
                    '    </div>' +    
                    '</div>';
                    

                var overlay = new kakao.maps.CustomOverlay({
                    position: marker.getPosition(),
                    content: content
                });

                overlayList.push(overlay);

                // 마커에 클릭이벤트 걸기
                // 마커에 클릭이벤트를 등록합니다
                kakao.maps.event.addListener(marker, 'click', clickListener(map, marker, overlay));

            }

            markerList.forEach(function(marker, index) {
                
                kakao.maps.event.addListener(marker, 'click', function() {
                    openNav();
                    // 다른 오버레이 닫기
                    overlayList.forEach(function(item, idx) {
                        if (idx !== index) {
                            item.setMap(null);
                            isClosed[idx] = true;
                        }
                    });
                    
                    // console.log(overlayList[index].n); 누를 시 좌표값 받음
                    var position = overlayList[index].n;

                    // 해당 마커의 좌표로 지도 중심 이동
                    map.panTo(position);
                    
                    

                    if (isClosed[index]) { // 닫혀있음
                        overlayList[index].setMap(map);

                    } else { // 열려있음
                        overlayList[index].setMap(null);
                    }
                    
                    // 오버레이가 열려있는 경우에만 closeOverlay 함수 호출
                    if (!isClosed[index]) {
                        closeOverlay(index);
                    }

                    isClosed[index] = !isClosed[index];
                    console.log(Math.ceil((index + 1) / 10));
                    currentPage = showList(storeMap, Math.ceil((index + 1) / 10));
                    
                    // 리스트에서 해당 마커의 detailInfo 보이기
                    var detailInfo = $(".searchList." + index + " .detail-info");
                    console.log(detailInfo);
                    if (detailInfo) {
                        detailInfo.show();

                        detailInfo[0].scrollIntoView({ behavior: 'smooth', block: 'end' });
                    }
                    // 열린 다른 detailInfo 닫기
                    $(".searchList").not(".searchList." + index).find(".detail-info").hide();
                });
            });

            // 오버레이가 닫혔는지 열렸는지 검사하는 배열
            let isClosed = [];
            for(let i = 0; i < storeList.length; i++) {
                isClosed.push(true);
            }

            // 리스트에 클릭 걸기
            $("#store-list-area").on("click", ".searchList", function() {
                
                let index = $(this).attr("class").split(" ")[1];
                // 상세 정보를 보여줄 요소 찾기
                var detailInfo = $(this).find(".detail-info")[0];
                console.log("리스트클릭" + detailInfo);
                // 상세 정보를 보이도록 함
                if (detailInfo) {
                    // 상세 정보를 보이도록 함
                    detailInfo.style.display = "block";

                    // 스크롤 이동시킴
                    detailInfo.scrollIntoView({ behavior: 'smooth', block: 'end' });
                }

                 // 다른 div 숨기기
                $(".searchList").not(this).find(".detail-info").hide();
                if (isClosed[index]) { // 닫혀있음
                    // 다른 창 다 닫기
                    overlayList.forEach(function(item, idx) {
                        item.setMap(null);
                        isClosed[idx] = true;
                    });

                    overlayList[index].setMap(map);
                    

                    var moveLatLon = new kakao.maps.LatLng(storeList[index].storeLat, storeList[index].storeLon);
                    map.panTo(moveLatLon);

                     // 상세 정보, 이미지 및 좋아요 버튼을 보이도록 함
                    $(this).find(".detail-info").show();

                } else { // 열려있음
                    overlayList[index].setMap(null);
                    // 상세 정보, 이미지 및 좋아요 버튼을 숨김

                    $(this).find(".detail-info").hide();
                }
                isClosed[index] = !isClosed[index];
            });

            $("#store-list-area").on("click", ".like-btn", function(event) {
                event.stopPropagation();

                var memberId = `${loginUser.memberId}`;
                if (!memberId) {
                    alert("로그인 후 이용해주세요.");
                    location.href = "loginForm.me?store="+ "store";
                    return;
                }

                // button 의 정보들을 가져옴
                var $button = $(this);

                
                if ($button.hasClass("clicked")) {
                    $button.removeClass("clicked");
                } else {
                    $button.addClass("clicked");
                }

                // button 의 부모 div 의 정보들을 가져옴
                var $searchList = $button.closest(".searchList");

                // button 의 부모 div 의 정보들을 가져옴
                var storeNo = $searchList.data("storeno");
                
                // 좋아요의 수 가져오기
                var $storeLikes = $searchList.find("#storeLikes");
                var storeLikes = parseInt($storeLikes.text());
                
                // 좋아요 여부 가져오기
                var isLiked = $button.hasClass("clicked");
                
                
                $.ajax({
                    url: "storeLikes.st",
                    method: "POST",
                    data: {
                        storeNo: storeNo,
                        isLiked: isLiked,
                        storeLikes: storeLikes,
                        memberId: memberId
                    },
                    success: function(data) {
                        // 서버로부터 응답을 받은 후 처리할 로직 작성
                        isLiked = data;
                        if (!isLiked) {
                            // 좋아요 취소 시
                            storeLikes--;
                            $button.removeClass("clicked");
                            
                        } else {
                            // 좋아요 추가 시
                            storeLikes++;
                            $button.addClass("clicked");
                        }
                        // 좋아요 수 업데이트
                        $storeLikes.text(storeLikes);

                        location.href = location.href;

                    },
                    error: function() {
                        console.log("에러발생");
                    }
                });
            });
            
        }

        function openNav() {
            document.getElementById("mySidebar").style.left = "0";
            document.getElementById("sideBtn").style.marginLeft = "450px";
            document.getElementById("sidebarButton").style.left = "450px";
            document.getElementById("sidebarButton").innerHTML = "&lt;";
        }

        function closeNav() {
            document.getElementById("mySidebar").style.left = "-450px";
            document.getElementById("sideBtn").style.marginLeft= "0";
            document.getElementById("sidebarButton").style.left = "0";
            document.getElementById("sidebarButton").innerHTML = "&gt;";
        }

        function toggleNav() {
            if (document.getElementById("mySidebar").style.left == "0px") {
                closeNav();
            } else {
                openNav();
            }
        }

        function backZigu(){
            location.href = "/main";
        }

        function goLoginForm(){
            alert("로그인 후 이용해주세요.");
            location.href = "loginForm.me?store="+ "store";
        }

        function likeMap() {
            
            storeList = [];
            markerList = []; // 각 매장에 대한 마커들 담기
            overlayList = []; // 각 매장에 대한 오버레이들 담기
            
            memberId = '${loginUser.memberId}';
            
            $.ajax({
                url : "likeListView.st",
                type : "post",
                data : {
                    memberId : memberId,
                },
                success : function(result) {
                    storMap = result;
                    storeList = storMap.storeList;
                    storeAttaList = storMap.storeAttaList;

                    // 전체매장 보기 버튼 생성                    
                    var settingMapBtn = document.createElement('div');
                    settingMapBtn.setAttribute('id', 'settingMap');
                    settingMapBtn.setAttribute('onclick', 'settingMap()');
                    settingMapBtn.innerHTML = '<i class="xi-home xi-2x"></i>&nbsp;<span>전체매장 보기</span>';
                    document.getElementById('likeList').replaceWith(settingMapBtn);
                    
                    var checkbox = document.getElementById('btn-check-2-outlined');
                    checkbox.disabled = true;

                    if(storeList.length == 0){
                        $("#store-list-area").html("<div class='noResult'>검색 결과가 없습니다.</div>");
                        $("#searchResult").html("<span>총 </span>" + 0 + "<span>개의 결과</span>");
                        $("#paging-area").html("");
                        return;
                    }

                    document.getElementById('map').innerHTML = ""; // 맵 초기화

                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
                        mapOption = { 
                            center: new kakao.maps.LatLng(storeList[0].storeLat, storeList[0].storeLon),
                            level: 5
                        };
                    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                    makeMarker(result, map);

                },
                error : function() {
                    console.log("ajax 통신 실패");
                }
            });
        }

        let currentModalElement = null;

        function openModal(imageUrl) {
            event.stopPropagation(); // 이벤트 버블링(stopPropagation) 방지
        // 이미 모달이 열려있는 경우 닫기
            if (currentModalElement) {
                currentModalElement.remove();
                currentModalElement = null;
            }

            // 모달 요소 생성
            const modalElement = document.createElement("div");
            modalElement.classList.add("modal");

            // 모달 내용 생성
            const modalContentElement = document.createElement("div");
            
            modalContentElement.classList.add("modal-content");

            // 이미지 요소 생성
            const imgElement = document.createElement("img");
            imgElement.src = imageUrl;
            imgElement.alt = "매장사진";
            imgElement.style.width = "100%";
            imgElement.style.height = "100% !important";

            // 이미지를 모달 내용에 추가
            modalContentElement.appendChild(imgElement);

            // 모달 내용을 모달에 추가
            modalElement.appendChild(modalContentElement);

            // 모달 스타일 적용
            modalElement.style.display = "block";
            modalElement.style.justifyContent = "center";
            modalElement.style.alignItems = "center";
            modalElement.style.position = "fixed";
            modalElement.style.top = "50%";
            modalElement.style.left = "30%";
            modalElement.style.width = "400px";
            modalElement.style.height = "400px";
            
            

            // 모달을 body 요소에 추가
            document.body.appendChild(modalElement);

            // 현재 열린 모달 요소 저장
            currentModalElement = modalElement;

            // 모달 닫기 이벤트 처리
            modalElement.addEventListener("click", function(event) {
                
                modalElement.remove();
                currentModalElement = null;
            });

        }


    </script>
</body>
</html>