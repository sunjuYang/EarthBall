package com.kh.earthball.fo.product.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import com.kh.earthball.fo.product.vo.Review;

@Mapper
public interface ReviewMapper {

  int insertReview(Review r);

  ArrayList<Review> selectList(int productNo);

  ArrayList<Review> selectPhotoList(int productNo);

  int insertReply(Review r);

  int updateReviewCount(int reviewNo);

  ArrayList<Review> selectReplyList(int reviewNo);

  ArrayList<Review> selectTopList(int productNo);

  int selectReviewCount(int productNo);
}
