package com.kh.earthball.bo.payment.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kh.earthball.bo.payment.service.BoPaymentService;
import com.kh.earthball.bo.payment.vo.BoPayInfo;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.member.vo.Member;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@Slf4j
public class BoPaymentController {

  private final BoPaymentService boPaymentService;

  @GetMapping("/list.cpa")
  public String cancelPayList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model, HttpSession session) {

    // 관리자가 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      return "redirect:/loginForm.me";
    }

    // 모든 취소 요청 수 조회
    int listCount = boPaymentService.cancelPayListCount();

    int pageLimit = 10;
    int boardLimit = 10;

    PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    // 모든 취소 요청 리스트 조회
    List<BoPayInfo> boCancelPayList = boPaymentService.selectCancelPayList(pageInfo);

    model.addAttribute("pageInfo", pageInfo);
    model.addAttribute("cancelList",  boCancelPayList);

    return "bo/payment/cancelPayListView";
  }

  // 주문 취소처리 확인
  @ResponseBody
  @PostMapping("/acceptCancel")
  public String acceptCancel(BoPayInfo p) {

    int result = boPaymentService.acceptCancel(p);

    return String.valueOf(result);
  }

}
