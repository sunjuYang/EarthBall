package com.kh.earthball.fo.common.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kh.earthball.fo.challenge.service.ChallengeService;
import com.kh.earthball.fo.challenge.vo.Challenge;
import com.kh.earthball.fo.diary.service.DiaryService;
import com.kh.earthball.fo.diary.vo.Diary;
import com.kh.earthball.fo.member.service.LikeService;
import com.kh.earthball.fo.product.service.ProductService;
import com.kh.earthball.fo.product.service.ReviewService;
import com.kh.earthball.fo.product.vo.Product;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class commonController {

  private final ChallengeService challengeService;
  private final DiaryService diaryService;
  private final ProductService productService;
  private final ReviewService reviewService;
  private final LikeService likeService;

  @RequestMapping("/main")
  public String home(Model model) {
    // 챌린지 최근 3건 조회
    List<Challenge> challengeList = challengeService.mainChallengeList();

    ArrayList<Product> productList = productService.selectTopList();

    for(Product p : productList){

      int productNo = p.getProductNo();
      int likeCount = likeService.selectLikeCount(productNo);
      int reviewCount = reviewService.selectReviewCount(productNo);

      p.setLikeCount(likeCount);
      p.setReviewCount(reviewCount);

      productList.set(productList.indexOf(p), p);
    }

    log.info("최근 3건 챌린지 넘어왔니? : " + challengeList);

    model.addAttribute("challengeList", challengeList);

    // 환경 일기 조회
      ArrayList<Diary> diaryList = diaryService.mainDiaryList();

     model.addAttribute("diaryList", diaryList);

    model.addAttribute("productList", productList);
    return "fo/common/main";
  }

  @RequestMapping("information")
  public String information() {
    return "fo/common/information";
  }

}
