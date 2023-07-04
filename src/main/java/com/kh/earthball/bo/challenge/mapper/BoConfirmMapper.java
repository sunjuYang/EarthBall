package com.kh.earthball.bo.challenge.mapper;

import com.kh.earthball.bo.challenge.vo.BoConfirm;
import com.kh.earthball.bo.challenge.vo.BoDetailInfo;
import com.kh.earthball.bo.challenge.vo.SearchParameters;
import com.kh.earthball.fo.challenge.vo.ChConfirm;
import com.kh.earthball.fo.common.vo.PageInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BoConfirmMapper {

  int ConfirmListCount();

  List<BoConfirm> selectConfirmList(@Param("offset") int offset, @Param("limit") int limit);

  BoConfirm selectConfirm(int chConNo);

  int deleteConfirm(BoConfirm boConfirm);

  int deleteDetailInfo(BoConfirm boConfirm);

  int searchConfirmListCount(String keyword);

  int searchDetailListCount(String keyword);

  List<BoConfirm> searchConfirm(SearchParameters searchParameters);

  List<BoConfirm> searchDetail(SearchParameters searchParameters);
}
