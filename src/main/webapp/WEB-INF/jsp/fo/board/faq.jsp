<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 게시판</title>

	<jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>

 	<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="https://kenwheeler.github.io/slick/slick/slick-theme.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>




    <style>

     .hover tr:hover {
    background-color: #f5f5f5;
  	}


        /* ---------------------------------- */

        .search2>form {
            position: relative;
            width: 200px;

        }

        .search2>form>img {
            position : absolute;
		    width: 17px;
		    top: 10px;
		    right: 30px;
		    margin: 0;
		 }

        .search2>form>input {
           border: 1px solid #bbb;
		    border-radius: 8px;
		    padding: 10px 12px;
		    font-size: 14px;
        }

        /* ---------------------------------- */


        /* 공지사항 */
        table {
        border-collapse: collapse;
        width: 100%;
        }

        td, th {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
        }

        #boardtext {
        background-color:#ffffff;
        border: solid 0.1rem #19a7ce;
        border-radius: 0.7rem;
        color: #19a7ce;
        font-family : Roboto, 'Source Sans Pro';
        font-size: 1.2rem;
        font-weight: 500;
        line-height: 1.1725;
        text-align: center;
        }

        .auto-group-t8bp-ei9 {
        align-items:  center;
        flex-shrink:  0;
        height : 4.6rem;
        margin-bottom: 11.9rem;
        width: 100%;
        }

        .btn-group { float: right; }

        #list, #insertList { /* 버튼크기를 지정 */
              font-size: 18px;
		    width: 100px;
		    height: 100%;
		    border: none;
		    color: white;
		    border-radius: 5px;
		    background-color: #19A7CE;
		    cursor: pointer;
        }

        #QZWUheUHEXEqWaaaEWt8BP {
        background-color: #19a7ce;
        box-shadow: 0 0.4rem 0.4rem rgba(0, 0, 0, 0.25);
        color: #ffffff;
        display: flex;
        font-family: Inter, 'Source Sans Pro';
        font-size: 1.2rem;
        font-weight: 400;
        line-height: 1.2125;
        white-space: nowrap;
        width: 36.4rem;
        }

        .mId {
    text-decoration: none;
     color: black;
  }
  	.enrollbo {
  	    text-decoration: none;
     color: white;
  	}

	/*-------------  버튼 스타일 ---------------*/

		#page {
		  text-align: center;
		  display: inline-flex;
		  align-items: center;
		  justify-content: space-around
		}
		.page_btn {
		  align-items: center;
		}
		.pagination {
		  list-style: none;
		  padding: 0;
		  margin-top: 20px;
		}
		.pagination li {
		  display: inline;
		  text-align: center;
		}
		/* 숫자들에 대한 스타일 지정 */
		.pagination a {
		  float: left;
		  display: block;
		  font-size: 14px;
		  text-decoration: none;
		  padding: 5px 12px;
		  color: #797979;
		  line-height: 1.5;
		}
		.first { margin-right: 15px; }
		.last { margin-left: 15px; }
		.first:hover, .last:hover, .arrow_left:hover, .arrow_right:hover {
		  color: #146C94;
		}
		.pagination a:active {
		  cursor: default;
		  color: #69ABCE;
		}
		.pagination a:active {
		  outline: none;
		}
		.num {
		  margin-left: 3px;
		  padding: 0;
		  width: 30px;
		  -moz-border-radius: 100%;
		  -webkit-border-radius: 100%;
		  border-radius: 100%;
		}
		.num:hover {
		  background-color: #146C94;
		  color: #FFFFFF;
		}
		.num:active, .modal .num:active {
		  background-color: #69ABCE;
		  cursor: pointer;
		}

		.title{
            width : 250px;
            height : 70px;
            margin : 30px 0px 0px 15px;
            box-sizing : border-box;
            align-items : center;
            display : flex;
        }

           .bar {
            width : 12px;
            height : 70px;
            background-color : #146C94;
        }

         .title_text{
            width : 200px;
            height : 50px;
            font-size : 40px;
            font-weight : bold;
            padding : 0px 0px 7px 10px;
        }

    </style>
