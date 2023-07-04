function categoryList(){
    //console.log(event.target.value);
    location.href = "categoryList.pro?category=" + event.target.value;
}

function AllList(){
    location.href = "list.pro"
}

function detailView(){
    // input type hidden에 담긴 값 가져오기
    var productNo = $(event.target).children("input").val();
}

// 등록순, 낮은 가격순, 높은 가격순 정렬
// function changeCategory(){
//     console.log("changeCategory() 호출됨");
//     var category = $("#sel").val();

//     location.href = "selectCategory.pro?category=" + category;
// }