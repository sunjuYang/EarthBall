package com.kh.earthball.fo.member.controller;

import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kh.earthball.fo.member.service.LikeService;
import com.kh.earthball.fo.member.vo.Like;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class LikeController {

  private final LikeService likeService;

  @GetMapping("list.like")
  public String selectList(String memberId, Model model) {

    ArrayList<Like> list = likeService.selectList(memberId);

    model.addAttribute("list", list);
    return "fo/mypage/like";
  }

  @ResponseBody
  @GetMapping("insert.like")
  public String ajaxInsertLike(int productNo, String memberId) {

    int result = likeService.insertLike(productNo, memberId);

    return (result>0) ? "success" : "fail";
  }

  @ResponseBody
  @GetMapping("delete.like")
  public String ajaxDeleteLike(int productNo, String memberId) {

    int result = likeService.deleteLike(productNo, memberId);

    return (result>0) ? "success" : "fail";
  }

}
