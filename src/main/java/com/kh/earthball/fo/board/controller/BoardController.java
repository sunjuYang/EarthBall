package com.kh.earthball.fo.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.earthball.fo.board.service.BoardService;
import com.kh.earthball.fo.board.vo.Board;
import com.kh.earthball.fo.board.vo.QReply;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;


@Controller
public class BoardController {

  @Autowired
  private BoardService boardService;

  @RequestMapping("list.bo")
  public ModelAndView selectList(
      @RequestParam(value = "cPage", defaultValue = "1") int currentPage,
      ModelAndView mv) {

    int listCount = boardService.selectListCount();

    int pageLimit = 10;
    int boardLimit = 5;

    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    ArrayList<Board> list = boardService.selectList(pi);

    mv.addObject("pi", pi)
        .addObject("list", list)
        .setViewName("fo/board/boardListView");

    return mv;
  }

  @RequestMapping("enrollForm.bo")
  public String enrollForm() {
   return  "fo/board/boardEnrollForm";
  }

  @RequestMapping(value = "/insert.bo", method = RequestMethod.POST)
  public String insertBoard(@ModelAttribute Board b, MultipartFile upfile, HttpSession session, Model model) {

	  if (upfile != null && !upfile.isEmpty()){
	        String changeName = saveFile(upfile, session);
	        b.setOriginName(upfile.getOriginalFilename());
	        b.setChangeName("/resources/fo/upfiles/" + changeName);
	    }

      int result = boardService.insertBoard(b);

      if(result > 0) {

        return "redirect:/list.bo";
    } else {
        // Error handling or return an error page
        return "redirect:/error";
    }
  }

  @RequestMapping("delete.bo")
  public String deleteBoard(int bno, Model model, HttpSession session) {

    int result = boardService.deleteBoard(bno);

    if (result > 0) {

      session.setAttribute("alertMsg", "게시글 삭제 성공");

      return "redirect:/list.bo";
    } else {

      return "redirect:/error";
    }

  }

  @RequestMapping("updateForm.bo")
  public ModelAndView updateForm( ModelAndView mv,int bno) {

    Board b = boardService.selectBoard(bno);

    mv.addObject("b",b);
    mv.setViewName("fo/board/boardUpdateForm");

    return mv;
  }

  @RequestMapping("update.bo")
  public String updateBoard(Board b, HttpSession session) {
      int result = boardService.updateBoard(b);
      if (result > 0) {
        session.setAttribute("alertMsg", "게시글 성공!");
        return "redirect:/list.bo";
    } else {
        return "redirect:/error";
    }
}

  @RequestMapping("detail.bo")
  public ModelAndView selectBoard(ModelAndView mv, int bno) {

    Board b = boardService.selectBoard(bno);
    if (b != null) {
      // 이전글과 다음글의 존재 여부 확인
      Board hasPrev = boardService.selectPrevBoard(bno);
      Board hasNext = boardService.selectNextBoard(bno);

      mv.addObject("b", b);
      mv.addObject("hasPrev", hasPrev);
      mv.addObject("hasNext", hasNext);
      mv.setViewName("fo/board/boardDetailView");
    } else {
      mv.addObject("errorMsg", "게시글 상세조회 실패");
    }

    return mv;
  }

  @GetMapping("list.mybo")
  public String myBoard(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, String memberId, Model model) {

    // 게시글 조회
    int listCount = boardService.myBoardListCount(memberId);

    int pageLimit = 5;
    int boardLimit = 12;

    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    // 내 게시글 리스트 조회
    ArrayList<Board> mylist = boardService.selectMyBoard(pi, memberId);

    model.addAttribute("pi", pi);
    model.addAttribute("mylist", mylist);

    return "fo/mypage/board";
  }

	@ResponseBody
	@RequestMapping(value = "rlist.bo", produces = "application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int bno) {
		ArrayList<QReply> list = boardService.selectReplyList(bno);
		return new Gson().toJson(list);
	}

	@ResponseBody
	@RequestMapping(value = "rinsert.bo", produces = "text/html; charset=UTF-8")
	public String ajaxInsertReply(QReply r) {
		int result = boardService.insertReply(r);
		return (result > 0) ? "success" : "fail";
	}

	@ResponseBody
	@RequestMapping(value = "rdelete.bo", produces = "text/html; charset=UTF-8")
	public String ajaxDeleteReply(int bno) {
		int result = boardService.deleteReply(bno);
		return (result > 0) ? "success" : "fail";
	}

	  @RequestMapping("list.faq")
	  public ModelAndView selectfaq(ModelAndView mv) {

	    mv.setViewName("fo/board/faq");

	    return mv;

	  }

	  @RequestMapping(value = "/uploadSummernoteImageFile", method = RequestMethod.POST)
	  public String saveFile(MultipartFile upfile, HttpSession session) {


			String originName = upfile.getOriginalFilename(); // "bono.jpg"

			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss")
									 .format(new Date()); // "20230511104920"

			int ranNum = (int)(Math.random() * 90000 + 10000); // 13152

			String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"

			String changeName = currentTime + ranNum + ext;

			String savePath = session.getServletContext().getRealPath("/resources/fo/upfiles/");


			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IOException e) {
				e.printStackTrace();
			}

			return changeName;
		}




}