</head>
<body>

		<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

    	<div id="container">

        		<!-- 배너 -->
				<div class="title_all" style="padding-top: 50px; padding-bottom: 25px">
				<div class="title">
                <div class="bar"></div>
                <div class="title_text">FAQ</div>
				</div>
				</div>


        <!-- 공지사항 -->
        <div class="board">

                <br/>

<table>
    <thead>
        <tr>
            <th colspan="8">
                <div style="display: grid; grid-template-columns: 1fr auto;">
                    <div style="text-align: center;">
                            <h4 style="margin: 0;">자주 문의하시는 질문입니다.
							더 자세한 문의는 '문의하기' 게시판을 이용해주세요</h4>
                    </div>
                    <div style="text-align: right;">

                    </div>
                </div>
            </th>
        </tr>
    </thead>
           <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">FAQ</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
          <a class="nav-link" href="list.no">공지사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="list.bo">1:1문의</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
        </thead>
        <tbody>
            <c:forEach var="b" items="${list}">
                <tr>
                    <td class="bno">${b.boardNo}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/detail.bo?bno=${b.boardNo}">${b.boardTitle}</a>
                    </td>
                    <td>${b.memberId}</td>
                    <td>${b.boardDate}</td>
                </tr>
            </c:forEach>
            <tr>
        </tbody>
    </table>
       <div class="accordion" id="accordionExample">
                        <div class="accordion-item">
                          <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                무통장입금 후 입금 확인이 안돼요.
                            </font></font></button>
                          </h2>
                          <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
                            <div class="accordion-body">
                              <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">무통장 입금 주문건의 경우 주문 확인 시 수동으로 입금 확인을 진행하고 있으며, 오전 10시 이후 주문 시 익일에 확인 처리가 진행됩니다.

                                금요일 오전 10시 이후 혹은 주말에 주문 및 입금을 진행해주실 경우 입금 확인이 불가능하여 전산상 입금 마감기한 경과로 취소 요청 처리가 될 수 있으나, 가까운 영업일 오전에 담당자 확인 후 취소 철회 및 정상적으로 배송 처리되므로 우려하지 않으셔도 괜찮습니다.

                                빠른 입금 확인 처리를 원하실 경우, 홈페이지 우측 하단 채널톡 상담을 통해 주문번호와 함께 입금 확인 요청을 주시면 처리 도와드리겠습니다.</font>
                            </div>
                          </div>
                        </div>
                        <div class="accordion-item">
                          <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                              아이디와 비밀번호가 기억나지 않아요.
                            </font></font></button>
                          </h2>
                          <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                              <strong>우측 상단의 'Login' 메뉴에 접속하여 '내계정찾기'를 통해 아이디와 비밀번호를 찾으실 수 있습니다.
                                아이디는 이메일 형식이며, 계정 정보는 가입하신 이메일 주소로 전달됩니다.
                                가입하신 이메일 주소를 통해 비밀번호를 재설정하실 수 있습니다.
                                </strong>
                            </div>
                          </div>
                        </div>
                        <div class="accordion-item">
                          <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                              반품 보낸 상품은 언제 환불되나요?
                            </font></font></button>
                          </h2>
                          <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                              <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">반품이 완료된 날 바로 환불을 진행하며, 환불은 카드사 사정에 따라 영업일 기준 3~7일 정도 소요됩니다.
                                자세한 사항은 카드사에 문의 부탁드리며, 7일 이후에도 환불이 되지 않은 경우 고객센터를 통해 문의 부탁드립니다.</font>
                             </div>
                          </div>
                        </div>
                        <div class="accordion-item">
						  <h2 class="accordion-header" id="headingThree2">
						    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree2" aria-expanded="false" aria-controls="collapseThree2">
						      <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회원 탈퇴를 하고 싶어요.</font></font>
						    </button>
						  </h2>
						  <div id="collapseThree2" class="accordion-collapse collapse" aria-labelledby="headingThree2" data-bs-parent="#accordionExample">
						    <div class="accordion-body">
						      <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회원탈퇴를 희망하실 경우, '마이페이지 > 회원탈퇴' 메뉴를 통해 가능합니다.
