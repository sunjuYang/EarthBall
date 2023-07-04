// 메인 슬라이드
$(function(){
    $('.mainSlide').slick({
        dots: true,
        autoplay : true,
        autoplaySpeed : 3000,
        speed : 1000,
        infinite : true
    });
});


// 환경일기장 슬라이드

$(function(){
    $('.diarySlide').slick({
        autoplay : true,
        autoplaySpeed : 1000,
        speed : 2000,
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 3
    });
});

// 챌린지 상세조회로 넘기기
function challengeDetailView(chNo) {
    location.href="/detailView.chall?chNo=" + chNo;
}

// 상품 상세조회로 넘기기
function detailView(){
    // input type hidden에 담긴 값 가져오기
    var productNo = $(event.target).children("input").val();
}
