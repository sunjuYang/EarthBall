package com.kh.earthball.fo.point.controller;

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
import com.kh.earthball.fo.point.service.PointService;
import com.kh.earthball.fo.point.vo.Point;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@Slf4j
public class PointController {

  private final PointService pointService;

  // 포인트 DB에 추가
  @ResponseBody
  @PostMapping("/insertPoint")
  public String insertPoint(Point p) {

    int result1 = 0;
    int result2 = 0;

    if(p.getPointNum() != 0) {
      result1 = pointService.insertPoint(p);
    }

    if(result1 == 1) {

      // 포인트 DB에 추가 후 멤버컬럼의 누적포인트 갱신
      if(p.getStatus().equals("+") && p.getPointNum() != 0) {
        result2 = pointService.plusMemberPoint(p);
      } else if(p.getStatus().equals("-") && p.getPointNum() != 0) {
        result2 = pointService.minusMemberPoint(p);
      }

    }

    int result = (result1 * result2);

    return String.valueOf(result);// 1 = 성공, 0 = 실패
  }

  // 마이페이지 포인트 내역
  @GetMapping("/list.myPoint")
  public String myOrder(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, String memberId, Model model, HttpSession session) {

    // 이메일 인증한 회원이 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || 1 != loginUser.getMailAuth()) {
      return "fo/common/emailAuthError";
    }

    // 나의 주문내역 수 조회
    int listCount = pointService.myPointListCount(memberId);

    int pageLimit = 5;
    int boardLimit = 20;

    PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    // 나의 포인트 내역 리스트 조회
    List<Point> pointList = pointService.selectMyPoint(pageInfo, memberId);

    model.addAttribute("pageInfo", pageInfo);
    model.addAttribute("pointList", pointList);

    return "fo/mypage/myPoint";
  }

}
