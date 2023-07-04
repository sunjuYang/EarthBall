package com.kh.earthball.fo.member.service;

import java.util.ArrayList;
import com.kh.earthball.fo.member.vo.Like;

public interface LikeService {

  int insertLike(int productNo, String memberId);
  int deleteLike(int productNo, String memberId);
  int likeStatus(String memberId, int productNo);
  ArrayList<Like> selectList(String memberId);
  int selectLikeCount(int productNo);

}
