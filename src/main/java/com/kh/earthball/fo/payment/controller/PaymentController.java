package com.kh.earthball.fo.payment.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.member.vo.Member;
import com.kh.earthball.fo.payment.service.PaymentService;
import com.kh.earthball.fo.payment.vo.PayInfo;
import com.kh.earthball.fo.payment.vo.PayPageList;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@Slf4j
public class PaymentController {

  private final PaymentService paymentService;

  // 장바구니 => 결제페이지 포워딩
  @PostMapping("payments.pa")
  public String paymentsPageForm(PayPageList ppl, Model model, HttpSession session) {

    // 이메일 인증한 회원이 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || 1 != loginUser.getMailAuth()) {
      return "fo/common/emailAuthError";
    }

    model.addAttribute("orderList", paymentService.selectProductList(ppl.getOrders()));

    return "fo/payment/paymentPageForm";
  }

  //상품상세페이지 => 결제페이지 포워딩
 @PostMapping("payment.pa")
 public String paymentPageForm(PayPageList ppl, Model model, HttpSession session) {

  // 이메일 인증한 회원이 아니라면 접근 불가하도록 설정
  Member loginUser = (Member) session.getAttribute("loginUser");
  if (loginUser == null || 1 != loginUser.getMailAuth()) {
    return "fo/common/emailAuthError";
  }

   int amount = ppl.getOrders().get(0).getAmount();

   model.addAttribute("amount", amount);
   model.addAttribute("orderList", paymentService.selectProductItem(ppl.getOrders()));

   return "fo/payment/paymentPageForm";
 }

  // 결제페이지 => 결제완료페이지 포워딩
  @PostMapping("payComplete.pa")
  public String paymentCompleteView(String paymentNo, Model m, HttpSession session) {

    // 이메일 인증한 회원이 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || 1 != loginUser.getMailAuth()) {
      return "fo/common/emailAuthError";
    }

    m.addAttribute("paymentNo", paymentNo);
    return "fo/payment/paymentCompleteView";
  }

  //결제 성공 시 실행
  @ResponseBody
  @PostMapping(value = "/paySuccess", produces = "text/html; charset=UTF-8")
  public String paySuccess(PayInfo pi, HttpSession session) {

    // 결제정보 DB에 추가
    int result = paymentService.payComplete(pi);

    if(result == 1) {

      // 누적구매금액 업데이트
      int addTotal = paymentService.addTotalPay(pi);

        if(addTotal == 1) {

          // 등급 업데이트
          paymentService.updateGrade(pi);

        }
    }

    return String.valueOf(result); // 1 -> "1"
  }

  /*
  // 주문상품 DB에 추가
  @ResponseBody
  @RequestMapping(value="/insertOrder", method={RequestMethod.POST})
  public String insertOrder(Orders param) {

    System.out.println("paymentNo : " + param.getPaymentNo());
    System.out.println("itemAmount : " + param.getItemAmount());
    System.out.println("orderList : " + param.getOrderList());

    // int result = paymentService.insertOrder(orderList);

    return "1";
  }
*/

  // 마이페이지 주문 내역
  @GetMapping("/list.myOrder")
  public String myOrder(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, String memberId, Model model, HttpSession session) {

    // 이메일 인증한 회원이 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || 1 != loginUser.getMailAuth()) {
      return "fo/common/emailAuthError";
    }

    // 나의 주문내역 수 조회
    int listCount = paymentService.myOrderListCount(memberId);

    int pageLimit = 5;
    int boardLimit = 20;

    PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    // 나의 주문내역 리스트 조회
    List<PayInfo> orderList = paymentService.selectMyOrder(pageInfo, memberId);

    model.addAttribute("pageInfo", pageInfo);
    model.addAttribute("orderList", orderList);

    return "fo/mypage/myOrder";
  }

  // 주문 취소 요청
  @ResponseBody
  @PostMapping("/reqPayCancel")
  public String reqPayCancel(PayInfo p) {

    int result = paymentService.reqPayCancel(p);

    return String.valueOf(result);
  }

}