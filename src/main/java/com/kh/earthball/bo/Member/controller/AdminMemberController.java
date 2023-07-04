package com.kh.earthball.bo.Member.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.kh.earthball.bo.Member.service.MemberAdminService;
import com.kh.earthball.bo.Member.vo.AdminMember;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

    @RequiredArgsConstructor
    @Controller
    @Slf4j
    public class AdminMemberController {

      public final MemberAdminService memberAdminService;
      
        // 관리자만 접근 가능하게 관리자가 아니면 로그인창으로 이동
        @GetMapping("/list.mem")
        public String adminMemberList(
            @RequestParam(value="currentPage", defaultValue="1")int currentPage, Model model,
             HttpSession session) {

          AdminMember loginUser = (AdminMember) session.getAttribute("loginUser");
          if(loginUser == null || !"admin".equals(loginUser.getMemberId())) {
            return "redirect:/loginForm.me";
          }

         int listCount = memberAdminService.AdminMemberListCount();

         int pageLimit = 10;
         int boardLimit = 10;

         PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

         List<AdminMember>memberList = memberAdminService.selectAdminMemberList(pageInfo);
           model.addAttribute("pageInfo", pageInfo);
           model.addAttribute("memberList", memberList);

           return "bo/member/adminMemberList";
        }

        @RequestMapping(value = "/member.me", method = RequestMethod.POST)
        public String memberSearch(@RequestParam("keyword") String keyword, Model model) {
          List<AdminMember> memberList = memberAdminService.searchAdminMember(keyword);
          model.addAttribute("memberList", memberList);
          return "bo/member/adminMemberList";
        }
        
        @ResponseBody
        @PostMapping(value="adminMemberStatusUpdate.me", produces="application/json; charset=UTF-8")
        public String updateStatus(String memberId, String status, Model model) {

          int result = memberAdminService.updateMemberStatus(memberId, status);

          return new Gson().toJson(result);
        }
          
        }

