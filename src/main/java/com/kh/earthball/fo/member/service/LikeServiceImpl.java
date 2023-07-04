package com.kh.earthball.fo.member.service;

import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.kh.earthball.bo.product.mapper.AdminProductMapper;
import com.kh.earthball.bo.product.service.AdminProductServiceImpl;
import com.kh.earthball.fo.member.mapper.LikeMapper;
import com.kh.earthball.fo.member.vo.Like;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
public class LikeServiceImpl implements LikeService {

  private final LikeMapper likeMapper;

  @Transactional
  @Override
  public int insertLike(int productNo, String memberId) {
    return likeMapper.insertLike(productNo, memberId);
  }

  @Override
  public int likeStatus(String memberId, int productNo) {
    return likeMapper.likeStatus(memberId, productNo);
  }

  @Transactional
  @Override
  public int deleteLike(int productNo, String memberId) {
    return likeMapper.deleteLike(productNo, memberId);
  }

  @Override
  public ArrayList<Like> selectList(String memberId) {
    System.out.println(memberId);
    return likeMapper.selectList(memberId);
  }

  @Override
  public int selectLikeCount(int productNo) {
    return likeMapper.selectLikeCount(productNo);
  }

}