회원 정보는 탈퇴 시 모두 즉시 삭제되며, 작성하신 게시물은 삭제되지 않습니다.
탈퇴 후 같은 계정으로 재가입하여도 기존에 보유하신 적립금 및 쿠폰은 복원되지 않습니다.</font></font></strong>
						    </div>
						  </div>
						</div>
						<div class="accordion-item">
						  <h2 class="accordion-header" id="headingThree3">
						    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree3" aria-expanded="false" aria-controls="collapseThree3">
						      <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회원가입 시 어떤 혜택이 있나요?</font></font>
						    </button>
						  </h2>
						  <div id="collapseThree3" class="accordion-collapse collapse" aria-labelledby="headingThree3" data-bs-parent="#accordionExample">
						    <div class="accordion-body">
						      <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회원 가입 시 기본 적립금을 제공하며, 특별 이벤트 기간에 할인이나 무료배송 등 다양한 혜택을 받으실 수 있습니다.
또한, 누적 구매 금액에 따라 등급별 혜택도 제공하고 있습니다.
비회원의 경우 혜택 대상에서 제외되니, 회원가입을 통해 여러 가지 혜택을 받아보세요.</font></font></strong>
						    </div>
						  </div>
						</div>
						<div class="accordion-item">
						  <h2 class="accordion-header" id="headingThree4">
						    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree4" aria-expanded="false" aria-controls="collapseThree4">
						      <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">불량/오배송의 경우 택배비를 부담해야 하나요?</font></font>
						    </button>
						  </h2>
						  <div id="collapseThree4" class="accordion-collapse collapse" aria-labelledby="headingThree4" data-bs-parent="#accordionExample">
						    <div class="accordion-body">
						      <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">불량/오배송 등 판매자 귀책사유로 인한 반품/교환의 경우 택배비를 모두 부담하고 있습니다.</font></font></strong>
						    </div>
						  </div>
						</div>
						<div class="accordion-item">
						  <h2 class="accordion-header" id="headingThree5">
						    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree5" aria-expanded="false" aria-controls="collapseThree5">
						      <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">교환/반품시 택배비는 얼마인가요?</font></font>
						    </button>
						  </h2>
						  <div id="collapseThree5" class="accordion-collapse collapse" aria-labelledby="headingThree5" data-bs-parent="#accordionExample">
						    <div class="accordion-body">
						      <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">지구샵의 기본 택배비는 3,000원입니다.
이에 따라 반품/교환 시 왕복 택배배송료는 6,000원입니다.
불량/오배송 등 판매자 귀책사유로 인한 반품/교환의 경우 택배비를 모두 부담하고 있습니다.
반품/교환의 사유에 따라 반품/교환 배송비가 달라질 수 있으므로 반품/교환 접수 전 고객센터를 통해 문의 부탁드립니다.</font></font></strong>
						    </div>
						  </div>
						</div>
						<div class="accordion-item">
						  <h2 class="accordion-header" id="headingThree6">
						    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree6" aria-expanded="false" aria-controls="collapseThree6">
						      <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">배송 전 주문 취소하고 싶어요.</font></font>
						    </button>
						  </h2>
						  <div id="collapseThree6" class="accordion-collapse collapse" aria-labelledby="headingThree6" data-bs-parent="#accordionExample">
						    <div class="accordion-body">
						      <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">배송 전 주문 취소는 주문상태가 '결제완료' 상태일 경우만 가능하며, 이미 배송처리된 경우 불가합니다.
