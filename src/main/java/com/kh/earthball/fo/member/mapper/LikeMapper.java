package com.kh.earthball.fo.member.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.kh.earthball.fo.member.vo.Like;

@Mapper
public interface LikeMapper {

  int insertLike(@Param("productNo")int productNo, @Param("memberId") String memberId);

  int deleteLike(@Param("productNo")int productNo, @Param("memberId") String memberId);

  int likeStatus(@Param("memberId") String memberId, @Param("productNo") int productNo);

  ArrayList<Like> selectList(String memberId);

  int selectLikeCount(int productNo);

}
