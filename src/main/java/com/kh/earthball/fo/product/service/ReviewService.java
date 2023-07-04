package com.kh.earthball.fo.product.service;

import java.util.ArrayList;
import com.kh.earthball.fo.product.vo.Review;

public interface ReviewService {

  int insertReview(Review r);

  ArrayList<Review> selectList(int productNo);

  ArrayList<Review> selectPhotoList(int productNo);

  int insertReply(Review r);

  int updateReviewCount(int reviewNo);

  ArrayList<Review> selectReplyList(int reviewNo);

  ArrayList<Review> selectTopList(int productNo);

  int selectReviewCount(int productNo);
}