자세한 사항은 고객센터로 문의 주시면 친절히 안내해드리겠습니다.</font></font></strong>
						    </div>
						  </div>
						</div>
						<div class="accordion-item">
						  <h2 class="accordion-header" id="headingThree7">
						    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree7" aria-expanded="false" aria-controls="collapseThree7">
						      <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">비회원도 상품 주문이 가능한가요?</font></font>
						    </button>
						  </h2>
						  <div id="collapseThree7" class="accordion-collapse collapse" aria-labelledby="headingThree7" data-bs-parent="#accordionExample">
						    <div class="accordion-body">
						      <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">지구샵은 비회원으로도 이용가능합니다.
다만 적립금, 쿠폰 및 각종 할인혜택 대상에서 제외됩니다.
회원가입시 다양한 혜택을 제공하고 있으니 사이트 이용에 참고 부탁드립니다.</font></font></strong>
						    </div>
						  </div>
						</div>
						<div class="accordion-item">
						  <h2 class="accordion-header" id="headingThree8">
						    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree8" aria-expanded="false" aria-controls="collapseThree8">
						      <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">비회원 주문확인 및 배송 조회는 어떻게 하나요?</font></font>
						    </button>
						  </h2>
						  <div id="collapseThree8" class="accordion-collapse collapse" aria-labelledby="headingThree8" data-bs-parent="#accordionExample">
						    <div class="accordion-body">
						      <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">'로그인' 메뉴에서 비회원 주문 건에 대한 주문정보를 확인하실 수 있습니다.</font></font></strong>
						    </div>
						  </div>
						</div>
						<div class="accordion-item">
						  <h2 class="accordion-header" id="headingThree9">
						    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree9" aria-expanded="false" aria-controls="collapseThree9">
						      <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
상품을 포장 없이 구매하고 싶어요.</font></font>
						    </button>
						  </h2>
						  <div id="collapseThree9" class="accordion-collapse collapse" aria-labelledby="headingThree9" data-bs-parent="#accordionExample">
						    <div class="accordion-body">
						      <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">지구샵 내 제품은 가급적 포장없이 제공하고 있습니다.
다만, 제조사 측의 요청이나 제품 위생상 포장이 반드시 필요한 경우, 제품의 안전한 배송을 위해 포장이 필요한 경우 등 포장된 제품도 있으니 구매에 참고 부탁드립니다. 포장이 필요한 경우, 자원의 낭비를 최소화 하기위해 다중포장 되지 않도록 노력하고 있습니다.

최소한의 포장, 무포장으로 제품을 받고자 희망하실 경우 배송메세지에 꼭 메세지를 남겨주세요. 확인 후, 제품 발송 시 최소한의 포장으로 보내드립니다.</font></font></strong>
						    </div>
						  </div>
						</div>
						<div class="accordion-item">
						  <h2 class="accordion-header" id="headingThree10">
						    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree10" aria-expanded="false" aria-controls="collapseThree10">
						      <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
주문한 상품 중 일부만 배송됐어요.</font></font>
						    </button>
						  </h2>
						  <div id="collapseThree10" class="accordion-collapse collapse" aria-labelledby="headingThree10" data-bs-parent="#accordionExample">
						    <div class="accordion-body">
						      <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">지구샵은 낭비되는 자원 및 탄소배출을 최소화하고자 가급적 모든 상품을 일괄 발송하고 있습니다.
다만, 일부 품절 상품의 재입고가 늦어지는 경우 품절상품을 제외한 나머지 상품들을 먼저 발송합니다.
품절 상품이 생길 경우 미리 고객님께 연락드려 합배송받으실지, 품절 외 상품만 먼저 받으실지 여쭤보고 있습니다.</font></font></strong>
						    </div>
						  </div>
						</div>

						<div class="accordion-item">
						  <h2 class="accordion-header" id="headingThree11">
						    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree11" aria-expanded="false" aria-controls="collapseThree11">
						      <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
