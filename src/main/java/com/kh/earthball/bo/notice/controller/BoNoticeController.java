package com.kh.earthball.bo.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earthball.bo.notice.service.BoNoticeService;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.notice.vo.Notice;

@Controller
public class BoNoticeController {

	@Autowired
	  private BoNoticeService BonoticeService;

	 @RequestMapping("bolist.no")
	  public ModelAndView boselectNoList(
	      @RequestParam(value = "cPage", defaultValue = "1") int currentPage,
	      ModelAndView mv) {

	    int listCount = BonoticeService.boselectListNoCount();

	    int pageLimit = 10;
	    int boardLimit = 10;

	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

	    ArrayList<Notice> list = BonoticeService.boselectNoList(pi);

	    mv.addObject("pi", pi)
	        .addObject("list", list)
	        .setViewName("bo/board/noticeListView");

	    return mv;
	  }
}