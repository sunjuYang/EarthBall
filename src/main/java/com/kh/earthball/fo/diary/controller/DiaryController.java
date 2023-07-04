package com.kh.earthball.fo.diary.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.kh.earthball.fo.member.vo.Member;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.kh.earthball.fo.challenge.vo.Challenge;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.diary.service.DiaryService;
import com.kh.earthball.fo.diary.vo.Diary;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@RequiredArgsConstructor
@Slf4j
@Controller
public class DiaryController {


  private final DiaryService diaryService;

  @RequestMapping("diaryListView.bo")
  public String selectList(@RequestParam(value = "cPage", defaultValue = "1") int currentPage,
                                   Model model) {


    // 페이징 처리를 위한 PageInfo 객체 얻어내기
     int listCount = diaryService.selectListCount();

      int pageLimit = 5;
      int boardLimit = 6;

      // Pagination 에 작성한 getPageInfo 메소드 호출
      PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);


      // 목록을 조회하는 요청
      ArrayList<Diary> list = diaryService.selectList(pi);


      // 응답데이터를 model 에 담기
      model.addAttribute("pi", pi);
      model.addAttribute("list", list);

      // 포워딩
      return "fo/diary/diaryListView";
  }

  @RequestMapping("diaryEnrollForm.bo")
  public String diaryEnrollForm(HttpSession session) {

 // 이메일 인증한 회원이 아니라면 접근 불가하도록 설정
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || 1 != loginUser.getMailAuth()) {

      return "fo/common/emailAuthError";
    }

    return "fo/diary/diaryEnrollForm";
  }

  @ResponseBody
  @RequestMapping(value="/diaryInsert.bo", produces="text/html; charset=UTF-8")
  public String insertDiary(String weather, @ModelAttribute Diary diary, HttpSession session, @RequestParam(value="file", required=true) MultipartFile file) {

      String title = diary.getDyBoardTitle();
      String content = diary.getDyBoardContent();

      if(!file.getOriginalFilename().isEmpty() && !title.isEmpty() && !content.isEmpty()) {

        if (file.getSize() < 20000) {
          return "그림을 (더) 그려주세요";
      }

        String changeName = saveFile(file, session);
        diary.setOriginName(file.getOriginalFilename());
        diary.setChangeName("resources/fo/upfiles/" + changeName);

        int result = diaryService.insertDiary(diary);

        if(result > 0) {
            return "게시글 등록 완료";
        } else {
            return "게시글 등록 실패";
        }
    }

    // 필요한 데이터가 누락된 경우
    return "누락된 정보가 있습니다";
}

  private String saveFile(MultipartFile file, HttpSession session) {

      String originName = file.getOriginalFilename();
      String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());


      int ranNum = (int)(Math.random() * 90000 + 10000);

      String ext = originName.substring(originName.lastIndexOf("."));

      String changeName = currentTime + ranNum + ext;

      String savePath = session.getServletContext().getRealPath("/resources/fo/upfiles/");

      try {
            file.transferTo(new File(savePath + changeName));
      } catch (IOException e) {
            e.printStackTrace();
      }

      return changeName;
    }

  @RequestMapping("diaryDetailView.bo")
  public ModelAndView selectDiary(ModelAndView mv,
                                                    int bno) {

          int result = diaryService.increaseCount(bno);

          if(result > 0) {

                Diary d = diaryService.selectDiary(bno);


                mv.addObject("d", d) .setViewName("fo/diary/diaryDetailView");

          } else {

            mv.addObject("errorMsg", "게시글 상세조회 실패") .setViewName("common/errorPage");
          }

          return mv;
  }

    @RequestMapping("dyDelete.bo")
    public String deleteDiary(int dyBoardNo,
                                         Model model,
                                         String filePath,
                                         HttpSession session) {

       int result = diaryService.deleteDiary(dyBoardNo);

       if(result > 0) {

         if(!filePath.equals("")) {

               String realPath = session.getServletContext().getRealPath(filePath);
               new File(realPath).delete();
         }
           session.setAttribute("alertMsg", "게시글 삭제 성공");

           return "redirect:/diaryListView.bo";
       } else {

             model.addAttribute("errorMsg", "게시글 삭제 실패");

             return "common/errorPage";
       }

    }

    @RequestMapping("dyUpdateForm.bo")
    public String updateForm(int dyBoardNo,
                                        Model model ) {

      // System.out.println(dyBoardNo);

      // 게시글 상세보기용 selectDiary 요청 재활용
      Diary d = diaryService.selectDiary(dyBoardNo);

      model.addAttribute("d", d);

      return "fo/diary/diaryUpdateForm";
    }

    // 일기 수정하기
    @ResponseBody
    @RequestMapping(value="/dyUpdate.bo", produces="text/html; charset=UTF-8")
    public String updateDiary (String weather, @ModelAttribute Diary diary, HttpSession session, @RequestParam(value="file", required=true) MultipartFile file) {

        String title = diary.getDyBoardTitle();
        String content = diary.getDyBoardContent();

        if(!file.getOriginalFilename().isEmpty() && !title.isEmpty() && !content.isEmpty()) {

          if (file.getSize() < 15000) {
            return "그림을 (더) 그려주세요";
        }

          if(!file.getOriginalFilename().equals("")) {

               // 1. 기존에 첨부파일이 있었을 경우 => 기존의 첨부파일을 찾아서 삭제
            String realPath = session.getServletContext().getRealPath(diary.getChangeName());

            new File(realPath).delete();
          }

          String changeName = saveFile(file, session);
          diary.setOriginName(file.getOriginalFilename());
          diary.setChangeName("resources/fo/upfiles/" + changeName);

          int result = diaryService.updateDiary(diary);

          if(result > 0) {
              return "게시글 등록 완료";
          } else {
              return "게시글 등록 실패";
          }
      }

      // 필요한 데이터가 누락된 경우
      return "누락된 정보가 있습니다";
  }

    // 마이페이지 내가 참여한 일기 보여주기
    @RequestMapping("diaryList.me")
    public String diaryListMe(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, String memberId, Model model) {

      int listCount = diaryService.diaryListMeCount(memberId);

      int pageLimit = 5;
      int boardLimit = 6;

      PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

      ArrayList<Diary> list = diaryService.diaryListMe(pi, memberId);

      model.addAttribute("pi", pi);
      model.addAttribute("list", list);

      return "fo/mypage/diary";
    }

    @RequestMapping("/diaryStory.bo")
    public String diaryStory() {

      return "fo/diary/diaryStory";
    }


}