회원등급에 대해 알고 싶어요.</font></font>
						    </button>
						  </h2>
						  <div id="collapseThree11" class="accordion-collapse collapse" aria-labelledby="headingThree11" data-bs-parent="#accordionExample">
						    <div class="accordion-body">
						      <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">지구샵은 누적 구매 금액에 따라 등급별 혜택을 제공하고 있습니다.

ECO LOVER : 가입시 적용 / 기본적립금 1%
EARTH LOVER : 최근3개월간 구매금액 100,000원 이상 / 기본적립금 1% + 추가적립금 1% (최대적립금 10,000원)
LESS WASTER : 최근3개월간 구매금액 300,000원 이상 / 기본적립금 1% + 추가적립금 2% (최대적립금 30,000원)
ZERO WASTER : 최근3개월간 구매금액 500,000원 이상 / 기본적립금 1% + 추가적립금4% (최대적립금 50,000원)</font></font></strong>
						    </div>
						  </div>
						</div>

						<div class="accordion-item">
						  <h2 class="accordion-header" id="headingThree12">
						    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree12" aria-expanded="false" aria-controls="collapseThree12">
						      <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
반품 보낸 상품은 언제 환불되나요?</font></font>
						    </button>
						  </h2>
						  <div id="collapseThree12" class="accordion-collapse collapse" aria-labelledby="headingThree12" data-bs-parent="#accordionExample">
						    <div class="accordion-body">
						      <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">반품이 완료된 날 바로 환불을 진행하며, 환불은 카드사 사정에 따라 영업일 기준 3~7일 정도 소요됩니다.
자세한 사항은 카드사에 문의 부탁드리며, 7일 이후에도 환불이 되지 않은 경우 고객센터를 통해 문의 부탁드립니다.</font></font></strong>
						    </div>
						  </div>
						</div>

						<div class="accordion-item">
						  <h2 class="accordion-header" id="headingThree13">
						    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree13" aria-expanded="false" aria-controls="collapseThree13">
						      <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">

주문 취소한 대금은 언제 환불되나요?</font></font>
						    </button>
						  </h2>
						  <div id="collapseThree13" class="accordion-collapse collapse" aria-labelledby="headingThree13" data-bs-parent="#accordionExample">
						    <div class="accordion-body">
						      <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">취소한 주문 건에 대한 환불은 카드사 사정에 따라 환불 접수일로부터 영업일 기준 3~7일 정도 소요됩니다.
자세한 사항은 카드사에 문의 부탁드리며, 7일 이후에도 환불이 되지 않은 경우 고객센터를 통해 문의 부탁드립니다.</font></font></strong>
						    </div>
						  </div>
						</div>

						<div class="accordion-item">
						  <h2 class="accordion-header" id="headingThree14">
						    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree14" aria-expanded="false" aria-controls="collapseThree14">
						      <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
주문한 상품 중 일부만 배송됐어요.</font></font>
						    </button>
						  </h2>
						  <div id="collapseThree14" class="accordion-collapse collapse" aria-labelledby="headingThree14" data-bs-parent="#accordionExample">
						    <div class="accordion-body">
						      <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">지구샵은 낭비되는 자원 및 탄소배출을 최소화하고자 가급적 모든 상품을 일괄 발송하고 있습니다.
다만, 일부 품절 상품의 재입고가 늦어지는 경우 품절상품을 제외한 나머지 상품들을 먼저 발송합니다.
품절 상품이 생길 경우 미리 고객님께 연락드려 합배송받으실지, 품절 외 상품만 먼저 받으실지 여쭤보고 있습니다.</font></font></strong>
						    </div>
						  </div>
						</div>
                      </div>
</div>
<!-- page_search div -->
</div>
</div>

<script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "8094ae3e-4590-4830-854a-710d02743bc2"
  });
</script>
<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>
</body>

</html>