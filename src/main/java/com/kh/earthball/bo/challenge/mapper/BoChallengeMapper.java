package com.kh.earthball.bo.challenge.mapper;

import com.kh.earthball.bo.challenge.vo.BoChallenge;
import com.kh.earthball.bo.challenge.vo.BoConfirm;
import com.kh.earthball.bo.challenge.vo.SearchParameters;
import com.kh.earthball.fo.challenge.vo.ChConfirm;
import com.kh.earthball.fo.common.vo.PageInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BoChallengeMapper {

  int ChallengeListCount();

  List<BoChallenge> selectChallengeList(@Param("offset") int offset, @Param("limit") int limit);

  BoChallenge selectChallenge(int chNo);

  int deleteChallenge(int chNo);

  int searchChallengeListCount(String keyword);

  List<BoChallenge> searchChallenge(SearchParameters searchParameters);
}
