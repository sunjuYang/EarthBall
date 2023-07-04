package com.kh.earthball.bo.challenge.controller;

import com.kh.earthball.bo.challenge.service.CodeService;
import com.kh.earthball.bo.challenge.vo.Code;
import com.kh.earthball.bo.challenge.vo.GrpCode;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class CodeController {

  private final CodeService codeService;

  @GetMapping("grpCodeForm")
  public String insertGrpForm(HttpSession session) {

    // 관리자가 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      return "redirect:/loginForm.me";
    }

    return "bo/challenge/code/grpCodeEnrollForm";
  }

  @ResponseBody
  @PostMapping("insert.grp")
  public int insertGrp(GrpCode grpCode) {
    return codeService.insertGrp(grpCode);
  }

  @GetMapping("list.grp")
  public String grpList(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, HttpSession session) {

    // 관리자가 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      return "redirect:/loginForm.me";
    }

    int listCount = codeService.selectListCount();
    int pageLimit = 10;
    int boardLimit = 10;

    int maxPage = (int) Math.ceil((double) listCount / boardLimit);
    int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
    int endPage = startPage + pageLimit - 1;

    if (endPage > maxPage) {
      endPage = maxPage;
    }

    PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

    List<GrpCode> grpCodeList = codeService.selectList(pi);

    model.addAttribute("pi", pi);
    model.addAttribute("grpCodeList", grpCodeList);

    return "bo/challenge/code/grpCodeListView";
  }

  @GetMapping("updateForm.grp")
  public String updateGrpForm(@RequestParam(value = "grpCode") String grpCode, Model model, HttpSession session) {

    // 관리자가 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      return "redirect:/loginForm.me";
    }

    GrpCode grpCodeInfo = codeService.selectGrp(grpCode);

    model.addAttribute("grpCode", grpCodeInfo);

    return "bo/challenge/code/grpCodeUpdateForm";
  }

  @ResponseBody
  @PostMapping("update.grp")
  public int updateGrp(GrpCode grpCode) {
    return codeService.updateGrp(grpCode);
  }


  @ResponseBody
  @PostMapping("deleteForm.grp")
  public int deleteGrp(@RequestParam(value = "grpCode") String grpCode) {
    return codeService.deleteGrp(grpCode);
  }

  @GetMapping("codeEnrollForm")
  public String codeEnrollForm(String grpCode, Model model, HttpSession session) {

    // 관리자가 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      return "redirect:/loginForm.me";
    }

    GrpCode grp = codeService.selectGrp(grpCode);

    model.addAttribute("grp", grp);

    return "bo/challenge/code/codeEnrollForm";
  }

  @ResponseBody
  @PostMapping("insert.code")
  public int insertCode(Code code) {
    return codeService.insertCode(code);
  }

  @GetMapping("list.code")
  public String selectListCode(Model model, @RequestParam(value = "grpCode") String grpCode, HttpSession session) {

    // 관리자가 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      return "redirect:/loginForm.me";
    }

    List<Code> codeList = codeService.selectCodeList(grpCode);

    model.addAttribute("codeList", codeList);

    return "bo/challenge/code/codeListView";
  }

  @GetMapping("updateForm.code")
  public String codeUpdateForm(@RequestParam(value = "grpCode") String grpCode, @RequestParam(value = "code") String code, Model model, HttpSession session) {

    // 관리자가 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      return "redirect:/loginForm.me";
    }

    // 코드 정보 조회해와야지
    Code selectCode = codeService.selectCode(grpCode, code);
    GrpCode selectGrp = codeService.selectGrp(grpCode);

    model.addAttribute("code", selectCode);
    model.addAttribute("grp", selectGrp);

    return "bo/challenge/code/codeUpdateForm";
  }

  @ResponseBody
  @PostMapping("update.code")
  public int updateCode(Code code) {
    return codeService.updateCode(code);
  }


  @ResponseBody
  @PostMapping("delete.code")
  public int deleteCode(@RequestParam(value = "grpCode") String grpCode, @RequestParam(value = "code") String code) {
    return codeService.deleteCode(grpCode, code);
  }

}
