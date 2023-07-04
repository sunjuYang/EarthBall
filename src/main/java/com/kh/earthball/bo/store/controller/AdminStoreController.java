package com.kh.earthball.bo.store.controller;

import java.io.File;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.kh.earthball.bo.store.service.AdminStoreService;
import com.kh.earthball.bo.store.vo.AdminAtta;
import com.kh.earthball.bo.store.vo.AdminStore;
import com.kh.earthball.fo.common.template.ChangeFileName;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import com.kh.earthball.fo.member.vo.Member;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@Slf4j
public class AdminStoreController {

  private final AdminStoreService storeService;


  @GetMapping("adminlist.st")
  public ModelAndView adminStoreList(@RequestParam(value="cPage", defaultValue="1") int currentPage,
                                 ModelAndView mv, HttpSession session) {
    
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      mv.setViewName("redirect:/loginForm.me");
      return mv;
    }
    
    int listCount = storeService.selectListCount();
    int pageLimit = 10;
    int boardLimit = 10;

    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    ArrayList<AdminStore> list = storeService.adminAllStoreList(pi);

    mv.addObject("pi", pi).addObject("list", list).setViewName("bo/store/storeList");
    return mv;
  }

  @GetMapping("storeEnrollForm.st")
  public String storeEnrollForm(HttpSession session) {
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || 1 != loginUser.getMailAuth()) {
      session.setAttribute("alertMsg", "로그인시 이용가능합니다");
      return "redirect:/main";
    }
    return "bo/store/storeEnrollForm";
  }


  @RequestMapping("insert.st")
  public String insertStore(AdminStore s, String startAmPm, String endAmPm,  @RequestParam int  startHour, @RequestParam int  endHour, String startMin, String endMin, String address_detail,
      ArrayList<MultipartFile> upfiles, HttpSession session, ModelAndView mv) {
    
   ArrayList<AdminAtta> list = new ArrayList<AdminAtta>();
   
   for(int i = 0 ; i < upfiles.size(); i++) {
     MultipartFile file = upfiles.get(i);
     
     if(!file.isEmpty()) {
       String changerName = ChangeFileName.saveFile(file, session);
       
       AdminAtta at = new AdminAtta();
       at.setChangerName(changerName);
       at.setFileLevel(i);

       list.add(at);
     }
   }
   
   
   String regionAddress = s.getStoreAddress();
   String[] addressParts = regionAddress.split(" ");
   String city = addressParts[0];
   String provinces = addressParts[1];
   int regionNo = storeService.getRegionNo(city, provinces);
   s.setStoreRegionNo(regionNo);
    if (startAmPm.equals("pm")) {
      startHour += 12;
    }
    if (endAmPm.equals("pm")){
      endHour += 12;
    }
    String businessHours = startHour+ ":" + startMin + " - " + endHour + ":" + endMin;

   s.setBusinessHours(businessHours);
    
   
    int result = storeService.insertStore(s,list);

    if(result>0) {
      session.setAttribute("alertMsg", "매장신청 성공");
      return  "redirect:/main";
    }else {
      session.setAttribute("alertMsg", "매장신청 실패");
      return "redirect:/main";
    }
  }
  
  @GetMapping("adminSignUpList.st")
  public ModelAndView storeSignUpList(@RequestParam(value="cPage", defaultValue="1") int currentPage,
      HttpSession session, ModelAndView mv) {

    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null || !"admin".equals(loginUser.getMemberId())) {
      mv.setViewName("redirect:/loginForm.me");
      return mv;
    }
      
      int listCount = storeService.selectSignUpListCount();
      int pageLimit = 10;
      int boardLimit = 10;
      
      PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
      
      ArrayList<AdminStore> list = storeService.selectSignUpList(pi);
      
      mv.addObject("pi", pi).addObject("list", list).setViewName("bo/store/storeSignUpList");
      return mv;
      }
  @GetMapping("detailStore.st")
  public String storeUpdateForm(int storeNo, Model model) {
   
    AdminStore beforeData = storeService.selectStore(storeNo);
    ArrayList<AdminAtta> beforeAttaList = storeService.selectAtta(storeNo);
    
    
    model.addAttribute("beforeData", beforeData);
    model.addAttribute("beforeAtta", beforeAttaList);
    return "bo/store/storeDetailView";
  }

  @PostMapping("updateStore.st")
  public String updateStore(AdminStore s, String startAmPm, String endAmPm,  @RequestParam int  startHour, @RequestParam int  endHour, String startMin, String endMin, String address_detail,
                            MultipartFile[] upfiles, 
                            String[] changeNames,
                            HttpSession session,
                            ModelAndView mv) {
    ArrayList<AdminAtta> list = new ArrayList<>();
    
    for(int i=0; i < 10; i ++) {
      AdminAtta at = new AdminAtta();
      
      if(!upfiles[i].isEmpty()){

        String realPath = session.getServletContext().getRealPath("resources/fo/upfiles/" + changeNames[i]);

        new File(realPath).delete();

        String changeName = ChangeFileName.saveFile(upfiles[i], session);

        at.setChangerName(changeName);
        at.setFileLevel(i);
        at.setStoreNo(s.getStoreNo());

      }else{

        at.setChangerName(changeNames[i]);
        at.setFileLevel(i);
        at.setStoreNo(s.getStoreNo());
      }

      list.add(at);
    }
    
    int storeNo = s.getStoreNo();
    String regionAddress = s.getStoreAddress();
    String[] addressParts = regionAddress.split(" ");
    String city = addressParts[0];
    String provinces = addressParts[1];
    int regionNo = storeService.getRegionNo(city, provinces);
    
    s.setStoreRegionNo(regionNo);
    
    if (startAmPm.equals("pm")) {
      startHour += 12;
    }
    if (endAmPm.equals("pm")){
      endHour += 12;
    }
    String businessHours = startHour+ ":" + startMin + " - " + endHour + ":" + endMin;
    
   s.setBusinessHours(businessHours);
    
    int result = storeService.updateStore(s,list);

    if(result>0) {
      session.setAttribute("alertMsg", "매장수정 성공");
      return "redirect:/adminlist.st";
    }else {
      session.setAttribute("alertMsg", "매장수정 실패");
      return "redirect:/adminlist.st";
    }
  }
  @GetMapping("deleteStore.st")
  public String deleteStore(@RequestParam("storeNo") int storeNo, HttpSession session) {
    System.out.println(storeNo);
    int result = storeService.deleteService(storeNo);
    if(result>0) {
      session.setAttribute("alertMsg", "매장삭제 성공");
      return  "redirect:/adminlist.st";
    }else {
      session.setAttribute("alertMsg", "매장삭제 실패");
      return "redirect:/adminlist.st";
    }
  }
  
  @GetMapping("approvalStore.st")
  public String approvalStore(int storeNo, HttpSession session) {
    
    int result = storeService.approvalStore(storeNo);
    if(result>0) {
      session.setAttribute("alertMsg", "매장승인 성공");
    }else {
      session.setAttribute("alertMsg", "매장승인 실패");
    }
    
    return "redirect:adminSignUpList.st";
  }
}