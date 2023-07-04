package com.kh.earthball.fo.challenge.controller;

import com.kh.earthball.bo.challenge.service.CategoryService;
import com.kh.earthball.bo.challenge.service.CategoryTemplateService;
import com.kh.earthball.bo.challenge.service.CodeService;
import com.kh.earthball.bo.challenge.vo.Category;
import com.kh.earthball.bo.challenge.vo.Code;
import com.kh.earthball.fo.challenge.service.ChallengeService;
import com.kh.earthball.fo.challenge.service.ConfirmService;
import com.kh.earthball.fo.challenge.vo.Challenge;
import com.kh.earthball.fo.challenge.vo.ConfirmCount;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.member.vo.Member;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ChallengeController {

  private final CategoryService categoryService;
  private final ChallengeService challengeService;

  @GetMapping("/main.chall")
  public String challengeMain(
      @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Challenge challenge,
      Model model) {

    // 전체 챌린지 게시글 수 조회
    int listCount = challengeService.selectListCount();

    int pageLimit = 5;
    int boardLimit = 12;

    PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    ArrayList<Challenge> challengeList = challengeService.selectList(pageInfo, challenge);

    List<Category> categoryList = categoryService.selectCategoryList();

    model.addAttribute("pageInfo", pageInfo);
    model.addAttribute("challengeList", challengeList);
    model.addAttribute("categoryList", categoryList);

    return "fo/challenge/challengeMain";
  }


  @GetMapping("/categoryList.chall")
  public String categoryChoice_chall(Model model, HttpSession session) {

    // 이메일 인증한 회원이 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || 1 != loginUser.getMailAuth()) {
      return "fo/common/emailAuthError";
    }

    List<Category> categoryList = categoryService.selectCategoryList();

    for (Category category : categoryList) {
      // 카테고리 이름
      String categoryName = category.getCategoryName();

      // 카테고리 이름에 해당하는 코드네임들 가져오기
      List<Code> codeList = categoryService.selectCodeList(categoryName);
      category.setCodeList(codeList);
    }

    model.addAttribute("categoryList", categoryList);
    return "fo/challenge/challenge/challengeCategoryChoice";
  }


  @GetMapping("/openForm.chall")
  public String openChallengeForm(@RequestParam(value = "categoryNo") int categoryNo, Model model,
      HttpSession session) {

    // 이메일 인증한 회원이 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || 1 != loginUser.getMailAuth()) {
      return "fo/common/emailAuthError";
    }

    Category category = categoryService.selectCategory(categoryNo);

    model.addAttribute("category", category);

    return "fo/challenge/challenge/challengeInsertForm";
  }

  @ResponseBody
  @PostMapping("/openRequest.chall")
  public int requestChallenge(@RequestBody Challenge challenge) {

    int result = challengeService.requestChallenge(challenge);

    return result;
  }

  @GetMapping("confirmForm.chall")
  public String confirmInsertForm(HttpSession session) {

    // 이메일 인증한 회원이 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || 1 != loginUser.getMailAuth()) {
      return "fo/common/emailAuthError";
    }

    return "fo/challenge/confirm/confirmInsertForm";
  }


  @GetMapping("/detailView.chall")
  public String challengeDetailView(int chNo, Model model) {

    // 챌린지 게시글 하나 조회
    Challenge challenge = challengeService.selectChallenge(chNo);

    model.addAttribute("challenge", challenge);

    return "fo/challenge/challenge/challengeDetailView";
  }

  @GetMapping("/updateForm.chall")
  public String challengeUpdateForm(int chNo, Model model, HttpSession session) {

    // 이메일 인증한 회원이 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || 1 != loginUser.getMailAuth()) {
      return "fo/common/emailAuthError";
    }

    // 수정할 챌린지 조회 해오기
    Challenge challenge = challengeService.selectChallenge(chNo);

    model.addAttribute("challenge", challenge);

    return "fo/challenge/challenge/challengeUpdateForm";
  }

  @ResponseBody
  @PostMapping("/update.chall")
  public int challengeUpdate(@RequestBody Challenge challenge) {
    return challengeService.challengeUpdate(challenge);
  }

  @ResponseBody
  @GetMapping("delete.chall")
  public int challengeDelete(int chNo) {
    return challengeService.challengeDelete(chNo);
  }

  @GetMapping("/categoryFilter.chall")
  public String challengeCategory(
      @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model,
      int categoryNo) {

    // 카테고리별 챌린지 게시글 수 조회
    int listCount = challengeService.selectCategoryListCount(categoryNo);

    int pageLimit = 5;
    int boardLimit = 12;

    PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    ArrayList<Challenge> challengeList = challengeService.selectCategoryList(pageInfo, categoryNo);

    List<Category> categoryList = categoryService.selectCategoryList();

    model.addAttribute("pageInfo", pageInfo);
    model.addAttribute("challengeList", challengeList);
    model.addAttribute("categoryList", categoryList);

    return "fo/challenge/challengeMain";
  }

  @GetMapping("/statFilter.chall")
  public String challengeStat(
      @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model,
      String chStatName) {
    // 진행상태별 챌린지 게시글 수 조회
    int listCount = challengeService.selectStatListCount(chStatName);

    int pageLimit = 5;
    int boardLimit = 12;

    PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    ArrayList<Challenge> challengeList = challengeService.selectStatList(pageInfo, chStatName);

    List<Category> categoryList = categoryService.selectCategoryList();

    model.addAttribute("pageInfo", pageInfo);
    model.addAttribute("challengeList", challengeList);
    model.addAttribute("categoryList", categoryList);

    return "fo/challenge/challengeMain";
  }

  @ResponseBody
  @GetMapping("/hotList.chall")
  public List<Challenge> topChallengeList() {

    // 챌린지 게시글 별 인증게시글 갯수 조회
    List<ConfirmCount> confirmCountList = challengeService.confirmCount();

    List<Challenge> hotList = new ArrayList<>();
    // 1순위 부터 챌린지 번호 당 챌린지 정보 담은 리스트 조회
    for (ConfirmCount confirmCount : confirmCountList) {
      int chNo = confirmCount.getChNo();

      Challenge hotChallenge = challengeService.selectHotChallenge(chNo);
      if (hotChallenge != null) {
        hotList.add(hotChallenge);
      }
    }
    return hotList;
  }



  // 마이페이지 오픈한 챌린지
  @GetMapping("/list.myChallenge")
  public String myChallenge(
      @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, String memberId,
      Model model) {

    // 나의 챌린지 게시글 수 조회
    int listCount = challengeService.myChallengeListCount(memberId);

    int pageLimit = 5;
    int boardLimit = 12;

    PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    // 나의 챌린지 게시글 리스트 조회
    List<Challenge> challengeList = challengeService.selectMyChallenge(pageInfo, memberId);

    model.addAttribute("pageInfo", pageInfo);
    model.addAttribute("challengeList", challengeList);

    return "fo/mypage/myChallenge";
  }
}


