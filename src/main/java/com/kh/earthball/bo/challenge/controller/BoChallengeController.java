package com.kh.earthball.bo.challenge.controller;

import com.kh.earthball.bo.challenge.service.BoChallengeService;
import com.kh.earthball.bo.challenge.vo.BoChallenge;
import com.kh.earthball.fo.challenge.vo.Challenge;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.member.vo.Member;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequiredArgsConstructor
@Controller
@Slf4j
public class BoChallengeController {

  private final BoChallengeService boChallengeService;

  @GetMapping("/list.chall")
  public String challengeList(
      @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model,
      HttpSession session) {

    // 관리자가 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      return "redirect:/loginForm.me";
    }

    // 모든 챌린지 게시글 수 조회
    int listCount = boChallengeService.ChallengeListCount();

    int pageLimit = 10;
    int boardLimit = 10;

    PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    // 모든 챌린지 게시글 리스트 조회
    List<BoChallenge> boChallengeList = boChallengeService.selectChallengeList(pageInfo);

    model.addAttribute("pageInfo", pageInfo);
    model.addAttribute("boChallengeList", boChallengeList);

    return "bo/challenge/challengeEdit/challengeListView";
  }


  @GetMapping("/detail.chall")
  public String challengeDetailView(int chNo, Model model, HttpSession session) {

    // 관리자가 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      return "redirect:/loginForm.me";
    }

    BoChallenge challenge = boChallengeService.selectChallenge(chNo);

    model.addAttribute("challenge", challenge);

    return "bo/challenge/challengeEdit/challengeDetailView";
  }

  @ResponseBody
  @PostMapping("/deleteBo.chall")
  public int challengeDelete(int chNo) {

    return boChallengeService.deleteChallenge(chNo);
  }


  @GetMapping("/search.chall")
  public String searchChallenge(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, @RequestParam("keyword") String keyword, Model model) {

    // 키워드가 속한 챌린지 게시글 수 조회
    int listCount = boChallengeService.searchChallengeListCount(keyword);

    int pageLimit = 10;
    int boardLimit = 10;

    PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    // 키워드가 속한 챌린지 리스트 조회
    List<BoChallenge> boChallengeList = boChallengeService.searchChallenge(pageInfo, keyword);

    model.addAttribute("boChallengeList", boChallengeList);

    return "bo/challenge/challengeEdit/challengeListView";

  }

}
