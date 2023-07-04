package com.kh.earthball.bo.challenge.controller;

import com.kh.earthball.bo.challenge.service.BoChallengeService;
import com.kh.earthball.bo.challenge.service.BoConfirmService;
import com.kh.earthball.bo.challenge.service.CategoryTemplateService;
import com.kh.earthball.bo.challenge.vo.BoChallenge;
import com.kh.earthball.bo.challenge.vo.BoConfirm;
import com.kh.earthball.bo.challenge.vo.BoDetailInfo;
import com.kh.earthball.bo.challenge.vo.CategoryTemplate;
import com.kh.earthball.fo.challenge.service.ConfirmService;
import com.kh.earthball.fo.challenge.vo.ChConfirm;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.member.vo.Member;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequiredArgsConstructor
@Controller
@Slf4j
public class BoConfirmController {

  private final BoConfirmService boConfirmService;
  private final BoChallengeService boChallengeService;
  private final CategoryTemplateService templateService;
  private final ConfirmService confirmService;

  @GetMapping("/list.conf")
  public String confirmList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model, HttpSession session) {

    // 관리자가 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      return "redirect:/loginForm.me";
    }

    // 모든 챌린지 게시글 수 조회
    int listCount = boConfirmService.ConfirmListCount();

    int pageLimit = 10;
    int boardLimit = 10;

    PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    // 모든 챌린지 게시글 리스트 조회
    List<BoConfirm> confirmList = boConfirmService.selectConfirmList(pageInfo);

    model.addAttribute("pageInfo", pageInfo);
    model.addAttribute("confirmList", confirmList);

    return "bo/challenge/challengeEdit/confirmListView";
  }

  @GetMapping("/detail.conf")
  public String confirmDetailView(int chConNo, Model model, HttpSession session) {

    // 관리자가 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      return "redirect:/loginForm.me";
    }

    // 해당하는 챌린지 인증 게시글 조회 해오기
    ChConfirm confirm  = confirmService.selectConfirm(chConNo);

    model.addAttribute("confirm", confirm);
    // 해당하는 챌린지 조회
    model.addAttribute("challenge", boChallengeService.selectChallenge(confirm.getChNo()));
    // 해당 챌린지의 인증 폼 가져오기
    model.addAttribute("templateList",  templateService.selectTemplateList(confirm));

    return "bo/challenge/challengeEdit/confirmDetailView";
  }

  @ResponseBody
  @PostMapping("/deleteBo.conf")
  public int confirmDelete(@RequestBody BoConfirm boConfirm) {

    boConfirmService.deleteConfirm(boConfirm);

    return 1;
  }

  @GetMapping("/search.conf")
  public String searchConfirm(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, @RequestParam("keyword") String keyword, Model model) {

    // 키워드가 속한 인증 게시글 수 조회
    int listCount = boConfirmService.searchConfirmListCount(keyword);

    int pageLimit = 10;
    int boardLimit = 10;

    PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    // 키워드가 속한 인증 리스트 조회
    List<BoConfirm> confirmList = boConfirmService.searchConfirm(pageInfo, keyword);

    // 키워드가 속한 인증 디테일정보 조회
    List<BoConfirm> detailInfoList = boConfirmService.searchDetail(pageInfo, keyword);

    for(BoConfirm boConfirm : detailInfoList) {

      confirmList.add(boConfirm);
    }


    model.addAttribute("confirmList", confirmList);

    return "bo/challenge/challengeEdit/confirmListView";
  }
}
