package com.kh.earthball.fo.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.notice.service.NoticeService;
import com.kh.earthball.fo.notice.vo.Notice;

@Controller
public class NoticeController {

  @Autowired
  private NoticeService noticeService;

  @RequestMapping("list.no")
  public ModelAndView selectNoList(
      @RequestParam(value = "cPage", defaultValue = "1") int currentPage,
      ModelAndView mv) {

    int listCount = noticeService.selectListNoCount();

    int pageLimit = 10;
    int boardLimit = 10;

    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    ArrayList<Notice> list = noticeService.selectNoList(pi);

    mv.addObject("pi", pi)
        .addObject("list", list)
        .setViewName("fo/notice/noticeListView");

    return mv;
  }

  @RequestMapping("enrollForm.no")
  public String enrollForm() {
   return  "fo/notice/noticeEnrollForm";
  }

  @RequestMapping(value = "/insert.no", method = RequestMethod.POST)
  public String insertNotice(@ModelAttribute Notice b, HttpSession session, Model model) {

      int result = noticeService.insertNotice(b);

      if(result > 0) {

        return "redirect:/list.no";
    } else {
        // Error handling or return an error page
        return "redirect:/error";
    }
  }

  @RequestMapping("delete.no")
  public String deleteNotice(int bno, Model model, HttpSession session) {

    int result = noticeService.deleteNotice(bno);

    if (result > 0) {

      session.setAttribute("alertMsg", "게시글 삭제 성공");

      return "redirect:/list.no";
    } else {

      return "redirect:/error";
    }

  }

  @RequestMapping("updateForm.no")
  public ModelAndView updateForm( ModelAndView mv,int bno) {

    Notice b = noticeService.selectNotice(bno);

    mv.addObject("b",b);
    mv.setViewName("fo/notice/noticeUpdateForm");

    return mv;
  }

  @RequestMapping("update.no")
  public String updateNotice(Notice b, HttpSession session) {
      int result = noticeService.updateNotice(b);
      if (result > 0) {
        session.setAttribute("alertMsg", "게시글 성공!");
        return "redirect:/list.no";
    } else {
        return "redirect:/error";
    }
}

  @RequestMapping("detail.no")
  public ModelAndView selectNotice(ModelAndView mv, int bno) {

    int result = noticeService.increaseCount(bno);
    Notice b = noticeService.selectNotice(bno);

    if(result > 0) {

      mv.addObject("b", b);
      mv.setViewName("fo/notice/noticeDetailView");
    } else {
      mv.addObject("errorMsg", "게시글 상세조회 실패");
    }

    return mv;
  }

}
